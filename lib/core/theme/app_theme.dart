import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_typography.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.bgLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.coral,
        secondary: AppColors.ocean,
        surface: AppColors.surfaceLight,
        onSurface: AppColors.textLight,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTypography.headingXL.copyWith(color: AppColors.textLight),
        headlineMedium: AppTypography.headingL.copyWith(color: AppColors.textLight),
        bodyMedium: AppTypography.bodyM.copyWith(color: AppColors.textLight),
        bodySmall: AppTypography.bodyS.copyWith(color: AppColors.text2Light),
        labelMedium: AppTypography.labelM.copyWith(color: AppColors.textLight),
      ),
      useMaterial3: true,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bgDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.coral,
        secondary: AppColors.ocean,
        surface: AppColors.surfaceDark,
        onSurface: AppColors.textDark,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTypography.headingXL.copyWith(color: AppColors.textDark),
        headlineMedium: AppTypography.headingL.copyWith(color: AppColors.textDark),
        bodyMedium: AppTypography.bodyM.copyWith(color: AppColors.textDark),
        bodySmall: AppTypography.bodyS.copyWith(color: AppColors.text2Dark),
        labelMedium: AppTypography.labelM.copyWith(color: AppColors.textDark),
      ),
      useMaterial3: true,
    );
  }
}
