import 'package:flutter/material.dart';
import 'package:style_hub/setUp/color/light_app_palette.dart';
import 'package:style_hub/setUp/text/text_style.dart';
import 'package:style_hub/setUp/text/text_theme.dart';

abstract class LigthTheme {
  static ThemeData get theme {
    return ThemeData(
        useMaterial3: true,
        colorScheme: ThemeData.from(colorScheme: ThemeData.light().colorScheme)
            .colorScheme
            .copyWith(
              primary: LightAppPalette.primary,
              primaryContainer: LightAppPalette.primaryContainer,
              onPrimary: LightAppPalette.onPrimary,
              outline: LightAppPalette.outline,
              secondary: LightAppPalette.secondary,
              onSecondary: LightAppPalette.onSecondary,
              background: LightAppPalette.background,
              surface: LightAppPalette.surfaceContainerLow,
              onSurface: LightAppPalette.onSurface,
              error: LightAppPalette.error,
              onError: LightAppPalette.onError,
              onTertiaryContainer: LightAppPalette.shimmerBase,
              tertiary: LightAppPalette.shimmerHighlight,
            ),
        fontFamily: 'Roboto',
        textTheme: const ExtendedTextTheme(
          TextThemes.titleModerate,
          TextThemes.bodyXSmall,
          displayLarge: TextThemes.displayLarge,
          displayMedium: TextThemes.displayMedium,
          displaySmall: TextThemes.displaySmall,
          headlineLarge: TextThemes.headlineLarge,
          headlineMedium: TextThemes.headlineMedium,
          headlineSmall: TextThemes.headlineSmall,
          titleLarge: TextThemes.titleLarge,
          titleMedium: TextThemes.titleMedium,
          titleSmall: TextThemes.titleSmall,
          bodyLarge: TextThemes.bodyLarge,
          bodyMedium: TextThemes.bodyMedium,
          bodySmall: TextThemes.bodySmall,
        ));
  }
}
