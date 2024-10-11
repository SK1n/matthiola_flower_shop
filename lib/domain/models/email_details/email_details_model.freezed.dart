// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmailDetailsModel _$EmailDetailsModelFromJson(Map<String, dynamic> json) {
  return _EmailDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$EmailDetailsModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this EmailDetailsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmailDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmailDetailsModelCopyWith<EmailDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailDetailsModelCopyWith<$Res> {
  factory $EmailDetailsModelCopyWith(
          EmailDetailsModel value, $Res Function(EmailDetailsModel) then) =
      _$EmailDetailsModelCopyWithImpl<$Res, EmailDetailsModel>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$EmailDetailsModelCopyWithImpl<$Res, $Val extends EmailDetailsModel>
    implements $EmailDetailsModelCopyWith<$Res> {
  _$EmailDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailDetailsModelImplCopyWith<$Res>
    implements $EmailDetailsModelCopyWith<$Res> {
  factory _$$EmailDetailsModelImplCopyWith(_$EmailDetailsModelImpl value,
          $Res Function(_$EmailDetailsModelImpl) then) =
      __$$EmailDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$EmailDetailsModelImplCopyWithImpl<$Res>
    extends _$EmailDetailsModelCopyWithImpl<$Res, _$EmailDetailsModelImpl>
    implements _$$EmailDetailsModelImplCopyWith<$Res> {
  __$$EmailDetailsModelImplCopyWithImpl(_$EmailDetailsModelImpl _value,
      $Res Function(_$EmailDetailsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmailDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$EmailDetailsModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailDetailsModelImpl implements _EmailDetailsModel {
  _$EmailDetailsModelImpl({required this.email, required this.password});

  factory _$EmailDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailDetailsModelImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'EmailDetailsModel(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailDetailsModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of EmailDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailDetailsModelImplCopyWith<_$EmailDetailsModelImpl> get copyWith =>
      __$$EmailDetailsModelImplCopyWithImpl<_$EmailDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _EmailDetailsModel implements EmailDetailsModel {
  factory _EmailDetailsModel(
      {required final String email,
      required final String password}) = _$EmailDetailsModelImpl;

  factory _EmailDetailsModel.fromJson(Map<String, dynamic> json) =
      _$EmailDetailsModelImpl.fromJson;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of EmailDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailDetailsModelImplCopyWith<_$EmailDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
