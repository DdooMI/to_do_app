import 'package:flutter/material.dart';
import 'package:to_do_app/theme/colors.dart';

class ThemeApp {
  static ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
          titleLarge: const TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(
              fontSize: 18,
              color: ColorsApp.primaryColor,
              fontWeight: FontWeight.w700),
          titleSmall: const TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.w700)),
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
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: ColorsApp.primaryColor,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.white,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white));
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: ColorsApp.bgColorDark,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: ColorsApp.primaryColor,
          onPrimary: ColorsApp.bgColorDark,
          secondary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.white,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white));
}
