import 'package:flutter/material.dart';

import '../services/sharedPrefs.dart';
import '../views/splash_screen.dart';

import '../views/home/home.dart';
import '../views/intro/intro.dart';
import '../views/auth/auth.dart';

class AppRouter extends StatelessWidget {
  static const routeName = '/approuter';
  @override
  Widget build(BuildContext context) {
    sharedPrefs.deviceHeight = MediaQuery.of(context).size.height;
    sharedPrefs.deviceWidth = MediaQuery.of(context).size.width;

    Future.delayed(const Duration(milliseconds: 700), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Home()), (r) => false);
    });

    return SplashScreen();
  }
}
