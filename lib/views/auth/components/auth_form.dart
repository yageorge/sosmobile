import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';

class AuthForm extends StatefulWidget {
  // Contructor: receiving auth submit function + isLoading bool
  AuthForm(this.submitFn, this.isLoading);

  final bool isLoading;

  // Submit function initialized with attributes
  final void Function(
    String email,
    String password,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  // Form state key
  final _formKey = GlobalKey<FormState>();

  var _userEmail = '';
  var _userPassword = '';
  bool _passwordVisible = true;

  // On submit form function
  void _trySubmit() {
    // Validating form
    final isValid = _formKey.currentState.validate();

    // Close keyboard
    FocusScope.of(context).unfocus();

    // if form isValid is null
    if (isValid) {
      // Save all form fields
      _formKey.currentState.save();

      // Call to param function
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
          width: (MediaQuery.of(context).size.width - 72) > 176
              ? MediaQuery.of(context).size.width - 72
              : 176,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // User email input
                TextFormField(
                  key: ValueKey('email'),
                  decoration: InputDecoration(labelText: 'Email'),
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  enableSuggestions: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (!EmailValidator.validate(value)) {
                      return 'You have entered an invalid Email!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Will run after succesffuly validation
                    _userEmail = value;
                  },
                ),

                //Password Text Field Form
                TextFormField(
                  key: ValueKey('password'),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    //TODO convert IconButton to InkWell used other screens, to fix X wrong alignment
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  autocorrect: false,
                  //obscureText true to hide password while writing
                  obscureText: _passwordVisible,
                  enableSuggestions: false,
                  validator: (value) {
                    if (value.isEmpty || value.length < 7) {
                      return 'Password must be at least 7 characters long.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Will run after succesffuly validation
                    _userPassword = value;
                  },
                ),

                SizedBox(
                  height: 12,
                ),

                //if we are loading: show CircularPInd
                if (widget.isLoading)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),

                //if we are NOT loading, show Login
                if (!widget.isLoading)
                  RaisedButton(
                    child: Text('Login'),
                    onPressed: _trySubmit,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
