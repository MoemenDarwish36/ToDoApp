import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/utilities/local_extension.dart';

import '../../../../../provider/language_provider.dart';
import '../../../../../provider/theme_provider.dart';
import '../../../../../utilities/app_color.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  late LanguageProvider languageProvider;
  late ThemeProvider themeProvider;

  bool isDarkThemeEnabled = false;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.localization.language,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: 18,
          ),
          buildLanguageMenu(),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Text(context.localization.theme,
                  style: Theme.of(context).textTheme.labelLarge),
              const Spacer(),
              buildThemeSwitch(),
            ],
          ),
        ],
      ),
    );
  }

  buildLanguageMenu() => DropdownButton(
      dropdownColor: themeProvider.isDarkThemeEnabled
          ? AppColors.blackDarkColor
          : AppColors.white,
      value: languageProvider.selectedLanguage,
      items: [
        DropdownMenuItem<String>(
            value: "ar",
            child: Text(
              context.localization.arabic,
              style: Theme.of(context).textTheme.labelLarge,
            )),
        DropdownMenuItem<String>(
            value: "en",
            child: Text(context.localization.english,
                style: Theme.of(context).textTheme.labelLarge)),
      ],
      isExpanded: true,
      onChanged: (newLanguageCode) {
        languageProvider.newLanguage =
            newLanguageCode ?? languageProvider.selectedLanguage;

        setState(() {});
      });

  buildThemeSwitch() => Switch(
      value: themeProvider.isDarkThemeEnabled,
      onChanged: (newValue) {
        themeProvider.newTheme = newValue ? ThemeMode.dark : ThemeMode.light;
        setState(() {});
      });
}