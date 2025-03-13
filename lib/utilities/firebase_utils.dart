import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/task_data_model.dart';
import 'package:todo_app/model/user_data_model.dart';

class FirebaseUtils {
  static CollectionReference<TaskModel> getTaskCollection(String uId) {
    return getUserCollection()
        .doc(uId)
        .collection(TaskModel.collectionName)
        .withConverter(
            fromFirestore: (snapShot, options) =>
                TaskModel.fromJson(snapShot.data()!),
            toFirestore: (task, option) => task.toJson());
  }

  static Future<void> addTaskToFireStore(TaskModel task, String uId) {
    CollectionReference taskCollection = getTaskCollection(uId);

    DocumentReference taskDocRef = taskCollection.doc();

    task.id = taskDocRef.id;

    return taskDocRef.set(task);
  }

  static Future<void> deleteTaskFromFireStore(TaskModel task, String uId) {
    return getTaskCollection(uId).doc(task.id).delete();
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter(
            fromFirestore: (snapShot, options) =>
                UserModel.fromJson(snapShot.data()!),
            toFirestore: (user, option) => user.toJson());
  }

  static Future<void> addUserToFireStore(UserModel user) {
    return getUserCollection().doc(user.id).set(user);
  }

  static Future<UserModel?> readUserFromFireStore(String uId) async {
    var querySnapshot = await getUserCollection().doc(uId).get();
    return querySnapshot.data();
  }

  static Future<void> editIsDone(
      {required String uId, required TaskModel task}) {
    return getTaskCollection(uId).doc(task.id).update({"isDone": task.isDone});
  }

  static Future<void> editTask({required String uId, required TaskModel task}) {
    return getTaskCollection(uId).doc(task.id).update(task.toJson());
  }
}