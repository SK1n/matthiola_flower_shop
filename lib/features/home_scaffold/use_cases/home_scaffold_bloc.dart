import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'home_scaffold_event.dart';
part 'home_scaffold_state.dart';

class HomeScaffoldBloc
    extends SideEffectBloc<HomeScaffoldEvent, HomeScaffoldState, BaseCommand> {
  HomeScaffoldBloc() : super(const HomeScaffoldState()) {
    on<ShellIndexChangedEvent>(_onShellIndexChangedEvent);
  }
  void _onShellIndexChangedEvent(
    ShellIndexChangedEvent event,
    Emitter<HomeScaffoldState> emit,
  ) {
    produceSideEffect(BaseCommand.goBranch(event.index, event.navigationShell));
  }
}
