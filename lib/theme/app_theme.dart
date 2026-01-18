import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryGreen = Color(0xFF10B981);
  static const Color lightGreen = Color(0xFFECFDF5);
  static const Color darkGrey = Color(0xFF6B7280);
  static const Color lightGrey = Color(0xFFF9FAFB);
  static const Color white = Color(0xFFFFFFFF);

  static MaterialColor primarySwatch = MaterialColor(0xFF10B981, {
    50: const Color(0xFFECFDF5),
    100: const Color(0xFFD1FAE5),
    200: const Color(0xFFA7F3D0),
    300: const Color(0xFF6EE7B7),
    400: const Color(0xFF34D399),
    500: const Color(0xFF10B981),
    600: const Color(0xFF059669),
    700: const Color(0xFF047857),
    800: const Color(0xFF065F46),
    900: const Color(0xFF064E3B),
  });

  static ThemeData lightTheme = ThemeData(
    primarySwatch: primarySwatch,
    primaryColor: primaryGreen,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryGreen,
      elevation: 0,
      iconTheme: IconThemeData(color: white),
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryGreen,
        foregroundColor: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryGreen, width: 2),
      ),
    ),
  );
}
