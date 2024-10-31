import 'package:flutter/material.dart';
import 'package:todo_app/ui/screen/home_screen/home_screen.dart';

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
        HomeScreen.routeName: (_) => HomeScreen(),
        // Splash.routeName: (_) => const Splash(),
        // RegisterScreen.routeName: (_) =>  RegisterScreen(),
        // LoginScreen.routeName: (_) =>  LoginScreen(),
        // EditTaskScreen.routeName: (_) =>  EditTaskScreen(),
      },
    );
  }
}
