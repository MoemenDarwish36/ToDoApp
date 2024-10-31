import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/task_data_model.dart';

class FirebaseUtils {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection(TaskModel.collectionName)
        .withConverter<TaskModel>(
            fromFirestore: (snapShot, options) =>
                TaskModel.fromJson(snapShot.data()!),
            toFirestore: (task, option) => task.toJson());
  }

  static Future<void> addTaskToFireStore(TaskModel task) {
    CollectionReference taskCollection = getTaskCollection();

    /// collection
    DocumentReference taskDocRef = taskCollection.doc();

    ///document
    task.id = taskDocRef.id;

    /// auto ID
    return taskDocRef.set(task);
  }

  static Future<void> deleteTaskFromFireStore(TaskModel task) {
    return getTaskCollection().doc(task.id).delete();
  }

  static Future<void> editIsDone({required TaskModel task}) {
    return getTaskCollection().doc(task.id).update({"isDone": task.isDone});
  }

  static Future<void> editTask({required TaskModel task}) {
    return getTaskCollection().doc(task.id).update(task.toJson());
  }
}
