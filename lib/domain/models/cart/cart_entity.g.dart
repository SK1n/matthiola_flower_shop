// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartEntityImpl _$$CartEntityImplFromJson(Map<String, dynamic> json) =>
    _$CartEntityImpl(
      item: FlowerEntity.fromJson(json['item'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      totalPrice: json['totalPrice'] ?? 0.0,
      error: json['error'] as String? ?? '',
    );

Map<String, dynamic> _$$CartEntityImplToJson(_$CartEntityImpl instance) =>
    <String, dynamic>{
      'item': instance.item.toJson(),
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
      'error': instance.error,
    };
