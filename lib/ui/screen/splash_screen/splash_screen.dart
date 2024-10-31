import 'package:flutter/material.dart';
import 'package:todo_app/ui/screen/home_screen/home_screen.dart';

import '../../../utilities/app_assets.dart';

class Splash extends StatefulWidget {
  static const String routeName = "splash";

  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // late ThemeProvider themeProvider;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    // themeProvider = Provider.of(context);
    return Scaffold(
        body:
            // themeProvider.isDarkThemeEnabled
            //     ? Image.asset(AppAssets.splashDark)
            //     :

            Image.asset(AppAssets.splashLight));
  }
}
