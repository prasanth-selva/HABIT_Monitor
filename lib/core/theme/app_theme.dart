import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.primary,
        surface: AppColors.surface,
        onSurface: AppColors.text,
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.dmSans(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.text),
        headlineMedium: GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.text),
        titleLarge: GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.text),
        bodyLarge: GoogleFonts.dmSans(fontSize: 16, color: AppColors.text),
        bodyMedium: GoogleFonts.dmSans(fontSize: 14, color: AppColors.text),
        bodySmall: GoogleFonts.dmSans(fontSize: 12, color: AppColors.textSecondary),
        labelMedium: GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textSecondary),
      ),
      useMaterial3: true,
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.text),
        titleTextStyle: TextStyle(color: AppColors.text, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  static ThemeData dark() {
    // The design images only show a light pastel theme. 
    // We will map dark to the same or a slightly darker pastel version if needed, 
    // but for now, we'll keep it simple and use a basic dark mode or force light mode.
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF1A1A1A),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.primary,
        surface: Color(0xFF2D2D2D),
        onSurface: Colors.white,
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.dmSans(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        headlineMedium: GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        titleLarge: GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        bodyLarge: GoogleFonts.dmSans(fontSize: 16, color: Colors.white),
        bodyMedium: GoogleFonts.dmSans(fontSize: 14, color: Colors.white),
        bodySmall: GoogleFonts.dmSans(fontSize: 12, color: Colors.grey),
        labelMedium: GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
      useMaterial3: true,
      cardTheme: CardThemeData(
        color: const Color(0xFF2D2D2D),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
