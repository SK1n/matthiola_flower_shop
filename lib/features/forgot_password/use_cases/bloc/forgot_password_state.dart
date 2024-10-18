part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.isLoading = false,
    this.email = const EmailValidator.pure(),
    this.formIsValid = false,
  });

  final bool isLoading;
  final bool formIsValid;
  final EmailValidator email;

  @override
  List<Object> get props => [isLoading, email, formIsValid];

  ForgotPasswordState copyWith({
    bool? isLoading,
    bool? formIsValid,
    EmailValidator? email,
  }) {
    return ForgotPasswordState(
      isLoading: isLoading ?? this.isLoading,
      formIsValid: formIsValid ?? this.formIsValid,
      email: email ?? this.email,
    );
  }
}
