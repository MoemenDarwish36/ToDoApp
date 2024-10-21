import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/theme_provider.dart';
import '../../../../utilities/app_color.dart';

class ListItem extends StatelessWidget {
  // TaskDm task;

  // ListItem({super.key, required this.task});

  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    // ListProvider listProvider = Provider.of(context);
    ThemeProvider themeProvider = Provider.of(context);
    // AuthUserProvider authUserProvider = Provider.of(context);
    return Container(
      margin: const EdgeInsets.all(12),
      child: Slidable(
        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          extentRatio: .25,
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),
          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
              onPressed: (context) {
                /// delete task
                // FirebaseUtils.deleteTaskFromFireStore(
                //     task, authUserProvider.currentUser!.id!)
                //     .then((value) {
                //   listProvider.getAllTasksFromFireStore(
                //       authUserProvider.currentUser!.id!);
                // }).timeout(const Duration(milliseconds: 500), onTimeout: () {
                //   listProvider.getAllTasksFromFireStore(
                //       authUserProvider.currentUser!.id!);
                // });
              },
              backgroundColor: AppColors.redColor,
              foregroundColor: AppColors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color:
              themeProvider.isDarkThemeEnabled
                  ? AppColors.blackDarkColor
                  :
              AppColors.white,
              borderRadius: BorderRadius.circular(22)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.all(12),
                color: AppColors.primaryColor,
                height: MediaQuery.of(context).size.height * .1,
                width: 4,
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "task.title",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        "task.description",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  )),
              InkWell(

                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .01,
                    horizontal: MediaQuery.of(context).size.width * .055,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primaryColor),
                  child: const Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: 35,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}