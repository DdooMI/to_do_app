import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/firebase_options.dart';
import 'package:to_do_app/providers/dark_provider.dart';
import 'package:to_do_app/providers/localization_provider.dart';
import 'package:to_do_app/providers/task_provider.dart';
import 'package:to_do_app/providers/user_provider.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/bottom_navigator_bar.dart';
import 'package:to_do_app/screens/login_signup/login.dart';
import 'package:to_do_app/screens/login_signup/signup.dart';
import 'package:to_do_app/screens/splash/splash_screen.dart';
import 'package:to_do_app/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LocalizationProvider>(
        create: (_) => LocalizationProvider()),
    ChangeNotifierProvider<DarkProvider>(
        create: (_) => DarkProvider(dark: prefs.getBool("isDark") ?? false)),
    ChangeNotifierProvider<TaskProvider>(create: (_) => TaskProvider()),
    ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      themeMode: Provider.of<DarkProvider>(context).appThemeMode,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        BottomNavigatorBar.routeName: (_) => const BottomNavigatorBar(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        SignupScreen.routeName: (_) => const SignupScreen()
      },
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
