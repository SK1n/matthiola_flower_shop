import 'package:freezed_annotation/freezed_annotation.dart';

part 'mail_response_entity.freezed.dart';
part 'mail_response_entity.g.dart';

@freezed
class MailResponseEntity with _$MailResponseEntity {
  factory MailResponseEntity({
    @_Converter() required MailDeliveryResponse delivery,
  }) = _MailResponseEntity;

  factory MailResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$MailResponseEntityFromJson(json);
}

@freezed
class MailDeliveryResponse with _$MailDeliveryResponse {
  // ignore: invalid_annotation_target a
  @JsonSerializable(explicitToJson: true)
  factory MailDeliveryResponse({
    required String state,
    String? error,
  }) = _MailDeliveryResponse;

  factory MailDeliveryResponse.fromJson(Map<String, dynamic> json) =>
      _$MailDeliveryResponseFromJson(json);
}

class _Converter
    implements JsonConverter<MailDeliveryResponse, Map<String, dynamic>> {
  const _Converter();

  @override
  MailDeliveryResponse fromJson(Map<String, dynamic> json) {
    return MailDeliveryResponse.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(MailDeliveryResponse data) => data.toJson();
}
