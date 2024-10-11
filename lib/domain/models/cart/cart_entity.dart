import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:matthiola_flower_shop/domain/models/flower/flower_entity.dart';

part 'cart_entity.freezed.dart';
part 'cart_entity.g.dart';

@freezed
class CartEntity with _$CartEntity {
  factory CartEntity({
    required FlowerEntity item,
    required int quantity,
    @Default(0.0) totalPrice,
    @Default('') String error,
  }) = _CartEntity;

  factory CartEntity.fromJson(Map<String, dynamic> json) =>
      _$CartEntityFromJson(json);

  static CartEntity empty = CartEntity(item: FlowerEntity.empty, quantity: 0);
}
