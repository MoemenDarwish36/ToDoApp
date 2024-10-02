import 'package:flutter/material.dart';
import 'package:todos/ui/screens/home/home_screen.dart';
import 'package:todos/ui/screens/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Splash.routeName,
      routes: {
        Splash.routeName: (_) => const Splash(),
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
    );
  }
}
