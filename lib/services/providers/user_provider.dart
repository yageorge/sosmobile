import 'package:flutter/material.dart';

import '../../services/storage/secure_storage.dart';
import '../../models/user.dart';

class UserProvider with ChangeNotifier {
  final SecureStorage storage = SecureStorage();
  User _user;

  User get user {
    return _user;
  }

  // Set User Model
  Future<void> setCurrentUser({
    dynamic user,
    dynamic department,
  }) async {
    try {
      // Converting response to Course
      _user = jsonToUser(
        jsonUser: user,
        jsonDepartment: department,
      );
      // Notifying listeners
      notifyListeners();
    } catch (e) {
      throw 'catch error setCurrentUser: $e';
    }
  }

  // Remove User from provider
  Future<void> removeCurrentUser() async {
    try {
      // Converting response to Course
      _user = null;

      // Notifying listeners
      notifyListeners();
    } catch (e) {
      throw 'catch error setCurrentUser: $e';
    }
  }
}
