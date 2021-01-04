import 'package:http/http.dart' as http;
import 'dart:convert';

import '../sharedPrefs.dart';

class AuthApi {
  final String token = sharedPrefs.userToken;

  // Login user
  Future login({
    String email,
    String password,
  }) async {
    try {
      final String url = "${sharedPrefs.apiUrl}mobileLogin";
      print('email password in auth_api: $email $password');
      final response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw 'A problem occurred: ${response.reasonPhrase}';
      }
    } catch (e) {
      throw 'Catch error getCourses() $e';
    }
  }

  // TODO Logout

}
