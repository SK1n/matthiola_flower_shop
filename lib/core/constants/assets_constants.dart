// ignore_for_file: non_constant_identifier_names

import 'package:matthiola_flower_shop/core/utils/extensions/files_extensions.dart';

final class AssetsConstants {
  static const String _ASSETS = 'assets/';
  static const String _LOGO = '${_ASSETS}logo/';
  static const String _ICONS = '${_ASSETS}icons/';

  static String APP_LOGO = '${_LOGO}app_logo'.svg;
  static String EYE_ICON = '${_ICONS}eye'.svg;
  static String EYE_SLASH_ICON = '${_ICONS}eye_slash'.svg;

  static String NOT_FOUND_ANIM = '${_ASSETS}animations/not-found.json';

  static const String ADD_TO_CART = '${_ICONS}shopping_cart.svg';
  static const String POT_FLOWER = '${_ICONS}pot_flower.svg';

  static const String STEM_FLOWER = '${_ICONS}stem_flower.svg';
}
