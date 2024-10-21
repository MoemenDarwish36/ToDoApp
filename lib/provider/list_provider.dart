// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../model/task_dm.dart';
// import '../utilities/firebase_utils.dart';
//
// class ListProvider extends ChangeNotifier {
//   DateTime selectedDate = DateTime.now();
//
//   List<TaskDm> tasksList = [];
//
//   // void getAllTasksFromFireStore(String uId) async {
//   //   QuerySnapshot<TaskDm> querySnapshot =
//   //       await FirebaseUtils.getTaskCollection(uId).get();
//   //
//   //   ///List<QueryDocumentSnapshot<TaskDm>>  =>  List<TaskDm>
//   //   tasksList = querySnapshot.docs.map((doc) {
//   //     return doc.data();
//   //   }).toList();
//   //
//   //   ///filter data
//   //   tasksList = tasksList.where((task) {
//   //     if (selectedDate.day == task.dateTime.day &&
//   //         selectedDate.month == task.dateTime.month &&
//   //         selectedDate.year == task.dateTime.year) {
//   //       return true;
//   //     }
//   //     {
//   //       return false;
//   //     }
//   //   }).toList();
//   //
//   //   ///sorting data
//   //   tasksList.sort((TaskDm task1, TaskDm task2) {
//   //     return task1.dateTime.compareTo(task2.dateTime);
//   //   });
//   //
//   //   notifyListeners();
//   // }
//
//   // void changeSelectData(DateTime newSelectData, String uId) {
//   //   selectedDate = newSelectData;
//   //   getAllTasksFromFireStore(uId);
//   // }
// }
