import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../sharedPrefs.dart';

class AuthApi {
  FirebaseAuth auth = FirebaseAuth.instance;
  final String token = sharedPrefs.userToken;

  // Login to Firebase + return firebase token
  Future<String> firebaseLogin({
    String email,
    String password,
  }) async {
    String _firebaseToken;
    try {
      // Firebase signIn
      UserCredential _userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      // get firebase user token
      _firebaseToken = await _userCredential.user.getIdToken();
    } on FirebaseAuthException catch (e) {
      print('error firebase auth: e.code ${e.code}');
      if (e.code == 'user-not-found') {
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        throw 'Wrong password provided for that user.';
      }
    }
    return _firebaseToken;
  }

  // Login user to laravel
  Future login({
    String email,
    String password,
  }) async {
    try {
      // Firebase login:
      final String _firebaseToken = await firebaseLogin(
        email: email,
        password: password,
      );

      // Prepare url
      final String url = "${sharedPrefs.apiUrl}login";
      // Laravel login:
      final response = await http.post(
        url,
        body: {
          'firebaseToken': _firebaseToken,
          'platform': 'mobile',
        },
      );
      print('auth_api response: ${response.body}');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw response.reasonPhrase;
      }
    } catch (e) {
      // throw e;
      print('auth_api catch error e: $e');
    }
  }

  // Logout user
  Future logout() async {
    try {
      // Firebase logout
      await auth.signOut();

      // Prepare url
      final String url = "${sharedPrefs.apiUrl}logout";
      final String token = sharedPrefs.userToken;
      // Laravel logout:
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

  // Saving user Firebase Messaging Token
  Future saveFBMToken(String messagingToken) async {
    try {
      // Prepare url
      final String url = "${sharedPrefs.apiUrl}cloudmessaging/save";

      // Api savetoken request
      final response = await http.post(
        url,
        headers: {'Authorization': token},
        body: {'messagingToken': messagingToken},
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw response.reasonPhrase;
      }
    } catch (e) {
      // throw e;
      print('saveFBMToken catch error e: $e');
    }
  }
}
