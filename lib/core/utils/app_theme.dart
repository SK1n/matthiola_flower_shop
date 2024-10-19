import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final class AppTheme {
  static ThemeData get light => FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xffd1ae5d),
          primaryContainer: Color(0xffab8834),
          secondary: Color(0xffd1c15d),
          secondaryContainer: Color(0xffab9b34),
          tertiary: Color(0xff5e488f),
          tertiaryContainer: Color(0xff432c75),
          appBarColor: Color(0xffab9b34),
          error: Color(0xffb00020),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          textButtonRadius: 8,
          filledButtonRadius: 8,
          elevatedButtonRadius: 8,
          outlinedButtonRadius: 8,
          toggleButtonsRadius: 8,
          segmentedButtonRadius: 8,
          inputDecoratorRadius: 8,
          fabUseShape: true,
          fabRadius: 8,
          cardRadius: 8,
          popupMenuRadius: 8,
          popupMenuElevation: 5,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        fontFamily: 'Roboto',
      );

  static ThemeData get dark => FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xffd1ae5d),
          primaryContainer: Color(0xffab8834),
          secondary: Color(0xffd1c15d),
          secondaryContainer: Color(0xffab9b34),
          tertiary: Color(0xff5e488f),
          tertiaryContainer: Color(0xff432c75),
          appBarColor: Color(0xffab9b34),
          error: Color(0xffcf6679),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          textButtonRadius: 8,
          filledButtonRadius: 8,
          elevatedButtonRadius: 8,
          outlinedButtonRadius: 8,
          toggleButtonsRadius: 8,
          segmentedButtonRadius: 8,
          inputDecoratorRadius: 8,
          fabUseShape: true,
          fabRadius: 8,
          cardRadius: 8,
          popupMenuRadius: 8,
          popupMenuElevation: 5,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        fontFamily: 'Roboto',
      );
}
