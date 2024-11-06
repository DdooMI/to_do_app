import 'package:flutter/material.dart';
import 'package:to_do_app/theme/colors.dart';

class ThemeApp {
  static ThemeData lightTheme = ThemeData(
      datePickerTheme: DatePickerThemeData(
        headerBackgroundColor: ColorsApp.primaryColor,
        headerForegroundColor: ColorsApp.bgColorLight,
        backgroundColor: ColorsApp.bgColorLight,
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 22,
              color: ColorsApp.bgColorLight,
              fontWeight: FontWeight.w700),
          titleMedium: TextStyle(
              fontSize: 18,
              color: ColorsApp.primaryColor,
              fontWeight: FontWeight.w700),
          titleSmall: TextStyle(
              fontSize: 15,
              color: ColorsApp.bgColorDark,
              fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(
              fontSize: 18,
              color: ColorsApp.bgColorLight,
              fontWeight: FontWeight.w700)),
      appBarTheme: AppBarTheme(
          backgroundColor: ColorsApp.primaryColor,
          foregroundColor: Colors.white,
          centerTitle: false,
          titleTextStyle: TextStyle(
              fontSize: 30,
              color: ColorsApp.bgColorLight,
              fontWeight: FontWeight.w700),
          elevation: 0),
      scaffoldBackgroundColor: ColorsApp.bgColorLight,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorsApp.primaryColor,
          foregroundColor: ColorsApp.bgColorLight,
          shape: CircleBorder(
              side: BorderSide(color: ColorsApp.bgColorLight, width: 4))),
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
          secondary: ColorsApp.bgColorDark,
          onSecondary: Colors.white,
          error: Colors.white,
          onError: Colors.white,
          surface: ColorsApp.primaryColor,
          onSurface: ColorsApp.primaryColor));
  static ThemeData darkTheme = ThemeData(
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: ColorsApp.primaryColor,
      headerForegroundColor: ColorsApp.bgColorDark,
      backgroundColor: ColorsApp.bgColorDark,
    ),
    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 22,
            color: ColorsApp.bgColorDark,
            fontWeight: FontWeight.w700),
        titleMedium: TextStyle(
            fontSize: 18,
            color: ColorsApp.primaryColor,
            fontWeight: FontWeight.w700),
        titleSmall: TextStyle(
            fontSize: 15,
            color: ColorsApp.bgColorLight,
            fontWeight: FontWeight.w700),
        bodyMedium: TextStyle(
            fontSize: 18,
            color: ColorsApp.bgColorLight,
            fontWeight: FontWeight.w700)),
    appBarTheme: AppBarTheme(
        backgroundColor: ColorsApp.primaryColor,
        foregroundColor: Colors.white,
        centerTitle: false,
        titleTextStyle: TextStyle(
            fontSize: 30,
            color: ColorsApp.bgColorDark,
            fontWeight: FontWeight.w700),
        elevation: 0),
    scaffoldBackgroundColor: ColorsApp.bgColorDark,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: ColorsApp.primaryColor,
        onPrimary: ColorsApp.darkBlueColor,
        secondary: ColorsApp.bgColorLight,
        onSecondary: Colors.white,
        error: Colors.white,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Colors.white),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsApp.primaryColor,
        foregroundColor: ColorsApp.darkBlueColor,
        shape: CircleBorder(
            side: BorderSide(color: ColorsApp.bgColorDark, width: 4))),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsApp.darkBlueColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(color: Colors.grey[350], size: 35),
        selectedIconTheme:
            IconThemeData(color: ColorsApp.primaryColor, size: 35)),
  );
}
