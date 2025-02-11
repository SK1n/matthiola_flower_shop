import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:matthiola_flower_shop/core/constants/firestore_constants.dart';
import 'package:matthiola_flower_shop/core/constants/shared_prefs_constants.dart';
import 'package:matthiola_flower_shop/core/utils/base_command.dart';
import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:matthiola_flower_shop/core/utils/failures/order_failure.dart';
import 'package:matthiola_flower_shop/core/validators/email_validator.dart';
import 'package:matthiola_flower_shop/core/validators/phone_validator.dart';
import 'package:matthiola_flower_shop/core/validators/required_validator.dart';
import 'package:matthiola_flower_shop/domain/models/cart/cart_entity.dart';
import 'package:matthiola_flower_shop/domain/models/order_request/order_request.dart';
import 'package:matthiola_flower_shop/domain/models/order_response/order_response.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_repository.dart';
import 'package:matthiola_flower_shop/domain/repositories/i_shared_prefs_repository.dart';
import 'package:matthiola_flower_shop/features/home/use_cases/home_bloc.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends SideEffectBloc<CartEvent, CartState, BaseCommand> {
  CartBloc(
    this._repository,
    this._orderRepository,
    this._homeBloc,
  ) : super(const CartState()) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<_CalculateTotalPriceEvent>(_onCalculateTotalPriceEvent);
    on<_EmitAndSaveCartEvent>(_onEmitAndSaveCartEvent);
    on<_InitialEvent>(_onInitialEvent);
    on<ClearCartEvent>(_onClearCartEvent);
    on<SubmitCartEvent>(_onSubmitCartEvent);
    on<RecyclePressed>(_onRecyclePressed);
    on<_SubscribeToUser>(_onSubscribeToUser);
    on<EmailChangedEvent>(_onEmailChangedEvent);
    on<PhoneChangedEvent>(_onPhoneChangedEvent);
    on<AddressChangedEvent>(_onAddressChangedEvent);
    on<UsernameChangedEvent>(_onUsernameChangedEvent);
    add(const _SubscribeToUser());
    add(const _InitialEvent());
  }

  final ISharedPrefsRepository _repository;
  final IRepository<OrderRequest> _orderRepository;
  final HomeBloc _homeBloc;

  void _onInitialEvent(
    _InitialEvent event,
    Emitter<CartState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    final result = _repository.readMapList(SharedPrefsConstants.CART_KEY);
    if (result.isError()) {
      emit(state.copyWith(isLoading: false));
      return;
    }
    final data = result.tryGetSuccess()!;
    final list = data.map(CartEntity.fromJson).toList();
    emit(state.copyWith(items: list, isLoading: false));
    add(const _CalculateTotalPriceEvent());
  }

  Future<void> _onSubscribeToUser(
    _SubscribeToUser event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await emit.onEach(
      _homeBloc.stream,
      onData: (user) {
        emit(state.copyWith(userId: user.user.uid));
        if (user.isAnonymous) {
          add(const _InitialEvent());
          return;
        }
        add(EmailChangedEvent(user.user.email));
        add(UsernameChangedEvent(user.user.displayName));
        add(PhoneChangedEvent(user.user.phone));
        add(AddressChangedEvent(user.user.address));
        add(const _InitialEvent());
      },
    );
  }

  Future<void> _onAddToCart(
    AddToCart event,
    Emitter<CartState> emit,
  ) async {
    if (event.item.quantity == 0) return;

    final item = state.items.firstWhere(
      (flower) => flower.item.id == event.item.item.id,
      orElse: () => CartEntity.empty,
    );
    if (item == CartEntity.empty) {
      add(_EmitAndSaveCartEvent([...state.items, event.item]));
      if (event.showDialog) {
        produceSideEffect(BaseCommand.success(t.generic.addedToCart));
      }
      return;
    }
    final items = state.items.map((element) {
      if (element.item.id == event.item.item.id) {
        return element.copyWith(
          quantity: element.quantity + event.item.quantity,
        );
      }
      return element;
    }).toList();

    if (event.showDialog) {
      produceSideEffect(BaseCommand.success(t.generic.addedToCart));
    }
    add(_EmitAndSaveCartEvent(items));
  }

  void _onRemoveFromCart(
    RemoveFromCart event,
    Emitter<CartState> emit,
  ) {
    final item = state.items.firstWhere(
      (flower) => flower.item.id == event.item.item.id,
      orElse: () => CartEntity.empty,
    );

    if (item == CartEntity.empty) {
      return;
    }

    final updatedItems = <CartEntity>[];

    for (final element in state.items) {
      if (element.item.id == event.item.item.id) {
        final quantity = element.quantity - event.item.quantity;
        if (quantity <= 0) {
          produceSideEffect(BaseCommand.showDialog(element));
          return;
        }
        updatedItems.add(element.copyWith(quantity: quantity));
      } else {
        updatedItems.add(element);
      }
    }
    add(
      _EmitAndSaveCartEvent(
        updatedItems.where((element) => element.quantity > 0).toList(),
      ),
    );
  }

  Future<void> _onRecyclePressed(
    RecyclePressed event,
    Emitter<CartState> emit,
  ) async {
    final data = [...state.items]..remove(event.item);
    add(_EmitAndSaveCartEvent(data));
  }

  void _onCalculateTotalPriceEvent(
    _CalculateTotalPriceEvent event,
    Emitter<CartState> emit,
  ) {
    var totalPrice = 0.0;
    for (final item in state.items) {
      totalPrice += item.quantity * item.item.price;
    }
    emit(state.copyWith(totalPrice: totalPrice));
  }

  Future<void> _onEmitAndSaveCartEvent(
    _EmitAndSaveCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final cart = event.cart;
    final mapData = cart.map((element) => element.toJson()).toList();
    final result = await _repository.writeMapList(
      SharedPrefsConstants.CART_KEY,
      mapData,
    );
    if (result.isError()) {
      return produceSideEffect(BaseCommand.failure(result.tryGetError()!));
    }
    emit(state.copyWith(items: cart));
    add(const _CalculateTotalPriceEvent());
  }

  Future<void> _onClearCartEvent(
    ClearCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(items: [], totalPrice: 0));
    await _repository.remove(SharedPrefsConstants.CART_KEY);
  }

  void _onUsernameChangedEvent(
    UsernameChangedEvent event,
    Emitter<CartState> emit,
  ) {
    final value = RequiredValidator.dirty(event.username);
    emit(state.copyWith(username: value));
  }

  void _onAddressChangedEvent(
    AddressChangedEvent event,
    Emitter<CartState> emit,
  ) {
    final value = RequiredValidator.dirty(event.address);
    emit(state.copyWith(address: value));
  }

  void _onPhoneChangedEvent(
    PhoneChangedEvent event,
    Emitter<CartState> emit,
  ) {
    final value = PhoneValidator.dirty(event.phone);
    emit(state.copyWith(phone: value));
  }

  void _onEmailChangedEvent(
    EmailChangedEvent event,
    Emitter<CartState> emit,
  ) {
    final value = EmailValidator.dirty(event.email);
    emit(state.copyWith(email: value));
  }

  Future<void> _onSubmitCartEvent(
    SubmitCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final result = await _orderRepository.put(
        _makeRequestData(),
        FirestoreConstants.ORDERS_COLLECTION,
      );

      if (result.isError()) {
        final failure = result.tryGetError()!;

        if (failure is OrderFailure) {
          final updatedItems = _getErrorState(failure);
          emit(state.copyWith(items: updatedItems));
          add(_EmitAndSaveCartEvent(state.items));
          _homeBloc.add(const GetFlowerData());
        } else {
          produceSideEffect(BaseCommand.failure(failure));
        }
        return;
      }
      produceSideEffect(BaseCommand.success(t.checkout.orderPlaced));
      add(const ClearCartEvent());
      // _homeScaffoldBloc.add(const ShellIndexChangedEvent(0, ));
    } catch (e) {
      produceSideEffect(BaseCommand.failure(Failure(error: e)));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  List<CartEntity> _getErrorState(OrderFailure failure) {
    return state.items.map((cartItem) {
      final productError = failure.response.firstWhere(
        (resp) => resp.id == cartItem.item.id,
        orElse: () => OrderResponse.empty,
      );

      if (productError != OrderResponse.empty) {
        final errorMessages = <String>[];
        if (productError.quantity != null) {
          errorMessages
              .add(t.cart.notEnoughStock(value: productError.quantity!));
        }
        if (productError.price != null) {
          errorMessages.add(t.cart.priceChanged(value: productError.price!));
        }
        final errorMessage = errorMessages.join('\n');

        if (productError.price != null) {
          return cartItem.copyWith(
            error: errorMessage,
            totalPrice: productError.price! * cartItem.quantity,
            item: cartItem.item.copyWith(
              price: productError.price!,
            ),
          );
        }

        return cartItem.copyWith(
          error: errorMessage,
        );
      }
      return cartItem;
    }).toList();
  }

  OrderRequest _makeRequestData() {
    return OrderRequest(
      address: state.address.value,
      email: state.email.value,
      phone: state.phone.value,
      displayName: state.username.value,
      products: state.items.map((element) {
        return OrderProductRequest(
          productName: element.item.name,
          productPrice: element.item.price.toStringAsFixed(2),
          productType: element.item.flowerType,
          productUid: element.item.id,
          quantity: element.quantity.toString(),
        );
      }).toList(),
      totalPrice: state.totalPrice.toStringAsFixed(2),
    );
  }
}
