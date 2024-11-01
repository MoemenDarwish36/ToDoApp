import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/screen/auth/login_screen.dart';

import '../../../provider/theme_provider.dart';
import '../../../utilities/app_assets.dart';

class Splash extends StatefulWidget {
  static const String routeName = "splash";

  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late ThemeProvider themeProvider;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Scaffold(
        body: themeProvider.isDarkThemeEnabled
            ? Image.asset(AppAssets.splashDark)
            : Image.asset(AppAssets.splashLight));
  }
}
