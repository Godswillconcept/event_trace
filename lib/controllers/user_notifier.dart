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
  updateUser(User user) {
    userList[userList.indexOf(user)] = user;
    notifyListeners();
  }

  // loading users from server into the provider
  UserNotifier.all(List<User> users) {
    userList = users;
    notifyListeners();
  }
}
