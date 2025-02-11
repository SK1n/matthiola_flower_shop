import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:matthiola_flower_shop/core/constants/app_constants.dart';
import 'package:matthiola_flower_shop/core/constants/firestore_constants.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/domain/models/flower/flower_entity.dart';
import 'package:matthiola_flower_shop/domain/models/user/user_entity.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_auth_repository.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_repository.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends SideEffectBloc<HomeEvent, HomeState, BaseCommand> {
  HomeBloc(
    this.repository,
    this.auth,
  ) : super(HomeState()) {
    on<HomeFlowerTypeChanged>(_onFlowerTypeChanged);
    on<HomeOnSearchEvent>(_onHomeOnSearchEvent);
    on<HomeOnFlowerTappedEvent>(_onHomeOnFlowerTappedEvent);
    on<HomeClearQueryEvent>(_onHomeClearQueryEvent);
    on<_GetUserData>(_onGetUserData);
    on<SignOutEvent>(_onSignOutEvent);
    on<DeleteAccountEvent>(_onDeleteAccountEvent);
    on<OnCartTappedEvent>(_onOnCartTappedEvent);
    on<HomeSearchResultEvent>(_onHomeSearchResultEvent);
    on<ControllerIndexChangedEvent>(_onControllerIndexChangedEvent);
    add(const _GetUserData());
  }

  final IRepository<FlowerEntity> repository;
  final IAuthRepository auth;

  void _onFlowerTypeChanged(
    HomeFlowerTypeChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(choiceChipSelectedItem: event.index));
  }

  Future<void> _onHomeOnSearchEvent(
    HomeOnSearchEvent event,
    Emitter<HomeState> emit,
  ) async {
    final query = event.query;
    if (query.isEmpty) {
      add(const HomeSearchResultEvent([], ''));
      return;
    }
    final result = await repository.search(query);
    if (result.isError()) {
      produceSideEffect(BaseCommand.failure(result.tryGetError()!));
      return;
    }
    final flowers = result.tryGetSuccess()!;
    add(HomeSearchResultEvent(flowers, query));
  }

  void _onHomeSearchResultEvent(
    HomeSearchResultEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(filteredData: event.flowers, query: event.query));
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
    final user = result.tryGetSuccess()!;
    emit(state.copyWith(user: user, isAnonymous: user.email.isEmpty));
    await emit.onEach(
      auth.userSubscription(),
      onData: (result) {
        if (result.isError()) {
          return produceSideEffect(BaseCommand.failure(result.tryGetError()!));
        } else {
          final user = result.tryGetSuccess()!;
          emit(state.copyWith(user: user, isAnonymous: user.email.isEmpty));
        }
      },
    );
  }

  Future<void> _onSignOutEvent(
    SignOutEvent event,
    Emitter<HomeState> emit,
  ) async {
    // unawaited(auth.signOut());
    await auth.loginAnonymous();
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
    produceSideEffect(BaseCommand.success(t.profile.accountDeleted));
    add(const SignOutEvent());
    emit(state.copyWith(isLoading: false));
  }

  void _onOnCartTappedEvent(
    OnCartTappedEvent event,
    Emitter<HomeState> emit,
  ) {
    produceSideEffect(BaseCommand.go(const CartRoute()));
  }

  void _onControllerIndexChangedEvent(
    ControllerIndexChangedEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(controllerIndex: event.index));
  }
}
