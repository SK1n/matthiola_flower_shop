import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matthiola_flower_shop/core/constants/shared_prefs_constants.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/domain/models/flower/flower_entity.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_shared_prefs_repository.dart';
import 'package:matthiola_flower_shop/features/home/use_cases/home_bloc.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc
    extends SideEffectBloc<FavoriteEvent, FavoriteState, BaseCommand> {
  FavoriteBloc(
    this.repository,
    this._homeBloc,
  ) : super(const FavoriteState()) {
    on<_GetFavoriteEvent>(_onGetFavoriteEvent);
    on<SaveFavoriteEvent>(_onSaveFavoriteEvent);
    on<DeleteFavoriteEvent>(_onDeleteFavoriteEvent);
    on<FavoritePressedEvent>(_onFavoritePressedEvent);
    on<_SubscribeToUserEvent>(_onSubscribeToUserEvent);
    add(const _SubscribeToUserEvent());
    add(const _GetFavoriteEvent());
  }

  final ISharedPrefsRepository repository;
  final HomeBloc _homeBloc;

  Future<void> _onSubscribeToUserEvent(
    _SubscribeToUserEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    // ignore: unused_local_variable
    await for (final user in _homeBloc.stream) {
      add(const _GetFavoriteEvent());
    }
  }

  void _onGetFavoriteEvent(
    _GetFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    final uid = _homeBloc.state.user.uid;
    final result =
        repository.readMapList(SharedPrefsConstants.FLOWERS_KEY(uid));
    if (result.isError()) {
      emit(state.copyWith(isLoading: false));
      return;
    }
    final resultData = result.tryGetSuccess()!;
    final data = resultData.map(FlowerEntity.fromJson).toList();
    emit(state.copyWith(items: data, isLoading: false));
  }

  Future<void> _onSaveFavoriteEvent(
    SaveFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final data = [...state.items, event.item];
    final map = data.map((element) => element.toJson()).toList();
    final uid = _homeBloc.state.user.uid;
    final result = await repository.writeMapList(
      SharedPrefsConstants.FLOWERS_KEY(uid),
      map,
    );
    if (result.isError()) {
      emit(state.copyWith(isLoading: false));

      return produceSideEffect(BaseCommand.failure(result.tryGetError()!));
    }
    emit(state.copyWith(isLoading: false, items: data));
  }

  Future<void> _onDeleteFavoriteEvent(
    DeleteFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final data = state.items
      ..removeWhere((element) => element.id == event.item.id);
    final map = data.map((element) => element.toJson()).toList();
    final uid = _homeBloc.state.user.uid;
    final result = await repository.writeMapList(
      SharedPrefsConstants.FLOWERS_KEY(uid),
      map,
    );
    if (result.isError()) {
      emit(state.copyWith(isLoading: false));

      return produceSideEffect(BaseCommand.failure(result.tryGetError()!));
    }
    emit(state.copyWith(isLoading: false, items: data));
  }

  Future<void> _onFavoritePressedEvent(
    FavoritePressedEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    produceSideEffect(BaseCommand.go(FlowerDetailsRoute(event.id)));
  }
}
