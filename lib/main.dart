import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/ui/provider/list_provider.dart';
import 'package:todos/ui/screens/home/home_screen.dart';
import 'package:todos/ui/screens/splash/splash.dart';
import 'package:todos/ui/utilities/app_theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
      create: (context) => ListProvider(), child: const MyApp()));
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
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      theme: AppThemeData.lightTheme,
    );
  }
}
