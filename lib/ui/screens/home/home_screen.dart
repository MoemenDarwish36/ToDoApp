import 'package:flutter/material.dart';
import 'package:todos/ui/screens/add_bottom_sheet/add_bottom_sheet.dart';
import 'package:todos/ui/screens/home/taps/list/list_tap.dart';
import 'package:todos/ui/screens/home/taps/settings/settings-tap.dart';

import '../../utilities/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tab = const [ListTap(), SettingTap()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: MediaQuery.of(context).size.height * .18,
          backgroundColor: Theme.of(context).primaryColor,
          title:
              Text("To Do List", style: Theme.of(context).textTheme.titleLarge),
        ),

        ///to controls a FloatingActionButton location
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: buildBottomNavigation(),
        floatingActionButton: buildFab(),

        body: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .09,
            ),
            Expanded(child: tab[selectedIndex]),
          ],
        ),
      ),
    );
  }

  buildBottomNavigation() => BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (tappedIndex) {
            selectedIndex = tappedIndex;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "settings"),
          ]);

  buildFab() => FloatingActionButton(
        onPressed: () {
          AddBottomSheet.show(context);
        },
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      );
}
