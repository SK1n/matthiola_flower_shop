part of 'login_bloc.dart';

class LoginState extends Equatable with FormzMixin {
  const LoginState({
    this.isLoading = false,
    this.showPassword = false,
    this.email = const EmailValidator.pure(),
    this.password = const PasswordValidator.pure(),
  });

  final bool isLoading;
  final bool showPassword;

  final EmailValidator email;
  final PasswordValidator password;

  @override
  List<Object> get props => [isLoading, showPassword, email, password];

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email, password];

  LoginState copyWith({
    bool? isLoading,
    bool? showPassword,
    EmailValidator? email,
    PasswordValidator? password,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      showPassword: showPassword ?? this.showPassword,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
