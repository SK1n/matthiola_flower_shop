part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  const FavoriteState({
    this.items = const [],
    this.isLoading = false,
    this.isAnonymous = false,
  });

  final List<FlowerEntity> items;
  final bool isLoading;
  final bool isAnonymous;

  @override
  List<Object> get props => [items, isLoading, isAnonymous];

  FavoriteState copyWith({
    List<FlowerEntity>? items,
    bool? isLoading,
    bool? isAnonymous,
  }) {
    return FavoriteState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      isAnonymous: isAnonymous ?? this.isAnonymous,
    );
  }
}
