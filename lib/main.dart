import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/language_provider.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/ui/screen/home_screen/home_screen.dart';
import 'package:todo_app/ui/screen/splash_screen/splash_screen.dart';
import 'package:todo_app/utilities/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeProvider themeProvider = ThemeProvider();
  LanguageProvider languageProvider = LanguageProvider();
  await themeProvider.getTheme();
  await languageProvider.getLanguage();

  runApp(ChangeNotifierProvider(
    create: (context) => themeProvider,
    child: ChangeNotifierProvider(
        create: (context) => languageProvider, child: const MyApp()),
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
        HomeScreen.routeName: (_) => HomeScreen(),
        Splash.routeName: (_) => const Splash(),
        // RegisterScreen.routeName: (_) =>  RegisterScreen(),
        // LoginScreen.routeName: (_) =>  LoginScreen(),
        // EditTaskScreen.routeName: (_) =>  EditTaskScreen(),
      },
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      themeMode: themeProvider.currentTheme,
    );
  }
}
