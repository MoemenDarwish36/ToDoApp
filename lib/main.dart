import 'package:flutter/material.dart';
import 'package:todo/ui/screen/home_screen/home_screen.dart';
import 'package:todo/ui/screen/splash_screen/splash_screen.dart';
import 'package:todo/ui/utilities/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        Splash.routeName: (_) => Splash(),
      },
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
    );
  }
}
