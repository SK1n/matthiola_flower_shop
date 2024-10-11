part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetFlowerData extends HomeEvent {
  const GetFlowerData();
}

class HomeFlowerTypeChanged extends HomeEvent {
  const HomeFlowerTypeChanged(this.index);

  final int index;
  @override
  List<Object> get props => [index];
}

class HomeOnSearchEvent extends HomeEvent {
  const HomeOnSearchEvent(this.query);

  final String query;
  @override
  List<Object> get props => [query];
}

class HomeOnFlowerTappedEvent extends HomeEvent {
  const HomeOnFlowerTappedEvent(this.id);
  final String id;

  @override
  List<Object> get props => [id];
}

class HomeClearQueryEvent extends HomeEvent {
  const HomeClearQueryEvent();
}

class _GetUserData extends HomeEvent {
  const _GetUserData();
}

class SignOutEvent extends HomeEvent {
  const SignOutEvent();
}

class DeleteAccountEvent extends HomeEvent {
  const DeleteAccountEvent();
}
