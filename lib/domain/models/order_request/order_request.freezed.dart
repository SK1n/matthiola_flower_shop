// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) {
  return _OrderRequestResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderRequest {
  String get address => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  @_ProductEntityConverter()
  List<OrderProductRequest> get products => throw _privateConstructorUsedError;
  String get totalPrice => throw _privateConstructorUsedError;
  bool get isDev => throw _privateConstructorUsedError;

  /// Serializes this OrderRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderRequestCopyWith<OrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderRequestCopyWith<$Res> {
  factory $OrderRequestCopyWith(
          OrderRequest value, $Res Function(OrderRequest) then) =
      _$OrderRequestCopyWithImpl<$Res, OrderRequest>;
  @useResult
  $Res call(
      {String address,
      String email,
      String phone,
      String displayName,
      @_ProductEntityConverter() List<OrderProductRequest> products,
      String totalPrice,
      bool isDev});
}

/// @nodoc
class _$OrderRequestCopyWithImpl<$Res, $Val extends OrderRequest>
    implements $OrderRequestCopyWith<$Res> {
  _$OrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? email = null,
    Object? phone = null,
    Object? displayName = null,
    Object? products = null,
    Object? totalPrice = null,
    Object? isDev = null,
  }) {
    return _then(_value.copyWith(
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
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<OrderProductRequest>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      isDev: null == isDev
          ? _value.isDev
          : isDev // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderRequestResponseImplCopyWith<$Res>
    implements $OrderRequestCopyWith<$Res> {
  factory _$$OrderRequestResponseImplCopyWith(_$OrderRequestResponseImpl value,
          $Res Function(_$OrderRequestResponseImpl) then) =
      __$$OrderRequestResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      String email,
      String phone,
      String displayName,
      @_ProductEntityConverter() List<OrderProductRequest> products,
      String totalPrice,
      bool isDev});
}

/// @nodoc
class __$$OrderRequestResponseImplCopyWithImpl<$Res>
    extends _$OrderRequestCopyWithImpl<$Res, _$OrderRequestResponseImpl>
    implements _$$OrderRequestResponseImplCopyWith<$Res> {
  __$$OrderRequestResponseImplCopyWithImpl(_$OrderRequestResponseImpl _value,
      $Res Function(_$OrderRequestResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? email = null,
    Object? phone = null,
    Object? displayName = null,
    Object? products = null,
    Object? totalPrice = null,
    Object? isDev = null,
  }) {
    return _then(_$OrderRequestResponseImpl(
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
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<OrderProductRequest>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      isDev: null == isDev
          ? _value.isDev
          : isDev // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderRequestResponseImpl
    with DiagnosticableTreeMixin
    implements _OrderRequestResponse {
  _$OrderRequestResponseImpl(
      {required this.address,
      required this.email,
      required this.phone,
      required this.displayName,
      @_ProductEntityConverter()
      required final List<OrderProductRequest> products,
      required this.totalPrice,
      this.isDev = kDebugMode})
      : _products = products;

  factory _$OrderRequestResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderRequestResponseImplFromJson(json);

  @override
  final String address;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String displayName;
  final List<OrderProductRequest> _products;
  @override
  @_ProductEntityConverter()
  List<OrderProductRequest> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final String totalPrice;
  @override
  @JsonKey()
  final bool isDev;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OrderRequest(address: $address, email: $email, phone: $phone, displayName: $displayName, products: $products, totalPrice: $totalPrice, isDev: $isDev)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OrderRequest'))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('displayName', displayName))
      ..add(DiagnosticsProperty('products', products))
      ..add(DiagnosticsProperty('totalPrice', totalPrice))
      ..add(DiagnosticsProperty('isDev', isDev));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderRequestResponseImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.isDev, isDev) || other.isDev == isDev));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      email,
      phone,
      displayName,
      const DeepCollectionEquality().hash(_products),
      totalPrice,
      isDev);

  /// Create a copy of OrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderRequestResponseImplCopyWith<_$OrderRequestResponseImpl>
      get copyWith =>
          __$$OrderRequestResponseImplCopyWithImpl<_$OrderRequestResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderRequestResponseImplToJson(
      this,
    );
  }
}

abstract class _OrderRequestResponse implements OrderRequest {
  factory _OrderRequestResponse(
      {required final String address,
      required final String email,
      required final String phone,
      required final String displayName,
      @_ProductEntityConverter()
      required final List<OrderProductRequest> products,
      required final String totalPrice,
      final bool isDev}) = _$OrderRequestResponseImpl;

  factory _OrderRequestResponse.fromJson(Map<String, dynamic> json) =
      _$OrderRequestResponseImpl.fromJson;

  @override
  String get address;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get displayName;
  @override
  @_ProductEntityConverter()
  List<OrderProductRequest> get products;
  @override
  String get totalPrice;
  @override
  bool get isDev;

  /// Create a copy of OrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderRequestResponseImplCopyWith<_$OrderRequestResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OrderProductRequest _$OrderProductRequestFromJson(Map<String, dynamic> json) {
  return _OrderProductRequest.fromJson(json);
}

/// @nodoc
mixin _$OrderProductRequest {
  String get productName => throw _privateConstructorUsedError;
  String get productType => throw _privateConstructorUsedError;
  String get productPrice => throw _privateConstructorUsedError;
  String get productUid => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;

  /// Serializes this OrderProductRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderProductRequestCopyWith<OrderProductRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderProductRequestCopyWith<$Res> {
  factory $OrderProductRequestCopyWith(
          OrderProductRequest value, $Res Function(OrderProductRequest) then) =
      _$OrderProductRequestCopyWithImpl<$Res, OrderProductRequest>;
  @useResult
  $Res call(
      {String productName,
      String productType,
      String productPrice,
      String productUid,
      String quantity});
}

/// @nodoc
class _$OrderProductRequestCopyWithImpl<$Res, $Val extends OrderProductRequest>
    implements $OrderProductRequestCopyWith<$Res> {
  _$OrderProductRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? productType = null,
    Object? productPrice = null,
    Object? productUid = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as String,
      productUid: null == productUid
          ? _value.productUid
          : productUid // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderProductRequestImplCopyWith<$Res>
    implements $OrderProductRequestCopyWith<$Res> {
  factory _$$OrderProductRequestImplCopyWith(_$OrderProductRequestImpl value,
          $Res Function(_$OrderProductRequestImpl) then) =
      __$$OrderProductRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productName,
      String productType,
      String productPrice,
      String productUid,
      String quantity});
}

/// @nodoc
class __$$OrderProductRequestImplCopyWithImpl<$Res>
    extends _$OrderProductRequestCopyWithImpl<$Res, _$OrderProductRequestImpl>
    implements _$$OrderProductRequestImplCopyWith<$Res> {
  __$$OrderProductRequestImplCopyWithImpl(_$OrderProductRequestImpl _value,
      $Res Function(_$OrderProductRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? productType = null,
    Object? productPrice = null,
    Object? productUid = null,
    Object? quantity = null,
  }) {
    return _then(_$OrderProductRequestImpl(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as String,
      productUid: null == productUid
          ? _value.productUid
          : productUid // ignore: cast_nullable_to_non_nullable
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
class _$OrderProductRequestImpl
    with DiagnosticableTreeMixin
    implements _OrderProductRequest {
  _$OrderProductRequestImpl(
      {required this.productName,
      required this.productType,
      required this.productPrice,
      required this.productUid,
      required this.quantity});

  factory _$OrderProductRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderProductRequestImplFromJson(json);

  @override
  final String productName;
  @override
  final String productType;
  @override
  final String productPrice;
  @override
  final String productUid;
  @override
  final String quantity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OrderProductRequest(productName: $productName, productType: $productType, productPrice: $productPrice, productUid: $productUid, quantity: $quantity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OrderProductRequest'))
      ..add(DiagnosticsProperty('productName', productName))
      ..add(DiagnosticsProperty('productType', productType))
      ..add(DiagnosticsProperty('productPrice', productPrice))
      ..add(DiagnosticsProperty('productUid', productUid))
      ..add(DiagnosticsProperty('quantity', quantity));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderProductRequestImpl &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.productUid, productUid) ||
                other.productUid == productUid) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productName, productType,
      productPrice, productUid, quantity);

  /// Create a copy of OrderProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderProductRequestImplCopyWith<_$OrderProductRequestImpl> get copyWith =>
      __$$OrderProductRequestImplCopyWithImpl<_$OrderProductRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderProductRequestImplToJson(
      this,
    );
  }
}

abstract class _OrderProductRequest implements OrderProductRequest {
  factory _OrderProductRequest(
      {required final String productName,
      required final String productType,
      required final String productPrice,
      required final String productUid,
      required final String quantity}) = _$OrderProductRequestImpl;

  factory _OrderProductRequest.fromJson(Map<String, dynamic> json) =
      _$OrderProductRequestImpl.fromJson;

  @override
  String get productName;
  @override
  String get productType;
  @override
  String get productPrice;
  @override
  String get productUid;
  @override
  String get quantity;

  /// Create a copy of OrderProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderProductRequestImplCopyWith<_$OrderProductRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
