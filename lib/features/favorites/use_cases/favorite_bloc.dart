import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matthiola_flower_shop/core/constants/shared_prefs_constants.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/domain/models/flower/flower_entity.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_shared_prefs_repository.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc
    extends SideEffectBloc<FavoriteEvent, FavoriteState, BaseCommand> {
  FavoriteBloc(
    this.repository,
  ) : super(const FavoriteState()) {
    on<_GetFavoriteEvent>(_onGetFavoriteEvent);
    on<SaveFavoriteEvent>(_onSaveFavoriteEvent);
    on<DeleteFavoriteEvent>(_onDeleteFavoriteEvent);
    on<FavoritePressedEvent>(_onFavoritePressedEvent);
    add(const _GetFavoriteEvent());
  }

  final ISharedPrefsRepository repository;

  void _onGetFavoriteEvent(
    _GetFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    final result = repository.readMapList(SharedPrefsConstants.FLOWERS_KEY);
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
    final result =
        await repository.writeMapList(SharedPrefsConstants.FLOWERS_KEY, map);
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
    final result =
        await repository.writeMapList(SharedPrefsConstants.FLOWERS_KEY, map);
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
