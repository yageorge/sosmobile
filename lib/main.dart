import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './styles/theme.dart';

import 'views/auth/auth.dart';
import 'views/intro/intro.dart';

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
      home: Intro(),
    );
  }
}
