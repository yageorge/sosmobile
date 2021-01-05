import 'package:http/http.dart' as http;
import 'dart:convert';

import '../sharedPrefs.dart';

class AuthApi {
  // Login user
  Future login({
    String email,
    String password,
  }) async {
    try {
      final String url = "${sharedPrefs.apiUrl}mobileLogin";
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
        throw response.reasonPhrase;
      }
    } catch (e) {
      throw e;
    }
  }

  // Logout user
  Future logout() async {
    try {
      final String url = "${sharedPrefs.apiUrl}logout";
      final String token = sharedPrefs.userToken;

      final response = await http.get(
        url,
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw response.reasonPhrase;
      }
    } catch (e) {
      throw e;
    }
  }
}
