import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    UserProvider _userProvider = Provider.of<UserProvider>(context);
    final SecureStorage storage = SecureStorage();
    bool userAuthenticated = false;
    sharedPrefs.deviceHeight = MediaQuery.of(context).size.height;
    sharedPrefs.deviceWidth = MediaQuery.of(context).size.width;
    sharedPrefs.apiUrl = "http://10.0.2.2:8000/api/";
    // To convert to User Provider
    sharedPrefs.userId = 1;

    Future<void> checkUserAuthenticated() async {
      final String _userToken = await storage.getStorageValue(
        id: "userToken",
      );

      User _user = _userProvider.user;
      print('checkUserAuthenticated _userToken : $_userToken ');
      print('checkUserAuthenticated _user email : ${_user.email} ');
      if (_userToken.isNotEmpty) {
        // Get user info from local storage and save in user provider
        // USER PROVIDER is losing it;s content on app restart
        userAuthenticated = true;
        print('    userAuthenticated = true;');
      }
    }

    checkUserAuthenticated();

    if (userAuthenticated) {
      // User is authenticated:
      return Home();
    }

// if user is not Authenticated - Direct to Auth():
    // if first login - show Into pages;
    // Future.delayed(const Duration(milliseconds: 700), () {
    //   Navigator.pushAndRemoveUntil(context,
    //       MaterialPageRoute(builder: (context) => Home()), (r) => false);
    // });

    return Auth();
  }
}

// did not work

// FutureBuilder<bool>(
//   future: checkUserAuthenticated(),
//   builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//     if (!snapshot.hasData) {
//       return loadingIndicator(
//         ctx: context,
//         deviceHeight: sharedPrefs.deviceHeight,
//       );
//     } else {
//       if (userAuthenticated) {
//         return Home();
//       }
//       return Auth();
//     }
//   },
// );
