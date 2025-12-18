import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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

  // Card Theme Helper
  static CardThemeData _cardTheme({double elevation = 2, Color? color}) => CardThemeData(
        elevation: elevation,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      );

  // Input Decoration Helper
  static InputDecorationTheme _inputDecoration({Color? fillColor}) => InputDecorationTheme(
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      );

  // SmoothPageIndicator Helper
  static WormEffect pageIndicatorEffect(BuildContext context) {
    final theme = Theme.of(context);
    return WormEffect(
      activeDotColor: theme.colorScheme.primary,
      dotColor: Colors.grey.shade400,
      dotHeight: 10,
      dotWidth: 10,
      spacing: 8,
    );
  }

  // General Theme Builder
  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color primary,
    required Color scaffoldBg,
    Color? cardColor,
    Color? inputFill,
  }) {
    final isLight = brightness == Brightness.light;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: fontFamily,
      primaryColor: primary,
      scaffoldBackgroundColor: scaffoldBg,
      colorScheme: isLight
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
        foregroundColor: isLight ? Colors.black87 : Colors.white,
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
      cardTheme: _cardTheme(color: cardColor),
      inputDecorationTheme: _inputDecoration(fillColor: inputFill),
    );
  }

  // Predefined Themes
  static final ThemeData light = _buildTheme(
    brightness: Brightness.light,
    primary: primaryBlue,
    scaffoldBg: Colors.white,
    cardColor: Colors.white,
    inputFill: Colors.grey[100],
  );

  static final ThemeData dark = _buildTheme(
    brightness: Brightness.dark,
    primary: primaryBlue,
    scaffoldBg: darkBackground,
    cardColor: darkSurface,
    inputFill: darkSurface,
  );

  static final ThemeData purple = _buildTheme(
    brightness: Brightness.light,
    primary: primaryPurple,
    scaffoldBg: Colors.white,
    cardColor: Colors.white,
    inputFill: Colors.deepPurple[50],
  );

  static final ThemeData green = _buildTheme(
    brightness: Brightness.light,
    primary: primaryGreen,
    scaffoldBg: Colors.white,
    cardColor: Colors.white,
    inputFill: Colors.green[50],
  );
}
