import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:introduction_screen/introduction_screen.dart';

import './styles/theme.dart';
import './core/routes.dart';
import './services/sharedPrefs.dart';
import './services/app_router.dart';
import './views/auth/auth.dart';

import './services/providers/auth_provider.dart';
import './services/providers/user_provider.dart';
import './services/providers/courses_provider.dart';

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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<CoursesProvider>(
          create: (context) => CoursesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Skill Optimizer',
        debugShowCheckedModeBanner: false,
        theme: buildThemeData(context),
        routes: buildRoutes(context),
        home: AppRouter(),
      ),
    );
  }
}
