// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mail_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MailRequestEntity _$MailRequestEntityFromJson(Map<String, dynamic> json) {
  return _MailRequestEntity.fromJson(json);
}

/// @nodoc
mixin _$MailRequestEntity {
  @_TemplateConverter()
  MailRequestTemplateEntity get template => throw _privateConstructorUsedError;
  List<String> get bcc => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;

  /// Serializes this MailRequestEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MailRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MailRequestEntityCopyWith<MailRequestEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MailRequestEntityCopyWith<$Res> {
  factory $MailRequestEntityCopyWith(
          MailRequestEntity value, $Res Function(MailRequestEntity) then) =
      _$MailRequestEntityCopyWithImpl<$Res, MailRequestEntity>;
  @useResult
  $Res call(
      {@_TemplateConverter() MailRequestTemplateEntity template,
      List<String> bcc,
      String to});

  $MailRequestTemplateEntityCopyWith<$Res> get template;
}

/// @nodoc
class _$MailRequestEntityCopyWithImpl<$Res, $Val extends MailRequestEntity>
    implements $MailRequestEntityCopyWith<$Res> {
  _$MailRequestEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MailRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? template = null,
    Object? bcc = null,
    Object? to = null,
  }) {
    return _then(_value.copyWith(
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as MailRequestTemplateEntity,
      bcc: null == bcc
          ? _value.bcc
          : bcc // ignore: cast_nullable_to_non_nullable
              as List<String>,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of MailRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MailRequestTemplateEntityCopyWith<$Res> get template {
    return $MailRequestTemplateEntityCopyWith<$Res>(_value.template, (value) {
      return _then(_value.copyWith(template: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MailRequestEntityImplCopyWith<$Res>
    implements $MailRequestEntityCopyWith<$Res> {
  factory _$$MailRequestEntityImplCopyWith(_$MailRequestEntityImpl value,
          $Res Function(_$MailRequestEntityImpl) then) =
      __$$MailRequestEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@_TemplateConverter() MailRequestTemplateEntity template,
      List<String> bcc,
      String to});

  @override
  $MailRequestTemplateEntityCopyWith<$Res> get template;
}

/// @nodoc
class __$$MailRequestEntityImplCopyWithImpl<$Res>
    extends _$MailRequestEntityCopyWithImpl<$Res, _$MailRequestEntityImpl>
    implements _$$MailRequestEntityImplCopyWith<$Res> {
  __$$MailRequestEntityImplCopyWithImpl(_$MailRequestEntityImpl _value,
      $Res Function(_$MailRequestEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MailRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? template = null,
    Object? bcc = null,
    Object? to = null,
  }) {
    return _then(_$MailRequestEntityImpl(
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as MailRequestTemplateEntity,
      bcc: null == bcc
          ? _value._bcc
          : bcc // ignore: cast_nullable_to_non_nullable
              as List<String>,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MailRequestEntityImpl implements _MailRequestEntity {
  _$MailRequestEntityImpl(
      {@_TemplateConverter() required this.template,
      final List<String> bcc = const [],
      this.to = ''})
      : _bcc = bcc;

  factory _$MailRequestEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MailRequestEntityImplFromJson(json);

  @override
  @_TemplateConverter()
  final MailRequestTemplateEntity template;
  final List<String> _bcc;
  @override
  @JsonKey()
  List<String> get bcc {
    if (_bcc is EqualUnmodifiableListView) return _bcc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bcc);
  }

  @override
  @JsonKey()
  final String to;

  @override
  String toString() {
    return 'MailRequestEntity(template: $template, bcc: $bcc, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MailRequestEntityImpl &&
            (identical(other.template, template) ||
                other.template == template) &&
            const DeepCollectionEquality().equals(other._bcc, _bcc) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, template, const DeepCollectionEquality().hash(_bcc), to);

  /// Create a copy of MailRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MailRequestEntityImplCopyWith<_$MailRequestEntityImpl> get copyWith =>
      __$$MailRequestEntityImplCopyWithImpl<_$MailRequestEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MailRequestEntityImplToJson(
      this,
    );
  }
}

abstract class _MailRequestEntity implements MailRequestEntity {
  factory _MailRequestEntity(
      {@_TemplateConverter() required final MailRequestTemplateEntity template,
      final List<String> bcc,
      final String to}) = _$MailRequestEntityImpl;

  factory _MailRequestEntity.fromJson(Map<String, dynamic> json) =
      _$MailRequestEntityImpl.fromJson;

  @override
  @_TemplateConverter()
  MailRequestTemplateEntity get template;
  @override
  List<String> get bcc;
  @override
  String get to;

  /// Create a copy of MailRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MailRequestEntityImplCopyWith<_$MailRequestEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MailRequestTemplateEntity _$MailRequestTemplateEntityFromJson(
    Map<String, dynamic> json) {
  return _MailRequestTemplateEntity.fromJson(json);
}

/// @nodoc
mixin _$MailRequestTemplateEntity {
  @_DataConverter()
  MailRequestDataEntity get data => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this MailRequestTemplateEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MailRequestTemplateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MailRequestTemplateEntityCopyWith<MailRequestTemplateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MailRequestTemplateEntityCopyWith<$Res> {
  factory $MailRequestTemplateEntityCopyWith(MailRequestTemplateEntity value,
          $Res Function(MailRequestTemplateEntity) then) =
      _$MailRequestTemplateEntityCopyWithImpl<$Res, MailRequestTemplateEntity>;
  @useResult
  $Res call({@_DataConverter() MailRequestDataEntity data, String name});

  $MailRequestDataEntityCopyWith<$Res> get data;
}

/// @nodoc
class _$MailRequestTemplateEntityCopyWithImpl<$Res,
        $Val extends MailRequestTemplateEntity>
    implements $MailRequestTemplateEntityCopyWith<$Res> {
  _$MailRequestTemplateEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MailRequestTemplateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MailRequestDataEntity,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of MailRequestTemplateEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MailRequestDataEntityCopyWith<$Res> get data {
    return $MailRequestDataEntityCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MailRequestTemplateEntityImplCopyWith<$Res>
    implements $MailRequestTemplateEntityCopyWith<$Res> {
  factory _$$MailRequestTemplateEntityImplCopyWith(
          _$MailRequestTemplateEntityImpl value,
          $Res Function(_$MailRequestTemplateEntityImpl) then) =
      __$$MailRequestTemplateEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@_DataConverter() MailRequestDataEntity data, String name});

  @override
  $MailRequestDataEntityCopyWith<$Res> get data;
}

/// @nodoc
class __$$MailRequestTemplateEntityImplCopyWithImpl<$Res>
    extends _$MailRequestTemplateEntityCopyWithImpl<$Res,
        _$MailRequestTemplateEntityImpl>
    implements _$$MailRequestTemplateEntityImplCopyWith<$Res> {
  __$$MailRequestTemplateEntityImplCopyWithImpl(
      _$MailRequestTemplateEntityImpl _value,
      $Res Function(_$MailRequestTemplateEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MailRequestTemplateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? name = null,
  }) {
    return _then(_$MailRequestTemplateEntityImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MailRequestDataEntity,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MailRequestTemplateEntityImpl implements _MailRequestTemplateEntity {
  _$MailRequestTemplateEntityImpl(
      {@_DataConverter() required this.data, this.name = ''});

  factory _$MailRequestTemplateEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MailRequestTemplateEntityImplFromJson(json);

  @override
  @_DataConverter()
  final MailRequestDataEntity data;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'MailRequestTemplateEntity(data: $data, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MailRequestTemplateEntityImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, name);

  /// Create a copy of MailRequestTemplateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MailRequestTemplateEntityImplCopyWith<_$MailRequestTemplateEntityImpl>
      get copyWith => __$$MailRequestTemplateEntityImplCopyWithImpl<
          _$MailRequestTemplateEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MailRequestTemplateEntityImplToJson(
      this,
    );
  }
}

abstract class _MailRequestTemplateEntity implements MailRequestTemplateEntity {
  factory _MailRequestTemplateEntity(
      {@_DataConverter() required final MailRequestDataEntity data,
      final String name}) = _$MailRequestTemplateEntityImpl;

  factory _MailRequestTemplateEntity.fromJson(Map<String, dynamic> json) =
      _$MailRequestTemplateEntityImpl.fromJson;

  @override
  @_DataConverter()
  MailRequestDataEntity get data;
  @override
  String get name;

  /// Create a copy of MailRequestTemplateEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MailRequestTemplateEntityImplCopyWith<_$MailRequestTemplateEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MailRequestDataEntity _$MailRequestDataEntityFromJson(
    Map<String, dynamic> json) {
  return _MailRequestDataEntity.fromJson(json);
}

/// @nodoc
mixin _$MailRequestDataEntity {
  @_ProductConverter()
  List<MailRequestProductEntity> get products =>
      throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get totalPrice => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;

  /// Serializes this MailRequestDataEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MailRequestDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MailRequestDataEntityCopyWith<MailRequestDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MailRequestDataEntityCopyWith<$Res> {
  factory $MailRequestDataEntityCopyWith(MailRequestDataEntity value,
          $Res Function(MailRequestDataEntity) then) =
      _$MailRequestDataEntityCopyWithImpl<$Res, MailRequestDataEntity>;
  @useResult
  $Res call(
      {@_ProductConverter() List<MailRequestProductEntity> products,
      String displayName,
      String address,
      String email,
      String phone,
      String totalPrice,
      String subject});
}

/// @nodoc
class _$MailRequestDataEntityCopyWithImpl<$Res,
        $Val extends MailRequestDataEntity>
    implements $MailRequestDataEntityCopyWith<$Res> {
  _$MailRequestDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MailRequestDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? displayName = null,
    Object? address = null,
    Object? email = null,
    Object? phone = null,
    Object? totalPrice = null,
    Object? subject = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<MailRequestProductEntity>,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MailRequestDataEntityImplCopyWith<$Res>
    implements $MailRequestDataEntityCopyWith<$Res> {
  factory _$$MailRequestDataEntityImplCopyWith(
          _$MailRequestDataEntityImpl value,
          $Res Function(_$MailRequestDataEntityImpl) then) =
      __$$MailRequestDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@_ProductConverter() List<MailRequestProductEntity> products,
      String displayName,
      String address,
      String email,
      String phone,
      String totalPrice,
      String subject});
}

/// @nodoc
class __$$MailRequestDataEntityImplCopyWithImpl<$Res>
    extends _$MailRequestDataEntityCopyWithImpl<$Res,
        _$MailRequestDataEntityImpl>
    implements _$$MailRequestDataEntityImplCopyWith<$Res> {
  __$$MailRequestDataEntityImplCopyWithImpl(_$MailRequestDataEntityImpl _value,
      $Res Function(_$MailRequestDataEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MailRequestDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? displayName = null,
    Object? address = null,
    Object? email = null,
    Object? phone = null,
    Object? totalPrice = null,
    Object? subject = null,
  }) {
    return _then(_$MailRequestDataEntityImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<MailRequestProductEntity>,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MailRequestDataEntityImpl implements _MailRequestDataEntity {
  _$MailRequestDataEntityImpl(
      {@_ProductConverter()
      required final List<MailRequestProductEntity> products,
      this.displayName = '',
      this.address = '',
      this.email = '',
      this.phone = '',
      this.totalPrice = '',
      this.subject = ''})
      : _products = products;

  factory _$MailRequestDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MailRequestDataEntityImplFromJson(json);

  final List<MailRequestProductEntity> _products;
  @override
  @_ProductConverter()
  List<MailRequestProductEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey()
  final String displayName;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String totalPrice;
  @override
  @JsonKey()
  final String subject;

  @override
  String toString() {
    return 'MailRequestDataEntity(products: $products, displayName: $displayName, address: $address, email: $email, phone: $phone, totalPrice: $totalPrice, subject: $subject)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MailRequestDataEntityImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.subject, subject) || other.subject == subject));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      displayName,
      address,
      email,
      phone,
      totalPrice,
      subject);

  /// Create a copy of MailRequestDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MailRequestDataEntityImplCopyWith<_$MailRequestDataEntityImpl>
      get copyWith => __$$MailRequestDataEntityImplCopyWithImpl<
          _$MailRequestDataEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MailRequestDataEntityImplToJson(
      this,
    );
  }
}

abstract class _MailRequestDataEntity implements MailRequestDataEntity {
  factory _MailRequestDataEntity(
      {@_ProductConverter()
      required final List<MailRequestProductEntity> products,
      final String displayName,
      final String address,
      final String email,
      final String phone,
      final String totalPrice,
      final String subject}) = _$MailRequestDataEntityImpl;

  factory _MailRequestDataEntity.fromJson(Map<String, dynamic> json) =
      _$MailRequestDataEntityImpl.fromJson;

  @override
  @_ProductConverter()
  List<MailRequestProductEntity> get products;
  @override
  String get displayName;
  @override
  String get address;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get totalPrice;
  @override
  String get subject;

  /// Create a copy of MailRequestDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MailRequestDataEntityImplCopyWith<_$MailRequestDataEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MailRequestProductEntity _$MailRequestProductEntityFromJson(
    Map<String, dynamic> json) {
  return _MailRequestProductEntity.fromJson(json);
}

/// @nodoc
mixin _$MailRequestProductEntity {
  String get productName => throw _privateConstructorUsedError;
  String get productPrice => throw _privateConstructorUsedError;
  String get productType => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;

  /// Serializes this MailRequestProductEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MailRequestProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MailRequestProductEntityCopyWith<MailRequestProductEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MailRequestProductEntityCopyWith<$Res> {
  factory $MailRequestProductEntityCopyWith(MailRequestProductEntity value,
          $Res Function(MailRequestProductEntity) then) =
      _$MailRequestProductEntityCopyWithImpl<$Res, MailRequestProductEntity>;
  @useResult
  $Res call(
      {String productName,
      String productPrice,
      String productType,
      String quantity});
}

/// @nodoc
class _$MailRequestProductEntityCopyWithImpl<$Res,
        $Val extends MailRequestProductEntity>
    implements $MailRequestProductEntityCopyWith<$Res> {
  _$MailRequestProductEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MailRequestProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? productPrice = null,
    Object? productType = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MailRequestProductEntityImplCopyWith<$Res>
    implements $MailRequestProductEntityCopyWith<$Res> {
  factory _$$MailRequestProductEntityImplCopyWith(
          _$MailRequestProductEntityImpl value,
          $Res Function(_$MailRequestProductEntityImpl) then) =
      __$$MailRequestProductEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productName,
      String productPrice,
      String productType,
      String quantity});
}

/// @nodoc
class __$$MailRequestProductEntityImplCopyWithImpl<$Res>
    extends _$MailRequestProductEntityCopyWithImpl<$Res,
        _$MailRequestProductEntityImpl>
    implements _$$MailRequestProductEntityImplCopyWith<$Res> {
  __$$MailRequestProductEntityImplCopyWithImpl(
      _$MailRequestProductEntityImpl _value,
      $Res Function(_$MailRequestProductEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MailRequestProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? productPrice = null,
    Object? productType = null,
    Object? quantity = null,
  }) {
    return _then(_$MailRequestProductEntityImpl(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MailRequestProductEntityImpl implements _MailRequestProductEntity {
  _$MailRequestProductEntityImpl(
      {this.productName = '',
      this.productPrice = '',
      this.productType = '',
      this.quantity = ''});

  factory _$MailRequestProductEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MailRequestProductEntityImplFromJson(json);

  @override
  @JsonKey()
  final String productName;
  @override
  @JsonKey()
  final String productPrice;
  @override
  @JsonKey()
  final String productType;
  @override
  @JsonKey()
  final String quantity;

  @override
  String toString() {
    return 'MailRequestProductEntity(productName: $productName, productPrice: $productPrice, productType: $productType, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MailRequestProductEntityImpl &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, productName, productPrice, productType, quantity);

  /// Create a copy of MailRequestProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MailRequestProductEntityImplCopyWith<_$MailRequestProductEntityImpl>
      get copyWith => __$$MailRequestProductEntityImplCopyWithImpl<
          _$MailRequestProductEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MailRequestProductEntityImplToJson(
      this,
    );
  }
}

abstract class _MailRequestProductEntity implements MailRequestProductEntity {
  factory _MailRequestProductEntity(
      {final String productName,
      final String productPrice,
      final String productType,
      final String quantity}) = _$MailRequestProductEntityImpl;

  factory _MailRequestProductEntity.fromJson(Map<String, dynamic> json) =
      _$MailRequestProductEntityImpl.fromJson;

  @override
  String get productName;
  @override
  String get productPrice;
  @override
  String get productType;
  @override
  String get quantity;

  /// Create a copy of MailRequestProductEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MailRequestProductEntityImplCopyWith<_$MailRequestProductEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
