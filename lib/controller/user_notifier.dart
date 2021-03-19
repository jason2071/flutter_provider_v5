import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_provider/model/user.dart';

class UserNotifier extends ChangeNotifier {
  List<User> _userList = [];
  int _age = 0;
  int _height = 0;

  UnmodifiableListView<User> get userList => UnmodifiableListView(_userList);
  int get age => _age;
  int get height => _height;

  addUser(User user) {
    _userList.add(user);
    notifyListeners();
  }

  deleteUser(id) {
    _userList.removeWhere((_user) => _user.id == id);
    notifyListeners();
  }

  incrementAge() {
    _age++;
    notifyListeners();
  }

  incrementHeight() {
    _height++;
    notifyListeners();
  }
}
