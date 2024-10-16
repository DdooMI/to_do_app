import 'package:flutter/material.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/bottom_navigator_bar.dart';
import 'package:to_do_app/screens/splash/splash_screen.dart';
import 'package:to_do_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        BottomNavigatorBar.routeName: (_) => const BottomNavigatorBar(),
      },
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
