import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_auth_repository.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends SideEffectBloc<SplashEvent, SplashState, BaseCommand> {
  SplashBloc(
    this.auth,
  ) : super(const SplashState()) {
    on<_InitialEvent>(_onInitialEvent);
    add(const _InitialEvent());
  }

  final IAuthRepository auth;

  Future<void> _onInitialEvent(
    _InitialEvent event,
    Emitter<SplashState> emit,
  ) async {
    if (auth.isLoggedIn()) {
      return produceSideEffect(BaseCommand.go(const HomeScaffoldRoute()));
    }
    final result = await auth.loginAnonymous();
    if (result.isError()) {
    return  produceSideEffect(BaseCommand.failure(result.tryGetError()!));
    }
    produceSideEffect(BaseCommand.go(const HomeScaffoldRoute()));
  }
}
