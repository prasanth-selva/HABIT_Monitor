import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_typography.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.bgLight,
      colorScheme: ColorScheme.light(
        primary: AppColors.coral,
        secondary: AppColors.ocean,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTypography.headingXL,
        headlineMedium: AppTypography.headingL,
        bodyMedium: AppTypography.bodyM,
        bodySmall: AppTypography.bodyS,
      ),
      useMaterial3: true,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bgDark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.coral,
        secondary: AppColors.ocean,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTypography.headingXL.copyWith(color: AppColors.textDark),
        headlineMedium: AppTypography.headingL.copyWith(color: AppColors.textDark),
        bodyMedium: AppTypography.bodyM.copyWith(color: AppColors.textDark),
      ),
      useMaterial3: true,
    );
  }
}
