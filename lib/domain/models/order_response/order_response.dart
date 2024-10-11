import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_response.freezed.dart';

@freezed
class OrderResponse with _$OrderResponse {
  factory OrderResponse({
    required String id,
    int? quantity,
    double? price,
  }) = _OrderResponse;

  static OrderResponse empty = OrderResponse(id: '');
}
