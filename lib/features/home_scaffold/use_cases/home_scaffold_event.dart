part of 'home_scaffold_bloc.dart';

sealed class HomeScaffoldEvent extends Equatable {
  const HomeScaffoldEvent();

  @override
  List<Object> get props => [];
}

class HomeScaffoldOnDestinationSelectedEvent extends HomeScaffoldEvent {
  const HomeScaffoldOnDestinationSelectedEvent(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}
