import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/images/main_background.dart';
import '../../services/providers/auth_provider.dart';
import '../../services/app_router.dart';

import 'widgets/footer_logo.dart';
import 'widgets/auth_form.dart';
import 'widgets/error_message.dart';

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
    AuthProvider _authProvider = Provider.of<AuthProvider>(context);

    //function to get all data from auth_form.dart as parameters + Sign in user
    void _submitAuthForm(
      String email,
      String password,
      BuildContext ctx,
    ) async {
      setState(() {
        _isLoading = true;
      });

      try {
        // Hand user login
        final dynamic _response = await _authProvider.loginUser(
          email: email,
          password: password,
        );

        // On success login, navigate to Home view:
        if (_response == "success") {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => AppRouter()),
            // To remove all the routes below the pushed route
            (r) => false,
          );
        } else if (_response['error'] != null) {
          setState(() {
            errorMessage = _response['error'];
          });
        }
      } catch (e) {
        print('catch error in auth.dart e: $e');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
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

                //Error msg:
                if (errorMessage.isNotEmpty)
                  getErrorMessage(
                    ctx: context,
                    errorMessage: errorMessage,
                  ),

                // Footer logo
                getFooterLogo(context),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
