import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF8B0000);
  static const Color secondaryColor = Color(0xFFDC143C);
  static const Color accentColor = Color(0xFFFFD700);
  static const Color darkBg = Color(0xFF0A0E27);
  static const Color cardBg = Color(0xFF1A1F3A);
  static const Color textLight = Color(0xFFE0E0E0);
  static const Color textDark = Color(0xFF0A0E27);
  static const Color successColor = Color(0xFF00D991);
  static const Color warningColor = Color(0xFFFF6B6B);

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: darkBg,
      appBarTheme: const AppBarTheme(
        backgroundColor: cardBg,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: textLight,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: textLight,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: textLight,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: textLight,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: Color(0xFFB0B0B0),
          fontSize: 14,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: textLight,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
