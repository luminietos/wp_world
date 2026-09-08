import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppColorScheme {
  static ColorScheme light = ColorScheme(
    brightness: Brightness.light,

    // 'BRAND'
    primary: AppColors.accentGreen,
    onPrimary: Colors.white,
    secondary: AppColors.accentLavender,
    onSecondary: Colors.white,

    // SURFACES (Material 3)
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightText,
    surfaceTint: AppColors.accentGreen,

    // CONTAINERS
    surfaceContainerLowest: AppColors.lightSurface,
    surfaceContainerLow: AppColors.lightSurface,
    surfaceContainer: AppColors.lightSurface,
    surfaceContainerHigh: AppColors.lightSurface,
    surfaceContainerHighest: AppColors.lightSurface,

    // ERROR
    error: AppColors.error,
    onError: Colors.white,
  );

  static ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,

    // 'BRAND'
    primary: AppColors.accentGreen,
    onPrimary: Colors.white,
    secondary: AppColors.accentLavender,
    onSecondary: Colors.white,

    // SURFACES
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkText,
    surfaceTint: AppColors.accentGreen,

    // CONTAINERS
    surfaceContainerLowest: AppColors.darkSurface,
    surfaceContainerLow: AppColors.darkSurface,
    surfaceContainer: AppColors.darkSurface,
    surfaceContainerHigh: AppColors.darkSurface,
    surfaceContainerHighest: AppColors.darkSurface,

    // ERROR
    error: AppColors.error,
    onError: Colors.white,
  );
}
