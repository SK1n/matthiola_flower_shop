part of 'cart_bloc.dart';

class CartState extends Equatable with FormzMixin {
  const CartState({
    this.items = const [],
    this.userId = '',
    this.totalPrice = 0.0,
    this.isLoading = false,
    this.email = const EmailValidator.pure(),
    this.username = const RequiredValidator.pure(),
    this.address = const RequiredValidator.pure(),
    this.phone = const PhoneValidator.pure(),
  });

  final List<CartEntity> items;
  final String userId;
  final double totalPrice;
  final bool isLoading;

  final RequiredValidator address;
  final EmailValidator email;
  final PhoneValidator phone;
  final RequiredValidator username;

  @override
  List<Object> get props =>
      [items, totalPrice, isLoading, address, email, phone, username, userId];
  @override
  List<FormzInput<dynamic, dynamic>> get inputs =>
      [address, email, phone, username];

  CartState copyWith({
    List<CartEntity>? items,
    String? userId,
    double? totalPrice,
    bool? isLoading,
    RequiredValidator? address,
    EmailValidator? email,
    PhoneValidator? phone,
    RequiredValidator? username,
  }) {
    return CartState(
      items: items ?? this.items,
      userId: userId ?? this.userId,
      totalPrice: totalPrice ?? this.totalPrice,
      isLoading: isLoading ?? this.isLoading,
      address: address ?? this.address,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      username: username ?? this.username,
    );
  }
}
