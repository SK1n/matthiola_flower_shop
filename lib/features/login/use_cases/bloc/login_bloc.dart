import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:matthiola_flower_shop/core/validators/email_validator.dart';
import 'package:matthiola_flower_shop/core/validators/password_validator.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_auth_repository.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends SideEffectBloc<LoginEvent, LoginState, BaseCommand> {
  LoginBloc(
    this.auth,
  ) : super(const LoginState()) {
    on<LoginRequestedEvent>(_onLoginRequestEvent);
    on<EmailChangedEvent>(_onEmailChangedEvent);
    on<PasswordChangedEvent>(_onPasswordChangedEvent);
    on<TogglePasswordVisibilityEvent>(_onTogglePasswordVisibilityEvent);
    on<RedirectEvent>(_onRedirectEvent);
  }

  final IAuthRepository auth;

  void _onEmailChangedEvent(
    EmailChangedEvent event,
    Emitter<LoginState> emit,
  ) {
    final value = EmailValidator.dirty(event.email);
    emit(state.copyWith(email: value));
  }

  void _onPasswordChangedEvent(
    PasswordChangedEvent event,
    Emitter<LoginState> emit,
  ) {
    final value = PasswordValidator.dirty((event.password, event.password));
    emit(state.copyWith(password: value));
  }

  void _onTogglePasswordVisibilityEvent(
    TogglePasswordVisibilityEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  Future<void> _onLoginRequestEvent(
    LoginRequestedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final result = await auth.login(
        state.email.value,
        state.password.value.$1,
      );
      if (result.isError()) {
        return produceSideEffect(BaseCommand.failure(result.tryGetError()!));
      }
      produceSideEffect(BaseCommand.pop());
    } catch (e) {
      produceSideEffect(BaseCommand.failure(Failure(error: e.toString())));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onRedirectEvent(
    RedirectEvent event,
    Emitter<LoginState> emit,
  ) {
    produceSideEffect(BaseCommand.go(event.data));
  }
}
