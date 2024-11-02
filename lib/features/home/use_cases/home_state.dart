part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.isLoading = false,
    this.filteredData = const [],
    this.potData = const [],
    this.stemData = const [],
    this.accessoriesData = const [],
    this.choiceChipSelectedItem = 0,
    this.query = '',
    this.user = UserEntity.empty,
  });

  final bool isLoading;
  final List<FlowerEntity> stemData;
  final List<FlowerEntity> potData;
  final List<FlowerEntity> accessoriesData;
  final List<FlowerEntity> filteredData;
  final int choiceChipSelectedItem;
  final String query;
  final UserEntity user;

  @override
  List<Object> get props => [
        isLoading,
        stemData,
        potData,
        accessoriesData,
        filteredData,
        choiceChipSelectedItem,
        query,
        user,
      ];

  HomeState copyWith({
    bool? isLoading,
    List<FlowerEntity>? stemData,
    List<FlowerEntity>? potData,
    List<FlowerEntity>? accessoriesData,
    List<FlowerEntity>? filteredData,
    int? choiceChipSelectedItem,
    String? query,
    UserEntity? user,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      stemData: stemData ?? this.stemData,
      potData: potData ?? this.potData,
      accessoriesData: accessoriesData ?? this.accessoriesData,
      filteredData: filteredData ?? this.filteredData,
      choiceChipSelectedItem:
          choiceChipSelectedItem ?? this.choiceChipSelectedItem,
      query: query ?? this.query,
      user: user ?? this.user,
    );
  }
}
