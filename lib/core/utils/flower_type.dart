import 'package:matthiola_flower_shop/core/constants/app_constants.dart';
import 'package:matthiola_flower_shop/gen/translations/translations.g.dart';

enum FlowerType {
  thread(AppConstants.FLOWER_TYPE_THREAD),
  pot(AppConstants.FLOWER_TYPE_POT),
  invalid('');

  const FlowerType(this.key);
  final String key;

  String get text => t[key] as String;

  static FlowerType fromCode(int code) {
    return switch (code) {
      0 => FlowerType.thread,
      1 => FlowerType.pot,
      _ => FlowerType.invalid,
    };
  }

  static int toCode(FlowerType type) {
    return switch (type) {
      FlowerType.thread => 0,
      FlowerType.pot => 1,
      FlowerType.invalid => -1,
    };
  }
}

extension XFlowerType on FlowerType {
  bool get isThread => this == FlowerType.thread;
  bool get isPot => this == FlowerType.pot;
  bool get isInvalid => this == FlowerType.invalid;
}
