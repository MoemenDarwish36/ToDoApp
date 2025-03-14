import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/screen/home_screen/tabs/list_tab/task_list_tab.dart';
import 'package:todo_app/ui/screen/home_screen/tabs/settings_tab/settings_tab.dart';
import 'package:todo_app/utilities/local_extension.dart';

import '../../../provider/auth_user_provider.dart';
import '../../../provider/list_provider.dart';
import '../../../utilities/app_color.dart';
import '../auth/login_screen/login_screen.dart';
import 'add_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tab = [TaskListTab(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    AuthUserProvider authUserProvider = Provider.of(context);
    ListProvider listProvider = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
              "To Do List Hi ${authUserProvider.currentUser!.userName!}",
              style: Theme.of(context).textTheme.titleLarge),
          actions: [
            IconButton(
                onPressed: () {
                  listProvider.tasksList = [];
                  authUserProvider.currentUser = null;
                  Navigator.pushReplacementNamed(
                      context, LoginScreen.routeName);
                },
                icon: const Icon(Icons.logout))
          ],
        ),

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
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.list), label: context.localization.list),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: context.localization.settings),
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