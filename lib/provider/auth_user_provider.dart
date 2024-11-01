import 'package:flutter/material.dart';
import 'package:todo_app/model/user_data_model.dart';

class AuthUserProvider extends ChangeNotifier {
  UserModel? currentUser;

  void updateUser(UserModel newUser) {
    currentUser = newUser;
    notifyListeners();
  }
}
