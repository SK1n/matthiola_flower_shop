import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_auth_repository.dart';
import 'package:matthiola_flower_shop/features/login/use_cases/cubit/login_form_cubit.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends SideEffectBloc<LoginEvent, LoginState, BaseCommand> {
  LoginBloc(
    this.auth,
    this.form,
  ) : super(const LoginState()) {
    on<LoginRequestedEvent>(_onLoginRequestEvent);
    on<LoginCreateAccountTappedEvent>(_onLoginCreateAccountTappedEvent);
    on<LoginForgotPasswordTappedEvent>(_onLoginForgotPasswordTappedEvent);
    on<_SubscribeToForm>(_onSubscribeToForm);
    add(const _SubscribeToForm());
  }

  final IAuthRepository auth;
  final LoginFormCubit form;

  Future<void> _onSubscribeToForm(
    _SubscribeToForm event,
    Emitter<LoginState> emit,
  ) async {
    await for (final data in form.stream) {
      form.isValid();
      emit(state.copyWith(formIsValid: data.formIsValid));
    }
  }

  Future<void> _onLoginRequestEvent(
    LoginRequestedEvent event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.formIsValid) return;
    emit(state.copyWith(isLoading: true));
    try {
      final result = await auth.login(
        form.state.email.value,
        form.state.password.value.$1,
      );
      if (result.isError()) {
        return produceSideEffect(BaseCommand.failure(result.tryGetError()!));
      }
      produceSideEffect(BaseCommand.go(const HomeScaffoldRoute()));
    } catch (e) {
      produceSideEffect(BaseCommand.failure(Failure(error: e.toString())));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onLoginCreateAccountTappedEvent(
    LoginCreateAccountTappedEvent event,
    Emitter<LoginState> emit,
  ) async {
    produceSideEffect(BaseCommand.go(const CreateAccountRoute()));
  }

  void _onLoginForgotPasswordTappedEvent(
    LoginForgotPasswordTappedEvent event,
    Emitter<LoginState> emit,
  ) {
    produceSideEffect(BaseCommand.go(const ForgotPasswordRoute()));
  }
}
