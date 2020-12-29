import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

import './styles/theme.dart';
import './core/routes.dart';
import './services/sharedPrefs.dart';
import './services/app_router.dart';

// TO DELETE:
import 'views/lectures/video/test_youtube.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initializing shared preferences
  await sharedPrefs.init();
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
      home: AppRouter(),
    );
  }
}
