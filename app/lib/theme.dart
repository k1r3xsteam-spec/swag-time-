import 'package:flutter/material.dart';

class SwagColors {
  static const bg = Color(0xFF0A0A0A);
  static const surface = Color(0xFF141414);
  static const border = Color(0xFF262626);
  static const red = Color(0xFFE50914);
  static const text = Color(0xFFE5E5E5);
  static const dim = Color(0xFF8A8A8A);
  static const green = Color(0xFF00FF41);
}

ThemeData swagTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: SwagColors.bg,
    colorScheme: const ColorScheme.dark(
      primary: SwagColors.red,
      surface: SwagColors.surface,
      onSurface: SwagColors.text,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: SwagColors.bg,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontFamily: 'monospace',
        color: SwagColors.red,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: SwagColors.surface,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: SwagColors.border),
        borderRadius: BorderRadius.circular(4),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: SwagColors.border),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: SwagColors.red),
        borderRadius: BorderRadius.circular(4),
      ),
      labelStyle: const TextStyle(
        fontFamily: 'monospace',
        color: SwagColors.dim,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: SwagColors.red,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        textStyle: const TextStyle(
          fontFamily: 'monospace',
          fontWeight: FontWeight.bold,
          letterSpacing: 1.1,
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'monospace',
        color: SwagColors.text,
        fontSize: 13,
      ),
    ),
  );
}