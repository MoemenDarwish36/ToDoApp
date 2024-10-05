import 'package:flutter/material.dart';
import 'package:todos/ui/utilities/date_time_extension.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .5,
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
                    decoration:
                        const InputDecoration(hintText: "Enter task Title"),
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
                    decoration: const InputDecoration(
                      hintText: "Enter task Description",
                    ),
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
    if (formKey.currentState?.validate() == true) {}
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
