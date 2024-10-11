import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  double get maxHeight => MediaQuery.sizeOf(this).height;
  double get maxWidth => MediaQuery.sizeOf(this).width;
}
