part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class _GetFavoriteEvent extends FavoriteEvent {
  const _GetFavoriteEvent();
}

class _SubscribeToUserEvent extends FavoriteEvent {
  const _SubscribeToUserEvent();
}

class SaveFavoriteEvent extends FavoriteEvent {
  const SaveFavoriteEvent(this.item);
  final FlowerEntity item;
  @override
  List<Object> get props => [item];
}

class DeleteFavoriteEvent extends FavoriteEvent {
  const DeleteFavoriteEvent(this.item);
  final FlowerEntity item;
  @override
  List<Object> get props => [item];
}

class FavoritePressedEvent extends FavoriteEvent {
  const FavoritePressedEvent(this.id);
  final String id;

  @override
  List<Object> get props => [id];
}
