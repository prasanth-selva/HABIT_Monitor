import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle headingXL = GoogleFonts.nunito(fontSize: 28, fontWeight: FontWeight.w800);
  static TextStyle headingL  = GoogleFonts.nunito(fontSize: 22, fontWeight: FontWeight.w700);
  static TextStyle headingM  = GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w700);
  static TextStyle labelCaps = GoogleFonts.nunito(fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.06);
  static TextStyle bodyM     = GoogleFonts.nunito(fontSize: 15, fontWeight: FontWeight.w400);
  static TextStyle bodyS     = GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.w400);
  static TextStyle numXL     = GoogleFonts.nunito(fontSize: 36, fontWeight: FontWeight.w800);
  static TextStyle numL      = GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.w700);
  static TextStyle chip      = GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w600);
  static TextStyle labelM    = GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.04); // legacy alias
}
