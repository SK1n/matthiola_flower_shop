part of 'home_bloc.dart';

class HomeState extends Equatable {
  HomeState({
    this.isLoading = false,
    this.isAnonymous = false,
    this.filteredData = const [],
    this.potData = const [],
    this.stemData = const [],
    this.accessoriesData = const [],
    this.choiceChipSelectedItem = 0,
    this.query = '',
    this.controllerIndex = 0,
    this.user = UserEntity.empty,
    List<Query<FlowerEntity>>? firestoreQuery,
  }) : firestoreQuery = firestoreQuery ??
            [
              _createQuery(0),
              _createQuery(1),
              _createQuery(2),
            ];

  final bool isLoading;
  final bool isAnonymous;
  final List<FlowerEntity> stemData;
  final List<FlowerEntity> potData;
  final List<FlowerEntity> accessoriesData;
  final List<FlowerEntity> filteredData;
  final int choiceChipSelectedItem;
  final List<Query<FlowerEntity>> firestoreQuery;
  final String query;
  final UserEntity user;
  final int controllerIndex;

  @override
  List<Object> get props => [
        isLoading,
        stemData,
        potData,
        accessoriesData,
        filteredData,
        choiceChipSelectedItem,
        query,
        isAnonymous,
        user,
        controllerIndex,
      ];

  HomeState copyWith({
    bool? isLoading,
    bool? isAnonymous,
    List<FlowerEntity>? stemData,
    List<FlowerEntity>? potData,
    List<FlowerEntity>? accessoriesData,
    List<FlowerEntity>? filteredData,
    int? choiceChipSelectedItem,
    List<Query<FlowerEntity>>? firestoreQuery,
    String? query,
    UserEntity? user,
    int? controllerIndex,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      stemData: stemData ?? this.stemData,
      potData: potData ?? this.potData,
      accessoriesData: accessoriesData ?? this.accessoriesData,
      filteredData: filteredData ?? this.filteredData,
      choiceChipSelectedItem:
          choiceChipSelectedItem ?? this.choiceChipSelectedItem,
      firestoreQuery: firestoreQuery ?? this.firestoreQuery,
      query: query ?? this.query,
      user: user ?? this.user,
      controllerIndex: controllerIndex ?? this.controllerIndex,
    );
  }

  static Query<FlowerEntity> _createQuery(int type) {
    return FirebaseFirestore.instance
        .collection(FirestoreConstants.FLOWERS_COLLECTION)
        .where(AppConstants.QUERY_QUANTITY, isGreaterThan: 0)
        .where(AppConstants.QUERY_TYPE, isEqualTo: type)
        .withConverter<FlowerEntity>(
          fromFirestore: (doc, _) => FlowerEntity.fromJson(doc.data()!),
          toFirestore: (flower, _) => flower.toJson(),
        );
  }
}
