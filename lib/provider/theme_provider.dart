import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  late SharedPreferences storageTheme;

  Future<void> getTheme() async {
    storageTheme = await SharedPreferences.getInstance();
    if (storageTheme.getBool("isDark") ?? false) {
      currentTheme = ThemeMode.dark;
    } else {
      currentTheme = ThemeMode.light;
    }
  }

  /// to check if switch open or no
  bool get isDarkThemeEnabled => currentTheme == ThemeMode.dark;

  set newTheme(ThemeMode themeMode) {
    currentTheme = themeMode;

    notifyListeners();
    bool isDark = currentTheme == ThemeMode.dark ? true : false;
    _saveTheme(isDark);
  }

  void _saveTheme(bool isDark) {
    storageTheme.setBool("isDark", isDark);
  }
}
