part of 'flower_details_bloc.dart';

sealed class FlowerDetailsEvent extends Equatable {
  const FlowerDetailsEvent();

  @override
  List<Object> get props => [];
}

class FlowerDetailsGetEvent extends FlowerDetailsEvent {
  const FlowerDetailsGetEvent(this.id);
  final String id;
  @override
  List<Object> get props => [id];
}

class FlowerDetailsAddEvent extends FlowerDetailsEvent {
  const FlowerDetailsAddEvent(this.quantity);
  final int quantity;
  @override
  List<Object> get props => [quantity];
}

class FlowerDetailsRemoveEvent extends FlowerDetailsEvent {
  const FlowerDetailsRemoveEvent(this.quantity);
  final int quantity;
  @override
  List<Object> get props => [quantity];
}
