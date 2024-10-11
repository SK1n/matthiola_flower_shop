// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mail_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MailResponseEntity _$MailResponseEntityFromJson(Map<String, dynamic> json) {
  return _MailResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$MailResponseEntity {
  @_Converter()
  MailDeliveryResponse get delivery => throw _privateConstructorUsedError;

  /// Serializes this MailResponseEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MailResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MailResponseEntityCopyWith<MailResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MailResponseEntityCopyWith<$Res> {
  factory $MailResponseEntityCopyWith(
          MailResponseEntity value, $Res Function(MailResponseEntity) then) =
      _$MailResponseEntityCopyWithImpl<$Res, MailResponseEntity>;
  @useResult
  $Res call({@_Converter() MailDeliveryResponse delivery});

  $MailDeliveryResponseCopyWith<$Res> get delivery;
}

/// @nodoc
class _$MailResponseEntityCopyWithImpl<$Res, $Val extends MailResponseEntity>
    implements $MailResponseEntityCopyWith<$Res> {
  _$MailResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MailResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delivery = null,
  }) {
    return _then(_value.copyWith(
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as MailDeliveryResponse,
    ) as $Val);
  }

  /// Create a copy of MailResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MailDeliveryResponseCopyWith<$Res> get delivery {
    return $MailDeliveryResponseCopyWith<$Res>(_value.delivery, (value) {
      return _then(_value.copyWith(delivery: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MailResponseEntityImplCopyWith<$Res>
    implements $MailResponseEntityCopyWith<$Res> {
  factory _$$MailResponseEntityImplCopyWith(_$MailResponseEntityImpl value,
          $Res Function(_$MailResponseEntityImpl) then) =
      __$$MailResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@_Converter() MailDeliveryResponse delivery});

  @override
  $MailDeliveryResponseCopyWith<$Res> get delivery;
}

/// @nodoc
class __$$MailResponseEntityImplCopyWithImpl<$Res>
    extends _$MailResponseEntityCopyWithImpl<$Res, _$MailResponseEntityImpl>
    implements _$$MailResponseEntityImplCopyWith<$Res> {
  __$$MailResponseEntityImplCopyWithImpl(_$MailResponseEntityImpl _value,
      $Res Function(_$MailResponseEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MailResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delivery = null,
  }) {
    return _then(_$MailResponseEntityImpl(
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as MailDeliveryResponse,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MailResponseEntityImpl implements _MailResponseEntity {
  _$MailResponseEntityImpl({@_Converter() required this.delivery});

  factory _$MailResponseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MailResponseEntityImplFromJson(json);

  @override
  @_Converter()
  final MailDeliveryResponse delivery;

  @override
  String toString() {
    return 'MailResponseEntity(delivery: $delivery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MailResponseEntityImpl &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, delivery);

  /// Create a copy of MailResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MailResponseEntityImplCopyWith<_$MailResponseEntityImpl> get copyWith =>
      __$$MailResponseEntityImplCopyWithImpl<_$MailResponseEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MailResponseEntityImplToJson(
      this,
    );
  }
}

abstract class _MailResponseEntity implements MailResponseEntity {
  factory _MailResponseEntity(
          {@_Converter() required final MailDeliveryResponse delivery}) =
      _$MailResponseEntityImpl;

  factory _MailResponseEntity.fromJson(Map<String, dynamic> json) =
      _$MailResponseEntityImpl.fromJson;

  @override
  @_Converter()
  MailDeliveryResponse get delivery;

  /// Create a copy of MailResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MailResponseEntityImplCopyWith<_$MailResponseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MailDeliveryResponse _$MailDeliveryResponseFromJson(Map<String, dynamic> json) {
  return _MailDeliveryResponse.fromJson(json);
}

/// @nodoc
mixin _$MailDeliveryResponse {
  String get state => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this MailDeliveryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MailDeliveryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MailDeliveryResponseCopyWith<MailDeliveryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MailDeliveryResponseCopyWith<$Res> {
  factory $MailDeliveryResponseCopyWith(MailDeliveryResponse value,
          $Res Function(MailDeliveryResponse) then) =
      _$MailDeliveryResponseCopyWithImpl<$Res, MailDeliveryResponse>;
  @useResult
  $Res call({String state, String? error});
}

/// @nodoc
class _$MailDeliveryResponseCopyWithImpl<$Res,
        $Val extends MailDeliveryResponse>
    implements $MailDeliveryResponseCopyWith<$Res> {
  _$MailDeliveryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MailDeliveryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MailDeliveryResponseImplCopyWith<$Res>
    implements $MailDeliveryResponseCopyWith<$Res> {
  factory _$$MailDeliveryResponseImplCopyWith(_$MailDeliveryResponseImpl value,
          $Res Function(_$MailDeliveryResponseImpl) then) =
      __$$MailDeliveryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String state, String? error});
}

/// @nodoc
class __$$MailDeliveryResponseImplCopyWithImpl<$Res>
    extends _$MailDeliveryResponseCopyWithImpl<$Res, _$MailDeliveryResponseImpl>
    implements _$$MailDeliveryResponseImplCopyWith<$Res> {
  __$$MailDeliveryResponseImplCopyWithImpl(_$MailDeliveryResponseImpl _value,
      $Res Function(_$MailDeliveryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MailDeliveryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? error = freezed,
  }) {
    return _then(_$MailDeliveryResponseImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MailDeliveryResponseImpl implements _MailDeliveryResponse {
  _$MailDeliveryResponseImpl({required this.state, this.error});

  factory _$MailDeliveryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MailDeliveryResponseImplFromJson(json);

  @override
  final String state;
  @override
  final String? error;

  @override
  String toString() {
    return 'MailDeliveryResponse(state: $state, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MailDeliveryResponseImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, state, error);

  /// Create a copy of MailDeliveryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MailDeliveryResponseImplCopyWith<_$MailDeliveryResponseImpl>
      get copyWith =>
          __$$MailDeliveryResponseImplCopyWithImpl<_$MailDeliveryResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MailDeliveryResponseImplToJson(
      this,
    );
  }
}

abstract class _MailDeliveryResponse implements MailDeliveryResponse {
  factory _MailDeliveryResponse(
      {required final String state,
      final String? error}) = _$MailDeliveryResponseImpl;

  factory _MailDeliveryResponse.fromJson(Map<String, dynamic> json) =
      _$MailDeliveryResponseImpl.fromJson;

  @override
  String get state;
  @override
  String? get error;

  /// Create a copy of MailDeliveryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MailDeliveryResponseImplCopyWith<_$MailDeliveryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
