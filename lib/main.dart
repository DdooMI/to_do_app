import 'package:flutter/material.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/bottom_navigator_bar.dart';
import 'package:to_do_app/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        BottomNavigatorBar.routeName: (_) => const BottomNavigatorBar(),
      },
      home: const SplashScreen(),
    );
  }
}
