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

  // TODO Logout

}
