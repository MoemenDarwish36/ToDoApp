import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/task_data_model.dart';

import '../utilities/firebase_utils.dart';

class ListProvider extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();

  List<TaskModel> tasksList = [];

  void getAllTasksFromFireStore(String uId) async {
    QuerySnapshot<TaskModel> querySnapshot =
        await FirebaseUtils.getTaskCollection(uId).get();

    tasksList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    tasksList = tasksList.where((task) {
      if (selectedDate.day == task.dateTime.day &&
          selectedDate.month == task.dateTime.month &&
          selectedDate.year == task.dateTime.year) {
        return true;
      }
      {
        return false;
      }
    }).toList();

    tasksList.sort((TaskModel task1, TaskModel task2) {
      return task1.dateTime.compareTo(task2.dateTime);
    });

    notifyListeners();
  }

  void changeSelectData(DateTime newSelectData, String uId) {
    selectedDate = newSelectData;
    getAllTasksFromFireStore(uId);
  }
}
