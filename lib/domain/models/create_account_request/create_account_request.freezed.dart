// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_account_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateAccountRequest _$CreateAccountRequestFromJson(Map<String, dynamic> json) {
  return _CreateAccountRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateAccountRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  /// Serializes this CreateAccountRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateAccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateAccountRequestCopyWith<CreateAccountRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAccountRequestCopyWith<$Res> {
  factory $CreateAccountRequestCopyWith(CreateAccountRequest value,
          $Res Function(CreateAccountRequest) then) =
      _$CreateAccountRequestCopyWithImpl<$Res, CreateAccountRequest>;
  @useResult
  $Res call(
      {String email,
      String password,
      String displayName,
      String address,
      String phone});
}

/// @nodoc
class _$CreateAccountRequestCopyWithImpl<$Res,
        $Val extends CreateAccountRequest>
    implements $CreateAccountRequestCopyWith<$Res> {
  _$CreateAccountRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateAccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? displayName = null,
    Object? address = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateAccountRequestImplCopyWith<$Res>
    implements $CreateAccountRequestCopyWith<$Res> {
  factory _$$CreateAccountRequestImplCopyWith(_$CreateAccountRequestImpl value,
          $Res Function(_$CreateAccountRequestImpl) then) =
      __$$CreateAccountRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String displayName,
      String address,
      String phone});
}

/// @nodoc
class __$$CreateAccountRequestImplCopyWithImpl<$Res>
    extends _$CreateAccountRequestCopyWithImpl<$Res, _$CreateAccountRequestImpl>
    implements _$$CreateAccountRequestImplCopyWith<$Res> {
  __$$CreateAccountRequestImplCopyWithImpl(_$CreateAccountRequestImpl _value,
      $Res Function(_$CreateAccountRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateAccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? displayName = null,
    Object? address = null,
    Object? phone = null,
  }) {
    return _then(_$CreateAccountRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateAccountRequestImpl implements _CreateAccountRequest {
  _$CreateAccountRequestImpl(
      {required this.email,
      required this.password,
      required this.displayName,
      required this.address,
      required this.phone});

  factory _$CreateAccountRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateAccountRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String displayName;
  @override
  final String address;
  @override
  final String phone;

  @override
  String toString() {
    return 'CreateAccountRequest(email: $email, password: $password, displayName: $displayName, address: $address, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAccountRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, displayName, address, phone);

  /// Create a copy of CreateAccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAccountRequestImplCopyWith<_$CreateAccountRequestImpl>
      get copyWith =>
          __$$CreateAccountRequestImplCopyWithImpl<_$CreateAccountRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateAccountRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateAccountRequest implements CreateAccountRequest {
  factory _CreateAccountRequest(
      {required final String email,
      required final String password,
      required final String displayName,
      required final String address,
      required final String phone}) = _$CreateAccountRequestImpl;

  factory _CreateAccountRequest.fromJson(Map<String, dynamic> json) =
      _$CreateAccountRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get displayName;
  @override
  String get address;
  @override
  String get phone;

  /// Create a copy of CreateAccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateAccountRequestImplCopyWith<_$CreateAccountRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
