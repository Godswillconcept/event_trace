import 'package:event_trace/models/User.dart';
import 'package:flutter/material.dart';

class UserNotifier extends ChangeNotifier {
  List<User> userList = [];

  // adding user
  addUser(User user) {
    userList.add(user);
    notifyListeners();
  }

  // removing user
  removeUser(User user) {
    userList.remove(user);
    notifyListeners();
  }

  // updating user
  void modifyUser(User modifiedUser) {
    final index = userList.indexWhere((user) => user.id == modifiedUser.id);
    if (index != -1) {
      userList[index] = modifiedUser;
      notifyListeners();
    }
  }

  // loading users from server into the provider
  UserNotifier.all(List<User> users) {
    userList = users;
    notifyListeners();
  }
}
