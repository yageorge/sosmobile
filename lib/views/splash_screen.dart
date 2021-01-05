import 'package:flutter/material.dart';

import '../widgets/company/company_logo.dart';

// Splash Screen to load on app Launch
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: companyLogo(
          height: 114,
          width: 114,
        ),
      ),
    );
  }
}
