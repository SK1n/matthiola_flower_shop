part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState({
    this.items = const [],
    this.totalPrice = 0.0,
    this.isLoading = false,
  });

  final List<CartEntity> items;
  final double totalPrice;
  final bool isLoading;

  @override
  List<Object> get props => [items, totalPrice, isLoading];

  CartState copyWith({
    List<CartEntity>? items,
    double? totalPrice,
    bool? isLoading,
  }) {
    return CartState(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
