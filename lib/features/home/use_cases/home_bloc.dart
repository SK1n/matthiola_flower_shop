import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';
import 'package:matthiola_flower_shop/core/constants/error_codes.dart';
import 'package:matthiola_flower_shop/core/constants/firestore_constants.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:matthiola_flower_shop/core/utils/flower_type.dart';
import 'package:matthiola_flower_shop/domain/models/flower/flower_entity.dart';
import 'package:matthiola_flower_shop/domain/models/user/user_entity.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_auth_repository.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_repository.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends SideEffectBloc<HomeEvent, HomeState, BaseCommand> {
  HomeBloc(
    this.repository,
    this.auth,
  ) : super(const HomeState()) {
    on<GetFlowerData>(_onGetFlowerData);
    on<HomeFlowerTypeChanged>(_onFlowerTypeChanged);
    on<HomeOnSearchEvent>(_onHomeOnSearchEvent);
    on<HomeOnFlowerTappedEvent>(_onHomeOnFlowerTappedEvent);
    on<HomeClearQueryEvent>(_onHomeClearQueryEvent);
    on<_GetUserData>(_onGetUserData);
    on<SignOutEvent>(_onSignOutEvent);
    on<DeleteAccountEvent>(_onDeleteAccountEvent);
    on<OnCartTappedEvent>(_onOnCartTappedEvent);
    add(const GetFlowerData());
    add(const _GetUserData());
  }

  final IRepository<FlowerEntity> repository;
  final IAuthRepository auth;
  bool _canRefresh = true;

  Future<void> _onGetFlowerData(
    GetFlowerData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    if (!_canRefresh) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      return emit(state.copyWith(isLoading: false));
    }
    Timer(const Duration(minutes: 2), () {
      _canRefresh = true;
    });

    _canRefresh = false;
    try {
      final result =
          await repository.getList(FirestoreConstants.FLOWERS_COLLECTION);
      if (result.isError()) {
        return produceSideEffect(BaseCommand.failure(result.tryGetError()!));
      }
      final data = result.tryGetSuccess()!;
      final stemData = data
          .where(
            (flower) => FlowerType.fromCode(flower.type) == FlowerType.thread,
          )
          .toList();
      final potData = data
          .where(
            (flower) => FlowerType.fromCode(flower.type) == FlowerType.pot,
          )
          .toList();
      final accessoriesData = data
          .where(
            (flower) =>
                FlowerType.fromCode(flower.type) == FlowerType.accessory,
          )
          .toList();
      emit(
        state.copyWith(
          stemData: stemData,
          potData: potData,
          accessoriesData: accessoriesData,
        ),
      );
    } on Exception catch (e) {
      produceSideEffect(BaseCommand.failure(Failure(error: e.toString())));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onFlowerTypeChanged(
    HomeFlowerTypeChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(choiceChipSelectedItem: event.index));
  }

  void _onHomeOnSearchEvent(
    HomeOnSearchEvent event,
    Emitter<HomeState> emit,
  ) {
    final query = event.query;
    emit(state.copyWith(query: query));
    if (query.isEmpty) {
      return emit(state.copyWith(filteredData: []));
    }
    final data = [
      ...state.potData,
      ...state.stemData,
      ...state.accessoriesData,
    ];
    final queryData = extractAllSorted<FlowerEntity>(
      query: query,
      choices: data,
      getter: (flower) => flower.name,
      cutoff: 50,
    ).toList();
    final dataToEmit = queryData.map((element) => element.choice).toList();
    if (dataToEmit.isEmpty) {
      emit(state.copyWith(filteredData: []));
      return produceSideEffect(
        BaseCommand.failure(const Failure(code: ErrorCodes.emptySearch)),
      );
    }
    emit(state.copyWith(filteredData: dataToEmit));
  }

  void _onHomeOnFlowerTappedEvent(
    HomeOnFlowerTappedEvent event,
    Emitter<HomeState> emit,
  ) {
    produceSideEffect(BaseCommand.go(FlowerDetailsRoute(event.id)));
  }

  void _onHomeClearQueryEvent(
    HomeClearQueryEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(filteredData: [], query: ''));
  }

  Future<void> _onGetUserData(
    _GetUserData event,
    Emitter<HomeState> emit,
  ) async {
    final result = await auth.getUserData();
    if (result.isError()) {
      return produceSideEffect(BaseCommand.failure(result.tryGetError()!));
    }
    emit(state.copyWith(user: result.tryGetSuccess()));
    await emit.onEach(
      auth.userSubscription(),
      onData: (result) {
        if (result.isError()) {
          return produceSideEffect(BaseCommand.failure(result.tryGetError()!));
        } else {
          emit(state.copyWith(user: result.tryGetSuccess()));
        }
      },
    );
  }

  void _onSignOutEvent(
    SignOutEvent event,
    Emitter<HomeState> emit,
  ) {
    unawaited(auth.signOut());
    produceSideEffect(BaseCommand.go(const LoginRoute()));
  }

  Future<void> _onDeleteAccountEvent(
    DeleteAccountEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await auth.deleteAccount();
    if (result.isError()) {
      return produceSideEffect(BaseCommand.failure(result.tryGetError()!));
    }
    emit(state.copyWith(isLoading: false));
  }

  void _onOnCartTappedEvent(
    OnCartTappedEvent event,
    Emitter<HomeState> emit,
  ) {
    produceSideEffect(BaseCommand.go(const CartRoute()));
  }
}
