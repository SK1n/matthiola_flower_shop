import 'package:freezed_annotation/freezed_annotation.dart';

part 'flower_entity.freezed.dart';
part 'flower_entity.g.dart';

@freezed
class FlowerEntity with _$FlowerEntity {
  const factory FlowerEntity({
    required String description,
    required String flowerType,
    required String id,
    required String image,
    required String name,
    required int batchSize,
    required double price,
    required int quantity,
    required int type,
  }) = _FlowerEntity;

  factory FlowerEntity.fromJson(Map<String, Object?> json) =>
      _$FlowerEntityFromJson(json);

  static const empty = FlowerEntity(
    description: '',
    flowerType: '',
    id: '',
    image: '',
    name: '',
    batchSize: 1,
    price: 0,
    quantity: 0,
    type: 0,
  );
}

extension FlowerEntityExtenstion on FlowerEntity {
  bool get isEmpty => this == FlowerEntity.empty;
  bool get isNotEmpty => this != FlowerEntity.empty;
}
