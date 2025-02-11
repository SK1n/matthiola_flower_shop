part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginRequestedEvent extends LoginEvent {
  const LoginRequestedEvent();
}

class RedirectEvent extends LoginEvent {
  const RedirectEvent(this.data);

  final GoRouteData data;

  @override
  List<Object> get props => [data];
}

class EmailChangedEvent extends LoginEvent {
  const EmailChangedEvent(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChangedEvent extends LoginEvent {
  const PasswordChangedEvent(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class TogglePasswordVisibilityEvent extends LoginEvent {
  const TogglePasswordVisibilityEvent();
}
