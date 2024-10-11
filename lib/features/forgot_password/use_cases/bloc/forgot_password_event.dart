part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordSubmitEvent extends ForgotPasswordEvent {
  const ForgotPasswordSubmitEvent();
}

class ForgotPasswordUpdateEmail extends ForgotPasswordEvent {
  const ForgotPasswordUpdateEmail(this.value);
  final String value;

  @override
  List<Object> get props => [value];
}
