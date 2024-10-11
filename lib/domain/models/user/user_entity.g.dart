// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      address: json['address'] as String,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'displayName': instance.displayName,
      'email': instance.email,
      'phone': instance.phone,
      'uid': instance.uid,
    };
