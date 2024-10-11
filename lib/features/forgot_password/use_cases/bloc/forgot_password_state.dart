part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.isLoading = false,
    this.email = const EmailValidator.pure(),
  });

  final bool isLoading;
  final EmailValidator email;

  @override
  List<Object> get props => [isLoading, email];

  ForgotPasswordState copyWith({
    bool? isLoading,
    EmailValidator? email,
  }) {
    return ForgotPasswordState(
      isLoading: isLoading ?? this.isLoading,
      email: email ?? this.email,
    );
  }
}
