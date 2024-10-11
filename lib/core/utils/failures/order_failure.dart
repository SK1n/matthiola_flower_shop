import 'package:matthiola_flower_shop/core/utils/failures/failure.dart';
import 'package:matthiola_flower_shop/domain/models/order_response/order_response.dart';

class OrderFailure extends Failure {
  const OrderFailure(this.response);
  final List<OrderResponse> response;
}
