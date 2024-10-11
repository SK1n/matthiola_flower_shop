import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_request.freezed.dart';
part 'order_request.g.dart';

@freezed
class OrderRequest with _$OrderRequest {
  factory OrderRequest({
    required String address,
    required String email,
    required String phone,
    required String displayName,
    @_ProductEntityConverter() required List<OrderProductRequest> products,
    required String totalPrice,
    @Default(kDebugMode) bool isDev,
  }) = _OrderRequestResponse;

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestFromJson(json);
}

@freezed
class OrderProductRequest with _$OrderProductRequest {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory OrderProductRequest({
    required String productName,
    required String productType,
    required String productPrice,
    required String productUid,
    required String quantity,
  }) = _OrderProductRequest;

  factory OrderProductRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderProductRequestFromJson(json);
}

class _ProductEntityConverter
    implements JsonConverter<OrderProductRequest, Map<String, dynamic>> {
  const _ProductEntityConverter();

  @override
  OrderProductRequest fromJson(Map<String, dynamic> json) {
    return OrderProductRequest.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(OrderProductRequest data) => data.toJson();
}
