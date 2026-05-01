import 'package:flutter/material.dart';

class AppColors {
  // Brand
  static const primary       = Color(0xFFD33C61); // Deep Magenta
  static const primaryLight  = Color(0xFFFBE8EA); // Pastel Pink Background
  static const background    = Color(0xFFFBE8EA);

  // Semantic
  static const success       = Color(0xFF7CC76B); // Green checkmark
  static const failure       = Color(0xFFF16565); // Red cross
  static const skipped       = Color(0xFFF1C40F); // Yellow
  static const neutral       = Color(0xFFE0E0E0); // Grey circle

  // Habit Colors
  static const habitRed      = Color(0xFFE84C74); // Drink Water
  static const habitGreen    = Color(0xFF75A63F); // Avoid Junk Food
  static const habitPink     = Color(0xFFF37597); // Read Pages
  static const habitBlue     = Color(0xFF637CB0); // Workout Session
  static const habitPurple   = Color(0xFFA15CC8); // Call parents
  static const habitOrange   = Color(0xFFE88A3B);

  // Background colors for the habit icons
  static const habitRedBg    = Color(0xFFFDE8EF);
  static const habitGreenBg  = Color(0xFFEEF5E6);
  static const habitPinkBg   = Color(0xFFFDEAF0);
  static const habitBlueBg   = Color(0xFFEAEEF6);
  static const habitPurpleBg = Color(0xFFF4EBF9);
  static const habitOrangeBg = Color(0xFFFCECDD);

  // Light Mode Only (Design doesn't show dark mode, assuming mainly light)
  static const surface       = Color(0xFFFFFFFF);
  static const text          = Color(0xFF1E1E1E);
  static const textSecondary = Color(0xFF757575);
  static const border        = Color(0xFFEEEEEE);
}
