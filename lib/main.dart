import 'package:flutter/material.dart';
import 'package:todo/ui/screen/home_screen/home_screen.dart';

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

    initialRoute: HomeScreen.routeName,
    routes: {
    // Splash.routeName: (_) => const Splash(),
    HomeScreen.routeName: (_) => HomeScreen(),
    // RegisterScreen.routeName: (_) => RegisterScreen(),
    // LoginScreen.routeName: (_) => LoginScreen(),
    },
    );
  }
}


