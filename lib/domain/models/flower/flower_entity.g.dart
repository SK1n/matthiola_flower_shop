// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flower_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlowerEntityImpl _$$FlowerEntityImplFromJson(Map<String, dynamic> json) =>
    _$FlowerEntityImpl(
      description: json['description'] as String,
      flowerType: json['flowerType'] as String,
      id: json['id'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      batchSize: (json['batchSize'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      type: (json['type'] as num).toInt(),
    );

Map<String, dynamic> _$$FlowerEntityImplToJson(_$FlowerEntityImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'flowerType': instance.flowerType,
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'batchSize': instance.batchSize,
      'price': instance.price,
      'quantity': instance.quantity,
      'type': instance.type,
    };
