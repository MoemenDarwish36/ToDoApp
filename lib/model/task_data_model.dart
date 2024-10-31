import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  static const String collectionName = "task";

  late String id;

  late String title;

  late DateTime dateTime;

  late String description;

  late bool isDone;

  TaskModel({
    this.id = '',
    required this.title,
    required this.dateTime,
    required this.description,
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];

    ///to convert time to  timestamp
    Timestamp timestamp = json["dateTime"];
    dateTime = timestamp.toDate();

    isDone = json["isDone"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "dateTime": Timestamp.fromDate(dateTime),
        "isDone": isDone
      };
}
