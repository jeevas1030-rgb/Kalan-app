import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFFFFB300); // Yellow/Orange
  static const Color dark = Color(0xFF000000);    // Black
  static const Color light = Color(0xFFFFF3E0);   // Light Orange
  static const Color bg = Color(0xFFF9FAFB);      // Light Grey/White
  static const Color textPrimary = Color(0xFF111827);
  static const Color textMuted = Color(0xFF9CA3AF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color danger = Color(0xFFFF5252);
}

class AppTypography {
  static TextStyle display(BuildContext context, {Color color = AppColors.textPrimary, double fontSize = 24, FontWeight fontWeight = FontWeight.w700}) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  static TextStyle body(BuildContext context, {Color color = AppColors.textPrimary, double fontSize = 14, FontWeight fontWeight = FontWeight.w400}) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  static TextStyle price(BuildContext context, {Color color = AppColors.textPrimary, double fontSize = 18, FontWeight fontWeight = FontWeight.w700}) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.dark,
        surface: AppColors.white,
        background: AppColors.bg,
        error: AppColors.danger,
      ),
      useMaterial3: true,
    );
  }
}
