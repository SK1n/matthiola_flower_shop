part of 'flower_details_bloc.dart';

class FlowerDetailsState extends Equatable {
  const FlowerDetailsState({
    this.isLoading = false,
    this.quantity = 0,
    this.item = FlowerEntity.empty,
  });

  final bool isLoading;
  final int quantity;
  final FlowerEntity item;

  @override
  List<Object> get props => [isLoading, item, quantity];

  FlowerDetailsState copyWith({
    bool? isLoading,
    int? quantity,
    FlowerEntity? item,
  }) {
    return FlowerDetailsState(
      isLoading: isLoading ?? this.isLoading,
      quantity: quantity ?? this.quantity,
      item: item ?? this.item,
    );
  }
}
