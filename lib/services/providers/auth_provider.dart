import 'package:flutter/material.dart';
import 'dart:convert';

import '../../services/api/auth_api.dart';
import '../../services/storage/secure_storage.dart';
import './user_provider.dart';

import '../app_router.dart';

class AuthProvider with ChangeNotifier {
  final AuthApi authApi = AuthApi();
  final SecureStorage storage = SecureStorage();
  final UserProvider userProvider = UserProvider();

  // Login user
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
        final String _userToken = 'Bearer $_token';

        print('auth_provider _userToken: $_userToken');

        // Saving token in secure local device storage
        await storage.setStorageValue(
          id: 'userToken',
          value: _userToken,
        );

        // Get response user info:
        dynamic _user = response['data']['user'];
        dynamic _department = response['data']['department'];
        // Saving user / department / into in secure local device storage
        await storage.setStorageValue(
          id: 'user',
          value: json.encode(_user),
        );

        await storage.setStorageValue(
          id: 'department',
          value: json.encode(_department),
        );

        // Set a string in intro, when existing, intro will not load
        await storage.setStorageValue(
          id: 'intro',
          value: 'userLoggedIn',
        );

        // Set user + department in User Provider
        await userProvider.setCurrentUser(
          user: _user,
          department: _department,
        );

        // Return success state
        return 'success';
      } else if (response['error'] != null) {
        // Return response error
        return response['error'];
      }
    } catch (e) {
      throw e;
    }
    return '';
  }

  // Logout User
  Future<void> logoutUser(BuildContext ctx) async {
    try {
      // API call
      final response = await authApi.logout();

      // on success
      if (response['success'] != null) {
        // Delete token / user / department from secure local device storage
        await storage.setStorageValue(
          id: 'userToken',
        );
        await storage.setStorageValue(
          id: 'user',
        );
        await storage.setStorageValue(
          id: 'department',
        );

        // Set user + department in User Provider
        await userProvider.removeCurrentUser();

        // Navigate to AppRouter:
        Navigator.pushAndRemoveUntil(
          ctx,
          MaterialPageRoute(builder: (context) => AppRouter()),
          (r) => false,
        );
      }
    } catch (e) {
      throw e;
    }
  }
}
