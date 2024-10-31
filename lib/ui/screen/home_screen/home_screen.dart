import 'package:flutter/material.dart';
import 'package:todo_app/ui/screen/home_screen/tabs/list_tab/list_tab.dart';
import 'package:todo_app/ui/screen/home_screen/tabs/settings_tab/settings_tab.dart';

import '../../../utilities/app_color.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tab = [ListTab(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    // AuthUserProvider authUserProvider = Provider.of(context);
    // ListProvider listProvider = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: MediaQuery.of(context).size.height * .18,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("To Do List Hi ",
              // "${authUserProvider.currentUser!.userName!}",
              style: Theme.of(context).textTheme.titleLarge),

          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         // listProvider.tasksList = [];
          //         // authUserProvider.currentUser = null;
          //         // Navigator.pushReplacementNamed(
          //         //     context, LoginScreen.routeName);
          //       },
          //       icon: const Icon(Icons.logout))
          // ],
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

  buildBottomNavigation() => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (tappedIndex) {
              selectedIndex = tappedIndex;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.list),
                  label: "context.localization.list"),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: "context.localization.settings"),
            ]),
      );

  buildFab() => FloatingActionButton(
        onPressed: () {
          // AddBottomSheet.show(context);
        },
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      );
}
