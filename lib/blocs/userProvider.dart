import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  dynamic _user;

  dynamic get user {
    return _user;
  }

  setUser(dynamic value) {
    _user = value;
    notifyListeners();
  }
}
