enum FlowerType {
  thread,
  pot,

  invalid;

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
