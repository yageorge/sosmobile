import 'package:flutter/material.dart';

import '../../services/storage/secure_storage.dart';
import '../../models/user.dart';

class UserProvider with ChangeNotifier {
  final SecureStorage storage = SecureStorage();
  User _user;

  User get user {
    return _user;
  }

  // Get courses data from server
  Future<void> setCurrentUser({
    dynamic user,
    dynamic department,
  }) async {
    // Saving user in secure local device storage
    await storage.setStorageValue(
      id: "user",
      value: user,
    );

    // Saving department in secure local device storage
    await storage.setStorageValue(
      id: "department",
      value: department,
    );

    // Converting response to Course
    _user = jsonToUser(
      jsonUser: user,
      jsonDepartment: department,
    );

    // Notifying listeners
    notifyListeners();
  }
}
