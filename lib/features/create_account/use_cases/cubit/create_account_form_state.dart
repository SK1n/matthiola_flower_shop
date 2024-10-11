part of 'create_account_form_cubit.dart';

class CreateAccountFormState extends Equatable {
  const CreateAccountFormState({
    this.email = const EmailValidator.pure(),
    this.password = const PasswordValidator.pure(),
    this.rePassword = const RePasswordValidator.pure(),
    this.username = const RequiredValidator.pure(),
    this.address = const RequiredValidator.pure(),
    this.phone = const PhoneValidator.pure(),
    this.showPassword = false,
  });

  final EmailValidator email;
  final PasswordValidator password;
  final RePasswordValidator rePassword;
  final RequiredValidator username;
  final RequiredValidator address;
  final PhoneValidator phone;
  final bool showPassword;

  @override
  List<Object> get props => [
        email,
        password,
        rePassword,
        username,
        address,
        phone,
        showPassword,
      ];

  CreateAccountFormState copyWith({
    EmailValidator? email,
    PasswordValidator? password,
    RePasswordValidator? rePassword,
    RequiredValidator? username,
    RequiredValidator? address,
    PhoneValidator? phone,
    bool? showPassword,
  }) {
    return CreateAccountFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
      username: username ?? this.username,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
