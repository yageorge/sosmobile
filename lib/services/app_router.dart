import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../services/sharedPrefs.dart';
import '../services/providers/user_provider.dart';
import '../services/storage/secure_storage.dart';

import '../models/user.dart';
import '../views/splash_screen.dart';
import '../widgets/loading_indicator.dart';
import '../views/home/home.dart';
import '../views/intro/intro.dart';
import '../views/auth/auth.dart';

class AppRouter extends StatelessWidget {
  static const routeName = '/approuter';

  @override
  Widget build(BuildContext context) {
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);

    final SecureStorage storage = SecureStorage();

    sharedPrefs.deviceHeight = MediaQuery.of(context).size.height;
    sharedPrefs.deviceWidth = MediaQuery.of(context).size.width;
    sharedPrefs.apiUrl = "http://10.0.2.2:8000/api/";

    Future<void> checkUserAuthenticated() async {
      final String _userToken = await storage.getStorageValue(
        id: "userToken",
      );

      final String _user = await storage.getStorageValue(
        id: "user",
      );

      final String _department = await storage.getStorageValue(
        id: "department",
      );

      final String _intro = await storage.getStorageValue(
        id: "intro",
      );
      print('_intro type : ${_intro.runtimeType}');
      if (_userToken != null && _user != null && _department != null) {
        // convert user + department storage info to user provider
        await _userProvider.setCurrentUser(
          user: json.decode(_user),
          department: json.decode(_department),
        );

        // save token to sharedprefs
        sharedPrefs.userToken = _userToken;
        sharedPrefs.userId = json.decode(_user)['id'];

        // User authenticated => navigate home
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Home()), (r) => false);
      } else {
        print('_intro type : ${_intro.runtimeType}');
        // check if user / first time app run:
        if (_intro == null) {
          // Navigate to Intro
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) => Intro()), (r) => false);
        } else {
          // User Unauthenticated => navigate to Auth
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) => Auth()), (r) => false);
        }
      }
    }

    checkUserAuthenticated();

    return SplashScreen();
  }
}
