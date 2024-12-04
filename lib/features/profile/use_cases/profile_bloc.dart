import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc
    extends SideEffectBloc<ProfileEvent, ProfileState, BaseCommand> {
  ProfileBloc() : super(ProfileInitial()) {
    on<OpenDeleteDialogEvent>(_onOpenDeleteDialogEvent);
  }

  void _onOpenDeleteDialogEvent(
    OpenDeleteDialogEvent event,
    Emitter<ProfileState> emit,
  ) {
    produceSideEffect(BaseCommand.showDialog());
  }
}
