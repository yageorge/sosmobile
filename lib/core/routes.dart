import 'package:flutter/material.dart';

import '../views/auth/auth.dart';
import '../views/about/about.dart';
import '../views/home/home.dart';
import '../views/user/user_profile.dart';

Map<String, Widget Function(BuildContext)> buildRoutes(BuildContext ctx) {
  return {
    Auth.routeName: (ctx) => Auth(),
    About.routeName: (ctx) => About(),
    Home.routeName: (ctx) => Home(),
    UserProfile.routeName: (ctx) => UserProfile(),
  };
}
