import 'package:freezed_annotation/freezed_annotation.dart';

part 'mail_request_entity.freezed.dart';
part 'mail_request_entity.g.dart';

@freezed
class MailRequestEntity with _$MailRequestEntity {
  factory MailRequestEntity({
    @_TemplateConverter() required MailRequestTemplateEntity template,
    @Default([]) List<String> bcc,
    @Default('') String to,
  }) = _MailRequestEntity;

  factory MailRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$MailRequestEntityFromJson(json);
}

@freezed
class MailRequestTemplateEntity with _$MailRequestTemplateEntity {
  // ignore: invalid_annotation_target a
  @JsonSerializable(explicitToJson: true)
  factory MailRequestTemplateEntity({
    @_DataConverter() required MailRequestDataEntity data,
    @Default('') String name,
  }) = _MailRequestTemplateEntity;

  factory MailRequestTemplateEntity.fromJson(Map<String, dynamic> json) =>
      _$MailRequestTemplateEntityFromJson(json);
}

@freezed
class MailRequestDataEntity with _$MailRequestDataEntity {
  // ignore: invalid_annotation_target a
  @JsonSerializable(explicitToJson: true)
  factory MailRequestDataEntity({
    @_ProductConverter() required List<MailRequestProductEntity> products,
    @Default('') String displayName,
    @Default('') String address,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String totalPrice,
    @Default('') String subject,
  }) = _MailRequestDataEntity;

  factory MailRequestDataEntity.fromJson(Map<String, dynamic> json) =>
      _$MailRequestDataEntityFromJson(json);
}

@freezed
class MailRequestProductEntity with _$MailRequestProductEntity {
  // ignore: invalid_annotation_target a
  @JsonSerializable(explicitToJson: true)
  factory MailRequestProductEntity({
    @Default('') String productName,
    @Default('') String productPrice,
    @Default('') String productType,
    @Default('') String quantity,
  }) = _MailRequestProductEntity;

  factory MailRequestProductEntity.fromJson(Map<String, dynamic> json) =>
      _$MailRequestProductEntityFromJson(json);
}

class _TemplateConverter
    implements JsonConverter<MailRequestTemplateEntity, Map<String, dynamic>> {
  const _TemplateConverter();

  @override
  MailRequestTemplateEntity fromJson(Map<String, dynamic> json) {
    return MailRequestTemplateEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(MailRequestTemplateEntity data) => data.toJson();
}

class _DataConverter
    implements JsonConverter<MailRequestDataEntity, Map<String, dynamic>> {
  const _DataConverter();

  @override
  MailRequestDataEntity fromJson(Map<String, dynamic> json) {
    return MailRequestDataEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(MailRequestDataEntity data) => data.toJson();
}

class _ProductConverter
    implements JsonConverter<MailRequestProductEntity, Map<String, dynamic>> {
  const _ProductConverter();

  @override
  MailRequestProductEntity fromJson(Map<String, dynamic> json) {
    return MailRequestProductEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(MailRequestProductEntity data) => data.toJson();
}
