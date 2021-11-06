import 'package:flutter/material.dart';
import 'package:showroom/app/data/theme/color_theme.dart';

class AppThemes {
  static final Color _lightFocusColor = AppColors.darkGrey.withOpacity(0.12);
  static final Color _darkFocusColor =
      AppColors.extraLightGrey.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        color: colorScheme.primary,
        elevation: 0,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.darkGrey,
    primaryVariant: AppColors.darkGrey,
    secondary: AppColors.darkGrey,
    secondaryVariant: AppColors.grey,
    background: AppColors.extraLightGrey,
    surface: AppColors.grey,
    onBackground: AppColors.darkGrey,
    // White with 0.05 opacity
    error: Colors.red,
    onError: Colors.white,
    onPrimary: AppColors.extraLightGrey,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    brightness: Brightness.light,
  );

  static final ColorScheme darkColorScheme = ColorScheme(
    primary: AppColors.extraLightGrey,
    primaryVariant: AppColors.lightGrey,
    secondary: AppColors.lightGrey,
    secondaryVariant: AppColors.grey,
    background: AppColors.darkGrey,
    surface: AppColors.grey,
    onBackground: AppColors.extraLightGrey,
    // White with 0.05 opacity
    error: Colors.red,
    onError: Colors.white,
    onPrimary: AppColors.darkGrey,
    onSecondary: Colors.black,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );
}
