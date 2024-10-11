import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

part 'home_scaffold_event.dart';
part 'home_scaffold_state.dart';

class HomeScaffoldBloc
    extends SideEffectBloc<HomeScaffoldEvent, HomeScaffoldState, BaseCommand> {
  HomeScaffoldBloc() : super(const HomeScaffoldState()) {
    on<HomeScaffoldOnDestinationSelectedEvent>(_onDestination);
  }

  void _onDestination(
    HomeScaffoldOnDestinationSelectedEvent event,
    Emitter<HomeScaffoldState> emit,
  ) {
    emit(state.copyWith(index: event.index));
  }
}
