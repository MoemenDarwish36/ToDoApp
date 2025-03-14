import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/utilities/data_time_extension.dart';

import '../../../model/task_data_model.dart';
import '../../../provider/auth_user_provider.dart';
import '../../../provider/list_provider.dart';
import '../../../provider/theme_provider.dart';
import '../../../utilities/app_color.dart';
import '../../../utilities/firebase_utils.dart';

class AddBottomSheet extends StatefulWidget {
  const AddBottomSheet({super.key});

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();

  static show(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => const AddBottomSheet());
  }
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  var formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  String title = '';
  String description = '';
  late ListProvider listProvider;
  late ThemeProvider themeProvider;
  late AuthUserProvider authUserProvider;

  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    authUserProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        color: themeProvider.isDarkThemeEnabled
            ? AppColors.blackDarkColor
            : AppColors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Add New Task",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please Enter Task Title';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      title = text;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter task Title",
                        hintStyle: TextStyle(
                          color: themeProvider.isDarkThemeEnabled
                              ? AppColors.white
                              : AppColors.black,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please Enter Task Description';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      description = text;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter task Description",
                        hintStyle: TextStyle(
                          color: themeProvider.isDarkThemeEnabled
                              ? AppColors.white
                              : AppColors.black,
                        )),
                    maxLines: 4,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Select date",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextButton(
                    onPressed: () {
                      showMyDatePicker();
                    },
                    child: Text(selectedDate.toFormattedDate,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).primaryColor)),
                      onPressed: () {
                        addToDoToFireStore();
                      },
                      child: Text(
                        "Add",
                        style: Theme.of(context).textTheme.titleLarge,
                      ))
                ],
              ))
        ],
      ),
    );
  }

  void addToDoToFireStore() {
    if (formKey.currentState?.validate() == true) {
      TaskModel task = TaskModel(
          title: title, dateTime: selectedDate, description: description);

      FirebaseUtils.addTaskToFireStore(task, authUserProvider.currentUser!.id!)
          .then((onValue) {
        listProvider
            .getAllTasksFromFireStore(authUserProvider.currentUser!.id!);
        Navigator.pop(context);
      })

          .timeout(const Duration(microseconds: 500), onTimeout: () {
        listProvider
            .getAllTasksFromFireStore(authUserProvider.currentUser!.id!);
        Navigator.pop(context);
      });
    }
  }

  void showMyDatePicker() async {
    selectedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365))) ??
        selectedDate;
    setState(() {});
  }
}
