part of 'create_account_form_cubit.dart';

class CreateAccountFormState extends Equatable {
  const CreateAccountFormState({
    this.email = const EmailValidator.pure(),
    this.password = const PasswordValidator.pure(),
    this.username = const RequiredValidator.pure(),
    this.address = const RequiredValidator.pure(),
    this.phone = const PhoneValidator.pure(),
    this.showPassword = false,
    this.formIsValid = false,
  });

  final EmailValidator email;
  final PasswordValidator password;
  final RequiredValidator username;
  final RequiredValidator address;
  final PhoneValidator phone;
  final bool showPassword;
  final bool formIsValid;

  @override
  List<Object> get props => [
        email,
        password,
        username,
        address,
        phone,
        showPassword,
        formIsValid,
      ];

  CreateAccountFormState copyWith({
    EmailValidator? email,
    PasswordValidator? password,
    RequiredValidator? username,
    RequiredValidator? address,
    PhoneValidator? phone,
    bool? showPassword,
    bool? formIsValid,
  }) {
    return CreateAccountFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      showPassword: showPassword ?? this.showPassword,
      formIsValid: formIsValid ?? this.formIsValid,
    );
  }
}
