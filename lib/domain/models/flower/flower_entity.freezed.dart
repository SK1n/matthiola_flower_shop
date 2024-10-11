// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flower_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlowerEntity _$FlowerEntityFromJson(Map<String, dynamic> json) {
  return _FlowerEntity.fromJson(json);
}

/// @nodoc
mixin _$FlowerEntity {
  String get description => throw _privateConstructorUsedError;
  String get flowerType => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get batchSize => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;

  /// Serializes this FlowerEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlowerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlowerEntityCopyWith<FlowerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlowerEntityCopyWith<$Res> {
  factory $FlowerEntityCopyWith(
          FlowerEntity value, $Res Function(FlowerEntity) then) =
      _$FlowerEntityCopyWithImpl<$Res, FlowerEntity>;
  @useResult
  $Res call(
      {String description,
      String flowerType,
      String id,
      String image,
      String name,
      int batchSize,
      double price,
      int quantity,
      int type});
}

/// @nodoc
class _$FlowerEntityCopyWithImpl<$Res, $Val extends FlowerEntity>
    implements $FlowerEntityCopyWith<$Res> {
  _$FlowerEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlowerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? flowerType = null,
    Object? id = null,
    Object? image = null,
    Object? name = null,
    Object? batchSize = null,
    Object? price = null,
    Object? quantity = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      flowerType: null == flowerType
          ? _value.flowerType
          : flowerType // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      batchSize: null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlowerEntityImplCopyWith<$Res>
    implements $FlowerEntityCopyWith<$Res> {
  factory _$$FlowerEntityImplCopyWith(
          _$FlowerEntityImpl value, $Res Function(_$FlowerEntityImpl) then) =
      __$$FlowerEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      String flowerType,
      String id,
      String image,
      String name,
      int batchSize,
      double price,
      int quantity,
      int type});
}

/// @nodoc
class __$$FlowerEntityImplCopyWithImpl<$Res>
    extends _$FlowerEntityCopyWithImpl<$Res, _$FlowerEntityImpl>
    implements _$$FlowerEntityImplCopyWith<$Res> {
  __$$FlowerEntityImplCopyWithImpl(
      _$FlowerEntityImpl _value, $Res Function(_$FlowerEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlowerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? flowerType = null,
    Object? id = null,
    Object? image = null,
    Object? name = null,
    Object? batchSize = null,
    Object? price = null,
    Object? quantity = null,
    Object? type = null,
  }) {
    return _then(_$FlowerEntityImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      flowerType: null == flowerType
          ? _value.flowerType
          : flowerType // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      batchSize: null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlowerEntityImpl implements _FlowerEntity {
  const _$FlowerEntityImpl(
      {required this.description,
      required this.flowerType,
      required this.id,
      required this.image,
      required this.name,
      required this.batchSize,
      required this.price,
      required this.quantity,
      required this.type});

  factory _$FlowerEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlowerEntityImplFromJson(json);

  @override
  final String description;
  @override
  final String flowerType;
  @override
  final String id;
  @override
  final String image;
  @override
  final String name;
  @override
  final int batchSize;
  @override
  final double price;
  @override
  final int quantity;
  @override
  final int type;

  @override
  String toString() {
    return 'FlowerEntity(description: $description, flowerType: $flowerType, id: $id, image: $image, name: $name, batchSize: $batchSize, price: $price, quantity: $quantity, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlowerEntityImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.flowerType, flowerType) ||
                other.flowerType == flowerType) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, description, flowerType, id,
      image, name, batchSize, price, quantity, type);

  /// Create a copy of FlowerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlowerEntityImplCopyWith<_$FlowerEntityImpl> get copyWith =>
      __$$FlowerEntityImplCopyWithImpl<_$FlowerEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlowerEntityImplToJson(
      this,
    );
  }
}

abstract class _FlowerEntity implements FlowerEntity {
  const factory _FlowerEntity(
      {required final String description,
      required final String flowerType,
      required final String id,
      required final String image,
      required final String name,
      required final int batchSize,
      required final double price,
      required final int quantity,
      required final int type}) = _$FlowerEntityImpl;

  factory _FlowerEntity.fromJson(Map<String, dynamic> json) =
      _$FlowerEntityImpl.fromJson;

  @override
  String get description;
  @override
  String get flowerType;
  @override
  String get id;
  @override
  String get image;
  @override
  String get name;
  @override
  int get batchSize;
  @override
  double get price;
  @override
  int get quantity;
  @override
  int get type;

  /// Create a copy of FlowerEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlowerEntityImplCopyWith<_$FlowerEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
