import 'package:flutter/material.dart';

import '../../services/api/auth_api.dart';

class AuthProvider with ChangeNotifier {
  final AuthApi authApi = AuthApi();

  // Enroll current user to a course
  Future<void> loginUser({
    String email,
    String password,
  }) async {
    // API call
    final response = await authApi.login(
      email: email,
      password: password,
    );

    String _userToken = '';
    print('response: $response');
    // on success
    if (response['success'] != null) {
      _userToken = response['data']['token'];
      print('login _userToken: $_userToken');
    } else if (response['error'] != null) {
      // manage this error to user
      print('A problem occurred whith enrollUserToCourse');
    }
  }
}
