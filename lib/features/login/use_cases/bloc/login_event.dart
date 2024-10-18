part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginRequestedEvent extends LoginEvent {
  const LoginRequestedEvent();
}

class LoginCreateAccountTappedEvent extends LoginEvent {
  const LoginCreateAccountTappedEvent();
}

class LoginForgotPasswordTappedEvent extends LoginEvent {
  const LoginForgotPasswordTappedEvent();
}

class _SubscribeToForm extends LoginEvent {
  const _SubscribeToForm();
}
