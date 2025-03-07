part of 'cart_bloc.dart';

class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class _SubscribeToUser extends CartEvent {
  const _SubscribeToUser();
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

class RecyclePressed extends CartEvent {
  const RecyclePressed(this.item);
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

class EmailChangedEvent extends CartEvent {
  const EmailChangedEvent(this.email);
  final String email;

  @override
  List<Object> get props => [email];
}

class UsernameChangedEvent extends CartEvent {
  const UsernameChangedEvent(this.username);
  final String username;

  @override
  List<Object> get props => [username];
}

class AddressChangedEvent extends CartEvent {
  const AddressChangedEvent(this.address);
  final String address;

  @override
  List<Object> get props => [address];
}

class PhoneChangedEvent extends CartEvent {
  const PhoneChangedEvent(this.phone);
  final String phone;

  @override
  List<Object> get props => [phone];
}

class SubmitCartEvent extends CartEvent {
  const SubmitCartEvent();
}
