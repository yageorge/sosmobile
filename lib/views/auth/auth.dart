import 'package:flutter/material.dart';

import '../../widgets/images/main_background.dart';
import 'widgets/footer_logo.dart';
import 'widgets/auth_form.dart';

class Auth extends StatefulWidget {
  static const routeName = '/auth';
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  var _isLoading = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    //function to get all data from auth_form.dart as parameters + Sign in user
    void _submitAuthForm(
      String email,
      String password,
      BuildContext ctx,
    ) async {
      print('email: ' + email);
      print('password: ' + password);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(children: [
        // Main screen background
        mainBackground(context),

        Opacity(
          opacity: 0.75,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AuthForm(_submitAuthForm, _isLoading),

                // Fooyer logo
                footerLogo(context),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
