import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

import './styles/theme.dart';
import './core/routes.dart';

import 'views/intro/intro.dart';
import 'views/auth/auth.dart';
import 'views/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Configure app state overLay Style - used with introduction_screen package
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Skill Optimizer',
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(context),
      routes: buildRoutes(context),
      home: Home(),
    );
  }
}
