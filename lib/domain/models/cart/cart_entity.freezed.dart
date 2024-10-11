// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartEntity _$CartEntityFromJson(Map<String, dynamic> json) {
  return _CartEntity.fromJson(json);
}

/// @nodoc
mixin _$CartEntity {
  FlowerEntity get item => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  dynamic get totalPrice => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  /// Serializes this CartEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartEntityCopyWith<CartEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEntityCopyWith<$Res> {
  factory $CartEntityCopyWith(
          CartEntity value, $Res Function(CartEntity) then) =
      _$CartEntityCopyWithImpl<$Res, CartEntity>;
  @useResult
  $Res call(
      {FlowerEntity item, int quantity, dynamic totalPrice, String error});

  $FlowerEntityCopyWith<$Res> get item;
}

/// @nodoc
class _$CartEntityCopyWithImpl<$Res, $Val extends CartEntity>
    implements $CartEntityCopyWith<$Res> {
  _$CartEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? quantity = null,
    Object? totalPrice = freezed,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as FlowerEntity,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as dynamic,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of CartEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlowerEntityCopyWith<$Res> get item {
    return $FlowerEntityCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartEntityImplCopyWith<$Res>
    implements $CartEntityCopyWith<$Res> {
  factory _$$CartEntityImplCopyWith(
          _$CartEntityImpl value, $Res Function(_$CartEntityImpl) then) =
      __$$CartEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FlowerEntity item, int quantity, dynamic totalPrice, String error});

  @override
  $FlowerEntityCopyWith<$Res> get item;
}

/// @nodoc
class __$$CartEntityImplCopyWithImpl<$Res>
    extends _$CartEntityCopyWithImpl<$Res, _$CartEntityImpl>
    implements _$$CartEntityImplCopyWith<$Res> {
  __$$CartEntityImplCopyWithImpl(
      _$CartEntityImpl _value, $Res Function(_$CartEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? quantity = null,
    Object? totalPrice = freezed,
    Object? error = null,
  }) {
    return _then(_$CartEntityImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as FlowerEntity,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: freezed == totalPrice ? _value.totalPrice! : totalPrice,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartEntityImpl implements _CartEntity {
  _$CartEntityImpl(
      {required this.item,
      required this.quantity,
      this.totalPrice = 0.0,
      this.error = ''});

  factory _$CartEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartEntityImplFromJson(json);

  @override
  final FlowerEntity item;
  @override
  final int quantity;
  @override
  @JsonKey()
  final dynamic totalPrice;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'CartEntity(item: $item, quantity: $quantity, totalPrice: $totalPrice, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartEntityImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality()
                .equals(other.totalPrice, totalPrice) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item, quantity,
      const DeepCollectionEquality().hash(totalPrice), error);

  /// Create a copy of CartEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartEntityImplCopyWith<_$CartEntityImpl> get copyWith =>
      __$$CartEntityImplCopyWithImpl<_$CartEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartEntityImplToJson(
      this,
    );
  }
}

abstract class _CartEntity implements CartEntity {
  factory _CartEntity(
      {required final FlowerEntity item,
      required final int quantity,
      final dynamic totalPrice,
      final String error}) = _$CartEntityImpl;

  factory _CartEntity.fromJson(Map<String, dynamic> json) =
      _$CartEntityImpl.fromJson;

  @override
  FlowerEntity get item;
  @override
  int get quantity;
  @override
  dynamic get totalPrice;
  @override
  String get error;

  /// Create a copy of CartEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartEntityImplCopyWith<_$CartEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
