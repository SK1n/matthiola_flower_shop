part of 'home_scaffold_bloc.dart';

sealed class HomeScaffoldEvent extends Equatable {
  const HomeScaffoldEvent();

  @override
  List<Object> get props => [];
}

class ShellIndexChangedEvent extends HomeScaffoldEvent {
  const ShellIndexChangedEvent(this.index, this.navigationShell);
  final int index;
  final StatefulNavigationShell navigationShell;

  @override
  List<Object> get props => [index, navigationShell];
}
