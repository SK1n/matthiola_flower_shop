// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mail_request_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MailRequestEntityImpl _$$MailRequestEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$MailRequestEntityImpl(
      template: const _TemplateConverter()
          .fromJson(json['template'] as Map<String, dynamic>),
      bcc: (json['bcc'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      to: json['to'] as String? ?? '',
    );

Map<String, dynamic> _$$MailRequestEntityImplToJson(
        _$MailRequestEntityImpl instance) =>
    <String, dynamic>{
      'template': const _TemplateConverter().toJson(instance.template),
      'bcc': instance.bcc,
      'to': instance.to,
    };

_$MailRequestTemplateEntityImpl _$$MailRequestTemplateEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$MailRequestTemplateEntityImpl(
      data:
          const _DataConverter().fromJson(json['data'] as Map<String, dynamic>),
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$$MailRequestTemplateEntityImplToJson(
        _$MailRequestTemplateEntityImpl instance) =>
    <String, dynamic>{
      'data': const _DataConverter().toJson(instance.data),
      'name': instance.name,
    };

_$MailRequestDataEntityImpl _$$MailRequestDataEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$MailRequestDataEntityImpl(
      products: (json['products'] as List<dynamic>)
          .map((e) =>
              const _ProductConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      displayName: json['displayName'] as String? ?? '',
      address: json['address'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      totalPrice: json['totalPrice'] as String? ?? '',
      subject: json['subject'] as String? ?? '',
    );

Map<String, dynamic> _$$MailRequestDataEntityImplToJson(
        _$MailRequestDataEntityImpl instance) =>
    <String, dynamic>{
      'products':
          instance.products.map(const _ProductConverter().toJson).toList(),
      'displayName': instance.displayName,
      'address': instance.address,
      'email': instance.email,
      'phone': instance.phone,
      'totalPrice': instance.totalPrice,
      'subject': instance.subject,
    };

_$MailRequestProductEntityImpl _$$MailRequestProductEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$MailRequestProductEntityImpl(
      productName: json['productName'] as String? ?? '',
      productPrice: json['productPrice'] as String? ?? '',
      productType: json['productType'] as String? ?? '',
      quantity: json['quantity'] as String? ?? '',
    );

Map<String, dynamic> _$$MailRequestProductEntityImplToJson(
        _$MailRequestProductEntityImpl instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productType': instance.productType,
      'quantity': instance.quantity,
    };
