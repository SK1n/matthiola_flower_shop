part of 'home_scaffold_bloc.dart';

class HomeScaffoldState extends Equatable {
  const HomeScaffoldState({
    this.index = 1,
  });

  final int index;

  @override
  List<Object> get props => [index];

  HomeScaffoldState copyWith({
    int? index,
  }) {
    return HomeScaffoldState(
      index: index ?? this.index,
    );
  }
}
