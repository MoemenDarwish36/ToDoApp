import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todos/ui/model/task_dm.dart';

class FirebaseUtils {
  static CollectionReference<TaskDm> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection(TaskDm.collectionName)
        .withConverter(
            fromFirestore: (snapShot, options) =>
                TaskDm.fromJson(snapShot.data()!),
            toFirestore: (task, option) => task.toJson());
  }

  static Future<void> addTaskToFireStore(TaskDm task) {
    CollectionReference taskCollection = getTaskCollection();

    /// collection

    DocumentReference taskDocRef = taskCollection.doc();

    ///document

    task.id = taskDocRef.id;

    /// auto ID

    return taskDocRef.set(task);
  }
}
