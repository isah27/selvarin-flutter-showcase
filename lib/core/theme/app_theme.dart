import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.alabaster,
    colorScheme: const ColorScheme.light(
      primary: AppColors.racingGreen,
      onPrimary: AppColors.white,
      secondary: AppColors.salmon,
      surface: AppColors.surface,
      onSurface: AppColors.graphite,
    ),
    textTheme: const TextTheme(
      displaySmall: AppTypography.display,
      headlineSmall: AppTypography.headline,
      titleMedium: AppTypography.title,
      bodyMedium: AppTypography.body,
      labelLarge: AppTypography.label,
      bodySmall: AppTypography.caption,
    ),
    dividerColor: AppColors.divider,
    splashFactory: InkRipple.splashFactory,
  );
}
