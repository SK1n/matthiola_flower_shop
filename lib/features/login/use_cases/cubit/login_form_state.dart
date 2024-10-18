// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_form_cubit.dart';

class LoginFormState extends Equatable {
  const LoginFormState({
    this.email = const EmailValidator.pure(),
    this.password = const PasswordValidator.pure(),
    this.showPassword = false,
    this.formIsValid = false,
  });

  final EmailValidator email;
  final PasswordValidator password;
  final bool showPassword;
  final bool formIsValid;

  @override
  List<Object> get props => [email, password, showPassword, formIsValid];

  LoginFormState copyWith({
    EmailValidator? email,
    PasswordValidator? password,
    bool? showPassword,
    bool? formIsValid,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
      formIsValid: formIsValid ?? this.formIsValid,
    );
  }
}
