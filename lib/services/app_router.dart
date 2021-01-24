import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:convert';

import '../services/sharedPrefs.dart';
import '../services/providers/user_provider.dart';
import '../services/storage/secure_storage.dart';
import '../services/api/auth_api.dart';

import '../widgets/splash_screen.dart';
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

    // URL to be modified depending on the Laravel Serve address:
    sharedPrefs.apiUrl = "http://192.168.100.6:8000/api/";

    Future<void> checkUserAuthenticated() async {
      // Delay this loading code, to leave 1.75 seconds for the splash screen to show
      Future.delayed(const Duration(milliseconds: 1750), () async {
        // Get token / user / department / intro check from device storage
        final String _userToken =
            await storage.getStorageValue(id: "userToken");
        final String _user = await storage.getStorageValue(id: "user");
        final String _department =
            await storage.getStorageValue(id: "department");
        final String _intro = await storage.getStorageValue(id: "intro");

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
      });
    }

    void runFirebaseMessaging() async {
      final fbm = FirebaseMessaging();
      fbm.requestNotificationPermissions();

      // Get + set user FBM token to Laravel user
      final String userFBMToken = await fbm.getToken();
      final AuthApi authApi = AuthApi();
      await authApi.saveFBMToken(userFBMToken);
    }

    runFirebaseMessaging();
    checkUserAuthenticated();

    // Return splashscreen for 1.75 seconds / delayed by   checkUserAuthenticated();
    return SplashScreen();
  }
}
