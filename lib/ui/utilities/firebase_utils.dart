import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/task_data_model.dart';
import '../../model/user_data_model.dart';

class FirebaseUtils {
  static CollectionReference<TaskDm> getTaskCollection(String uId) {
    return getUserCollection()
        .doc(uId)
        .collection(TaskDm.collectionName)
        .withConverter(
        fromFirestore: (snapShot, options) =>
            TaskDm.fromJson(snapShot.data()!),
        toFirestore: (task, option) => task.toJson());
  }


  static Future<void> addTaskToFireStore(TaskDm task , String uId) {
    CollectionReference taskCollection = getTaskCollection(uId);

    /// collection
    DocumentReference taskDocRef = taskCollection.doc();

    ///document
    task.id = taskDocRef.id;

    /// auto ID
    return taskDocRef.set(task);
  }
  //, String uId

  static Future<void> deleteTaskFromFireStore(TaskDm task , String uId) {
    return getTaskCollection(uId).doc(task.id).delete();
  }

  static CollectionReference<UserDm> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(UserDm.collectionName)
        .withConverter(
        fromFirestore: (snapShot, options) =>
            UserDm.fromJson(snapShot.data()!),
        toFirestore: (user, option) => user.toJson());
  }

  static Future<void> addUserToFireStore(UserDm user) {
    return getUserCollection().doc(user.id).set(user);
  }

  static Future<UserDm?> readUserFromFireStore(String uId) async {
    var querySnapshot = await getUserCollection().doc(uId).get();
    return querySnapshot.data();
  }
}