import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matthiola_flower_shop/core/constants/error_codes.dart';
import 'package:matthiola_flower_shop/core/constants/firestore_constants.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:matthiola_flower_shop/domain/models/flower/flower_entity.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_repository.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'flower_details_event.dart';
part 'flower_details_state.dart';

class FlowerDetailsBloc extends SideEffectBloc<FlowerDetailsEvent,
    FlowerDetailsState, BaseCommand> {
  FlowerDetailsBloc(
    this._repository,
  ) : super(const FlowerDetailsState()) {
    on<FlowerDetailsGetEvent>(_onFlowerDetailsGetEvent);
    on<FlowerDetailsAddEvent>(_onFlowerDetailsAddEvent);
    on<FlowerDetailsRemoveEvent>(_onFlowerDetailsRemoveEvent);
  }

  final IRepository<FlowerEntity> _repository;

  Future<void> _onFlowerDetailsGetEvent(
    FlowerDetailsGetEvent event,
    Emitter<FlowerDetailsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final result =
          await _repository.get(FirestoreConstants.FLOWERS_DOCUMENT(event.id));
      if (result.isError()) {
        produceSideEffect(BaseCommand.failure(result.tryGetError()!));
        return;
      }
      final item = result.tryGetSuccess();
      emit(state.copyWith(item: item, quantity: 0));
    } catch (e) {
      produceSideEffect(BaseCommand.failure(Failure(error: e.toString())));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onFlowerDetailsAddEvent(
    FlowerDetailsAddEvent event,
    Emitter<FlowerDetailsState> emit,
  ) {
    final quantity = state.quantity + event.quantity;
    if (quantity > state.item.quantity) {
      return produceSideEffect(
        BaseCommand.failure(
          const Failure(
            code: ErrorCodes.maxQuantityReached,
          ),
        ),
      );
    }
    emit(state.copyWith(quantity: state.quantity + event.quantity));
  }

  void _onFlowerDetailsRemoveEvent(
    FlowerDetailsRemoveEvent event,
    Emitter<FlowerDetailsState> emit,
  ) {
    if (state.quantity <= 0) return;
    emit(state.copyWith(quantity: state.quantity - event.quantity));
  }
}
