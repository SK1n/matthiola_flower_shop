// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mail_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MailResponseEntityImpl _$$MailResponseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$MailResponseEntityImpl(
      delivery:
          const _Converter().fromJson(json['delivery'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MailResponseEntityImplToJson(
        _$MailResponseEntityImpl instance) =>
    <String, dynamic>{
      'delivery': const _Converter().toJson(instance.delivery),
    };

_$MailDeliveryResponseImpl _$$MailDeliveryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MailDeliveryResponseImpl(
      state: json['state'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$MailDeliveryResponseImplToJson(
        _$MailDeliveryResponseImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'error': instance.error,
    };
