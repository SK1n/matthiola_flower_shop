// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateAccountRequestImpl _$$CreateAccountRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateAccountRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      displayName: json['displayName'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$CreateAccountRequestImplToJson(
        _$CreateAccountRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'displayName': instance.displayName,
      'address': instance.address,
      'phone': instance.phone,
    };
