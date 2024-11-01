import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/bottom_navigator_bar.dart';
import 'package:to_do_app/screens/login_signup/login.dart';
import 'package:to_do_app/theme/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = "Splash";

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (FirebaseAuth.instance.currentUser?.uid == null) {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      } else {
        Navigator.of(context)
            .pushReplacementNamed(BottomNavigatorBar.routeName);
      }
    });
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  Theme.of(context).colorScheme.brightness == Brightness.light
                      ? Images.splash
                      : Images.splashDark),
              fit: BoxFit.fill)),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
