part of 'login_form_cubit.dart';

class LoginFormState extends Equatable {
  const LoginFormState({
    this.email = const EmailValidator.pure(),
    this.password = const PasswordValidator.pure(),
    this.showPassword = false,
  });

  final EmailValidator email;
  final PasswordValidator password;
  final bool showPassword;

  @override
  List<Object> get props => [email, password, showPassword];

  LoginFormState copyWith({
    EmailValidator? email,
    PasswordValidator? password,
    bool? showPassword,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
