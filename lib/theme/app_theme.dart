import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryPurple = Color(0xFF6366F1);
  static const Color lightPurple = Color(0xFFEEF2FF);
  static const Color darkGrey = Color(0xFF6B7280);
  static const Color lightGrey = Color(0xFFF9FAFB);
  static const Color greenAccent = Color(0xFF10B981);

  static MaterialColor primarySwatch = MaterialColor(0xFF6366F1, {
    50: const Color(0xFFEEF2FF),
    100: const Color(0xFFE0E7FF),
    200: const Color(0xFFC7D2FE),
    300: const Color(0xFFA5B4FC),
    400: const Color(0xFF818CF8),
    500: const Color(0xFF6366F1),
    600: const Color(0xFF4F46E5),
    700: const Color(0xFF4338CA),
    800: const Color(0xFF3730A3),
    900: const Color(0xFF312E81),
  });

  static ThemeData lightTheme = ThemeData(
    primarySwatch: primarySwatch,
    primaryColor: primaryPurple,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: darkGrey),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryPurple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  );
}
