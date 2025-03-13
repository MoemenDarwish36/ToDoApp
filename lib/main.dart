import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/auth_user_provider.dart';
import 'package:todo_app/provider/language_provider.dart';
import 'package:todo_app/provider/list_provider.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/ui/screen/auth/login_screen/login_screen.dart';
import 'package:todo_app/ui/screen/auth/register_screen/register_screen.dart';
import 'package:todo_app/ui/screen/home_screen/home_screen.dart';
import 'package:todo_app/ui/screen/home_screen/tabs/list_tab/edit_task_screen.dart';
import 'package:todo_app/ui/screen/splash_screen/splash_screen.dart';
import 'package:todo_app/utilities/app_theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeProvider themeProvider = ThemeProvider();
  LanguageProvider languageProvider = LanguageProvider();
  await themeProvider.getTheme();
  await languageProvider.getLanguage();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseFirestore.instance.disableNetwork();

  runApp(ChangeNotifierProvider(
    create: (context) => AuthUserProvider(),
    child: ChangeNotifierProvider(
      create: (context) => ListProvider(),
      child: ChangeNotifierProvider(
        create: (context) => themeProvider,
        child: ChangeNotifierProvider(
            create: (context) => languageProvider, child: const MyApp()),
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of(context);
    ThemeProvider themeProvider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: Locale(languageProvider.selectedLanguage),
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        Splash.routeName: (_) => const Splash(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        EditTaskScreen.routeName: (_) => const EditTaskScreen(),
      },
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      themeMode: themeProvider.currentTheme,
    );
  }
}
