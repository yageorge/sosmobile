import 'package:flutter/material.dart';

import 'company/company_logo.dart';

// Splash Screen to load on app Launch
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            companyLogo(
              height: 114,
              width: 114,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Please wait...',
              style:
                  Theme.of(context).textTheme.headline5.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
