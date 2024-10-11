part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  const FavoriteState({
    this.items = const [],
    this.isLoading = false,
  });

  final List<FlowerEntity> items;
  final bool isLoading;

  @override
  List<Object> get props => [items, isLoading];

  FavoriteState copyWith({
    List<FlowerEntity>? items,
    bool? isLoading,
  }) {
    return FavoriteState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
