import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final class AppTheme {
  static ThemeData get light => FlexThemeData.light(
        scheme: FlexScheme.gold,
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
        fontFamily: 'Roboto',
      );

  static ThemeData get dark => FlexThemeData.dark(
        scheme: FlexScheme.gold,
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
        fontFamily: 'Roboto',
      );
}
