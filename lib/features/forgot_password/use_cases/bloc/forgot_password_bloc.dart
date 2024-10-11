import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:matthiola_flower_shop/core/validators/email_validator.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_auth_repository.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends SideEffectBloc<ForgotPasswordEvent,
    ForgotPasswordState, BaseCommand> {
  ForgotPasswordBloc(this.auth) : super(const ForgotPasswordState()) {
    on<ForgotPasswordSubmitEvent>(_onForgotPasswordSubmitEvent);
    on<ForgotPasswordUpdateEmail>(_onForgotPasswordUpdateEmail);
  }

  final IAuthRepository auth;

  void _onForgotPasswordUpdateEmail(
    ForgotPasswordUpdateEmail event,
    Emitter<ForgotPasswordState> emit,
  ) {
    final value = EmailValidator.dirty(event.value);
    emit(state.copyWith(email: value));
  }

  Future<void> _onForgotPasswordSubmitEvent(
    ForgotPasswordSubmitEvent event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    if (state.email.isNotValid) {
      emit(state.copyWith(email: EmailValidator.dirty(state.email.value)));
      return;
    }
    emit(state.copyWith(isLoading: true));
    try {
      final result = await auth.sendResetPasswordEmail(state.email.value);
      if (result.isError()) {
        return produceSideEffect(BaseCommand.failure(result.tryGetError()!));
      }
      produceSideEffect(
        BaseCommand.success(
          t.reset_password.emailSent(value: state.email.value),
        ),
      );
      produceSideEffect(BaseCommand.pop());
    } catch (e) {
      produceSideEffect(BaseCommand.failure(Failure(error: e.toString())));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
