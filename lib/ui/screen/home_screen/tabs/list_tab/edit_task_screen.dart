import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task_data_model.dart';
import 'package:todo_app/utilities/data_time_extension.dart';

import '../../../../../provider/list_provider.dart';
import '../../../../../provider/theme_provider.dart';
import '../../../../../utilities/app_color.dart';
import '../../../../../utilities/firebase_utils.dart';

class EditTaskScreen extends StatefulWidget {
  static const String routeName = 'editTaskScreen ';

  const EditTaskScreen({super.key});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  var formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  late ThemeProvider themeProvider;
  late ListProvider listProvider;

  // late AuthUserProvider authUserProvider;
  late TaskModel taskModal;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      taskModal = ModalRoute.of(context)!.settings.arguments as TaskModel;
      titleController.text = taskModal.title;
      descriptionController.text = taskModal.description;
      selectedDate = taskModal.dateTime;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    // authUserProvider = Provider.of(context);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("To Do List Hi ",
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .09,
          ),
          Container(
            height: screenSize.height * .75,
            margin: EdgeInsets.symmetric(
                horizontal: screenSize.width * .1,
                vertical: screenSize.height * .03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: themeProvider.isDarkThemeEnabled
                  ? AppColors.blackDarkColor
                  : AppColors.white,
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Text(
                  "Add New Task",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: screenSize.height * .05,
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
                          controller: titleController,
                          decoration: InputDecoration(
                              hintText: "Edit Task",
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
                          controller: descriptionController,
                          decoration: InputDecoration(
                              hintText: "Edit Description",
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
                        SizedBox(
                          height: screenSize.height * .05,
                        ),
                        TextButton(
                          onPressed: () {
                            showMyDatePicker();
                          },
                          child: Text(selectedDate.toFormattedDate,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                        SizedBox(
                          height: screenSize.height * .1,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                    Theme.of(context).primaryColor)),
                            onPressed: () {
                              editTaskToFireStore();
                            },
                            child: Text(
                              "Save Changes",
                              style: Theme.of(context).textTheme.titleLarge,
                            ))
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  void editTaskToFireStore() {
    if (formKey.currentState?.validate() == true) {
      ///Add Task

      taskModal.title = titleController.text;
      taskModal.description = descriptionController.text;
      taskModal.dateTime = selectedDate;
//uId: authUserProvider.currentUser!.id!,
      FirebaseUtils.editTask(task: taskModal).then((onValue) {
        listProvider.getAllTasksFromFireStore();
        print('Updating task with title: ${taskModal.title}');

        Navigator.pop(context);
      })

          /// called in used firebase offline
          .timeout(const Duration(microseconds: 500), onTimeout: () {
        listProvider.getAllTasksFromFireStore();
        Navigator.pop(context);
      });
    }
  }

  void showMyDatePicker() async {
    ///this function (showDatePicker) need 4 parameter to displays DatePicker
    selectedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365))) ??
        selectedDate;
    setState(() {});
  }
}
