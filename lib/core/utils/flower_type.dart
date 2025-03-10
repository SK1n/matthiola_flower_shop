import 'package:matthiola_flower_shop/core/constants/app_constants.dart';
import 'package:matthiola_flower_shop/core/constants/assets_constants.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';

enum FlowerType {
  thread(AppConstants.FLOWER_TYPE_THREAD, AssetsConstants.STEM_FLOWER),
  pot(AppConstants.FLOWER_TYPE_POT, AssetsConstants.POT_FLOWER),
  accessory(
    AppConstants.FLOWER_TYPE_ACCESSORY,
    AssetsConstants.FLOWER_ACCESSORIES,
  ),
  invalid('', '');

  const FlowerType(this.key, this.svg);
  final String key;
  final String svg;

  String get text => t[key] as String;

  static FlowerType fromCode(int code) {
    return switch (code) {
      0 => FlowerType.thread,
      1 => FlowerType.pot,
      2 => FlowerType.accessory,
      _ => FlowerType.invalid,
    };
  }

  static int toCode(FlowerType type) {
    return switch (type) {
      FlowerType.thread => 0,
      FlowerType.pot => 1,
      FlowerType.accessory => 2,
      FlowerType.invalid => -1,
    };
  }

  bool get isThread => this == FlowerType.thread;
  bool get isPot => this == FlowerType.pot;
  bool get isAccessory => this == FlowerType.accessory;
  bool get isInvalid => this == FlowerType.invalid;
}

extension XFlowerType on FlowerType {
  bool get isThread => this == FlowerType.thread;
  bool get isPot => this == FlowerType.pot;
  bool get isInvalid => this == FlowerType.invalid;
}
