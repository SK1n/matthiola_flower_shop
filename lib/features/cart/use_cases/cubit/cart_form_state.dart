part of 'cart_form_cubit.dart';

class CartFormState extends Equatable with FormzMixin {
  CartFormState({
    this.email = const EmailValidator.pure(),
    this.username = const RequiredValidator.pure(),
    this.address = const RequiredValidator.pure(),
    this.phone = const PhoneValidator.pure(),
    this.isLoading = false,
    TextEditingController? addressController,
    TextEditingController? emailController,
    TextEditingController? phoneController,
    TextEditingController? usernameController,
  })  : addressController =
            addressController ?? TextEditingController(text: address.value),
        emailController =
            emailController ?? TextEditingController(text: email.value),
        phoneController =
            phoneController ?? TextEditingController(text: phone.value),
        usernameController =
            usernameController ?? TextEditingController(text: username.value);

  final RequiredValidator address;
  final EmailValidator email;
  final PhoneValidator phone;
  final RequiredValidator username;
  final TextEditingController addressController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController usernameController;
  final bool isLoading;

  @override
  List<FormzInput<dynamic, dynamic>> get inputs =>
      [address, email, phone, username];

  @override
  List<Object> get props => [
        address,
        email,
        phone,
        username,
        isLoading,
        addressController,
        emailController,
        phoneController,
        usernameController,
      ];

  CartFormState copyWith({
    RequiredValidator? address,
    EmailValidator? email,
    PhoneValidator? phone,
    RequiredValidator? username,
    TextEditingController? addressController,
    TextEditingController? emailController,
    TextEditingController? phoneController,
    TextEditingController? usernameController,
    bool? isLoading,
  }) {
    return CartFormState(
      address: address ?? this.address,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      username: username ?? this.username,
      addressController: addressController ?? this.addressController,
      emailController: emailController ?? this.emailController,
      phoneController: phoneController ?? this.phoneController,
      usernameController: usernameController ?? this.usernameController,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
