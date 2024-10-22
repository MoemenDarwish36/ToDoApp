
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskDm {
  static const String collectionName = "task";

  late String id;

  late String title;

  late DateTime dateTime;

  late String description;

  late bool isDone;

  TaskDm({
    this.id = '',
    required this.title,
    required this.dateTime,
    required this.description,
    this.isDone = false,
  });

  TaskDm.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];

    ///to convert time to  timestamp
    Timestamp timestamp = json["dateTime"];
    dateTime = timestamp.toDate();
    // التحقق من وجود dateTime قبل محاولة تحويله
    // if (json["dateTime"] != null) {
    //   Timestamp timestamp = json["dateTime"] as Timestamp;
    //   dateTime = timestamp.toDate();
    // } else {
    //   dateTime = null; // إذا كانت القيمة null
    // }
    isDone = json["isDone"];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    // "dateTime": dateTime,
    "dateTime": Timestamp.fromDate(dateTime),
    "isDone": isDone
  };
}

/// firebase => json
/// developer => object
/// object => json
/// json => object