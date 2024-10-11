import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.white,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.white,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white));
  static ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.white,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.white,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white));
}
