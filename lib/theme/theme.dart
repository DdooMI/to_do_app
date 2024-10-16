import 'package:flutter/material.dart';
import 'package:to_do_app/theme/colors.dart';

class ThemeApp {
  static ThemeData lightTheme = ThemeData(
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700)),
      appBarTheme: AppBarTheme(
          color: ColorsApp.primaryColor,
          foregroundColor: Colors.white,
          centerTitle: false,
          elevation: 0),
      scaffoldBackgroundColor: ColorsApp.bgColorLight,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorsApp.primaryColor,
          foregroundColor: Colors.white,
          shape: const CircleBorder(
              side: BorderSide(color: Colors.white, width: 4))),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedIconTheme: IconThemeData(color: Colors.grey[350], size: 35),
          selectedIconTheme:
              IconThemeData(color: ColorsApp.primaryColor, size: 35)),
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
      scaffoldBackgroundColor: ColorsApp.bgColorDark,
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
