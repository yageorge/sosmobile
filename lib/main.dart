import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './styles/theme.dart';
import './core/routes.dart';
import './services/sharedPrefs.dart';
import './services/app_router.dart';

import './services/providers/auth_provider.dart';
import './services/providers/user_provider.dart';
import './services/providers/courses_provider.dart';
import './services/providers/userFeedbacks_provider.dart';
import 'models/userFeedback.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();
  // Initialize shared preferences
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
        // Provider UserFeedBacksProvider to be on top of userFeedback Stream provider
        ChangeNotifierProvider<UserFeedBacksProvider>(
          create: (context) => UserFeedBacksProvider(),
        ),
      ],
      child: Builder(
        builder: (BuildContext bCtx) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthProvider>(
                create: (bCtx) => AuthProvider(),
              ),
              ChangeNotifierProvider<UserProvider>(
                create: (bCtx) => UserProvider(),
              ),
              ChangeNotifierProvider<CoursesProvider>(
                create: (bCtx) => CoursesProvider(),
              ),
              StreamProvider<List<UserFeedback>>.value(
                value:
                    Provider.of<UserFeedBacksProvider>(bCtx).getUserFeedbacks,
                initialData: List(),
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
        },
      ),
    );
  }
}
