import 'package:flutter/material.dart';

class AppColors {
  // Primary brand
  static const pink        = Color(0xFFD04F6E);   // main CTA, active states
  static const pinkLight   = Color(0xFFFDE8ED);
  static const pinkBg      = Color(0xFFFBF0F3);   // app background tint
  static const primary     = pink; // alias for compatibility
  static const primaryLight = pinkLight; // alias
  static const background  = pinkBg; // alias

  // Habit colors (6 presets)
  static const habitRed    = Color(0xFFE85C6A);
  static const habitGreen  = Color(0xFF4CAF7D);
  static const habitBlue   = Color(0xFF4A7CF7);
  static const habitOrange = Color(0xFFF59B42);
  static const habitPurple = Color(0xFF8B5CF6);
  static const habitTeal   = Color(0xFF14B8A6);
  static const habitPink   = pink; // alias

  static const habitRedBg    = Color(0xFFFDE8EF);
  static const habitGreenBg  = Color(0xFFEEF5E6);
  static const habitPinkBg   = Color(0xFFFDEAF0);
  static const habitBlueBg   = Color(0xFFEAEEF6);
  static const habitPurpleBg = Color(0xFFF4EBF9);
  static const habitOrangeBg = Color(0xFFFCECDD);

  // Status
  static const success     = Color(0xFF4CAF7D);   // green checkmark
  static const failed      = Color(0xFFE85C6A);   // red X
  static const failure     = failed; // alias
  static const skipped     = Color(0xFFF59B42);   // yellow dots
  static const pending     = Color(0xFFD0CFC8);   // empty circle
  static const neutral     = pending; // alias

  // Mood colors
  static const moodAwesome = Color(0xFF4CAF7D);   // big smile 😁
  static const moodGood    = Color(0xFF8BC34A);   // smile 🙂
  static const moodNeutral = Color(0xFFFFC107);   // neutral 😐
  static const moodBad     = Color(0xFFFF8C42);   // frown 😕
  static const moodAwful   = Color(0xFFE85C6A);   // red sad 😢

  // Light mode surfaces
  static const bgLight     = Color(0xFFFDFAF8);
  static const surfaceLight   = Color(0xFFFFFFFF);
  static const surface2Light  = Color(0xFFF5F3EF);
  static const borderLight    = Color(0xFFECE9E4);
  static const textLight      = Color(0xFF1A1917);
  static const text2Light     = Color(0xFF6B6860);
  static const surface = surfaceLight;
  static const text = textLight;
  static const textSecondary = text2Light;
  static const border = borderLight;

  // Dark mode surfaces
  static const bgDark      = Color(0xFF131211);
  static const surfaceDark    = Color(0xFF1E1D1B);
  static const surface2Dark   = Color(0xFF272523);
  static const borderDark     = Color(0xFF302E2C);
  static const textDark       = Color(0xFFF2EFE8);
  static const text2Dark      = Color(0xFF9B9891);
}
