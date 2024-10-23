import 'package:flutter/cupertino.dart';
import '../model/user_data_model.dart';

class AuthUserProvider extends ChangeNotifier {
  UserDm? currentUser;

  void updateUser(UserDm newUser) {
    currentUser = newUser;
    notifyListeners();
  }
}
