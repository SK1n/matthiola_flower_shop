import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matthiola_flower_shop/core/router/router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc
    extends SideEffectBloc<ProfileEvent, ProfileState, BaseCommand> {
  ProfileBloc() : super(const ProfileState()) {
    on<OpenDeleteDialogEvent>(_onOpenDeleteDialogEvent);
    on<LoginEvent>(_onLoginEvent);
  }

  void _onLoginEvent(
    LoginEvent event,
    Emitter<ProfileState> emit,
  ) {
    produceSideEffect(BaseCommand.go(const LoginRoute()));
  }

  void _onOpenDeleteDialogEvent(
    OpenDeleteDialogEvent event,
    Emitter<ProfileState> emit,
  ) {
    produceSideEffect(BaseCommand.showDialog());
  }
}
