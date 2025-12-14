import 'package:flutter/material.dart';

/// Centralizes app theme definitions for clean architecture layering.
class AppTheme {
  const AppTheme._();

  static ThemeData get light => ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
         
        ),
         elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
              foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
            ),
          ),
      );

}
