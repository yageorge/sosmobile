import 'package:flutter/material.dart';
import '../../services/api/auth_api.dart';
import '../../services/storage/secure_storage.dart';

import './user_provider.dart';

class AuthProvider with ChangeNotifier {
  final AuthApi authApi = AuthApi();
  final SecureStorage storage = SecureStorage();
  final UserProvider userProvider = UserProvider();

  // Enroll current user to a course
  Future<String> loginUser({
    String email,
    String password,
  }) async {
    try {
      // API call
      final response = await authApi.login(
        email: email,
        password: password,
      );

      // on success
      if (response['success'] != null) {
        // Get + prepare token
        String _token = response['data']['token'];
        final String _userToken = "Bearer $_token";

        // Saving token in secure local device storage
        await storage.setStorageValue(
          id: "userToken",
          value: _userToken,
        );

        // Get response user info:
        dynamic _user = response['data']['user'];
        dynamic _department = response['data']['department'];

        // Set user info in User Provider + Local Storage
        await userProvider.setCurrentUser(
          user: _user,
          department: _department,
        );

        // Return success state
        return "success";
      } else if (response['error'] != null) {
        // Return response error
        return response['error'];
      }
    } catch (e) {
      throw e;
    }
    return '';
  }
}
