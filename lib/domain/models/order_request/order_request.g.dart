// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderRequestResponseImpl _$$OrderRequestResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderRequestResponseImpl(
      address: json['address'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      displayName: json['displayName'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => const _ProductEntityConverter()
              .fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: json['totalPrice'] as String,
      isDev: json['isDev'] as bool? ?? kDebugMode,
    );

Map<String, dynamic> _$$OrderRequestResponseImplToJson(
        _$OrderRequestResponseImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'email': instance.email,
      'phone': instance.phone,
      'displayName': instance.displayName,
      'products': instance.products
          .map(const _ProductEntityConverter().toJson)
          .toList(),
      'totalPrice': instance.totalPrice,
      'isDev': instance.isDev,
    };

_$OrderProductRequestImpl _$$OrderProductRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderProductRequestImpl(
      productName: json['productName'] as String,
      productType: json['productType'] as String,
      productPrice: json['productPrice'] as String,
      productUid: json['productUid'] as String,
      quantity: json['quantity'] as String,
    );

Map<String, dynamic> _$$OrderProductRequestImplToJson(
        _$OrderProductRequestImpl instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'productType': instance.productType,
      'productPrice': instance.productPrice,
      'productUid': instance.productUid,
      'quantity': instance.quantity,
    };
