import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  // Colors
  static const Color primaryBlue = Color(0xFF2196F3);
  static const Color primaryPurple = Color(0xFF673AB7);
  static const Color primaryGreen = Color(0xFF4CAF50);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);

  // Font
  static const String fontFamily = 'Inter';

  // Helpers
  static CardThemeData _cardTheme({double elevation = 2, Color? color}) => CardThemeData(
        elevation: elevation,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      );

  static InputDecorationTheme _inputDecoration({Color? fillColor}) => InputDecorationTheme(
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color primary,
    required Color scaffoldBg,
    Color? cardColor,
    Color? inputFill,
  }) =>
      ThemeData(
        useMaterial3: true,
        brightness: brightness,
        primaryColor: primary,
        fontFamily: fontFamily,
        scaffoldBackgroundColor: scaffoldBg,
        colorScheme: brightness == Brightness.light
            ? ColorScheme.light(
                primary: primary,
                secondary: primary,
                surface: cardColor ?? Colors.white,
              )
            : ColorScheme.dark(
                primary: primary,
                secondary: primary,
                surface: cardColor ?? darkSurface,
              ),
        appBarTheme: AppBarTheme(
          backgroundColor: scaffoldBg,
          foregroundColor: brightness == Brightness.light ? Colors.black87 : Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          color: cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        inputDecorationTheme: _inputDecoration(fillColor: inputFill),
      );

  // Themes
  static ThemeData light = _buildTheme(
    brightness: Brightness.light,
    primary: primaryBlue,
    scaffoldBg: Colors.white,
    cardColor: Colors.white,
    inputFill: Colors.grey[100],
  );

  static ThemeData dark = _buildTheme(
    brightness: Brightness.dark,
    primary: primaryBlue,
    scaffoldBg: darkBackground,
    cardColor: darkSurface,
    inputFill: darkSurface,
  );

  static ThemeData purple = _buildTheme(
    brightness: Brightness.light,
    primary: primaryPurple,
    scaffoldBg: Colors.white,
    cardColor: Colors.white,
    inputFill: Colors.deepPurple[50],
  );

  static ThemeData green = _buildTheme(
    brightness: Brightness.light,
    primary: primaryGreen,
    scaffoldBg: Colors.white,
    cardColor: Colors.white,
    inputFill: Colors.green[50],
  );
}
