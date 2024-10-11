part of 'cart_bloc.dart';

class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  const AddToCart(this.item, {this.showDialog = true});
  final CartEntity item;
  final bool showDialog;

  @override
  List<Object> get props => [item, showDialog];
}

class RemoveFromCart extends CartEvent {
  const RemoveFromCart(this.item);
  final CartEntity item;

  @override
  List<Object> get props => [item];
}

class _CalculateTotalPriceEvent extends CartEvent {
  const _CalculateTotalPriceEvent();
}

class _EmitAndSaveCartEvent extends CartEvent {
  const _EmitAndSaveCartEvent(this.cart);
  final List<CartEntity> cart;

  @override
  List<Object> get props => [cart];
}

class ClearCartEvent extends CartEvent {
  const ClearCartEvent();
}

class _InitialEvent extends CartEvent {
  const _InitialEvent();
}

class CartHasErrorEvent extends CartEvent {
  const CartHasErrorEvent(this.error);
  final List<OrderResponse> error;

  @override
  List<Object> get props => [error];
}

class SubmitCartEvent extends CartEvent {
  const SubmitCartEvent();
}
