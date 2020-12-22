import 'package:flutter/material.dart';

ThemeData buildThemeData(BuildContext context) {
  return ThemeData(
    primaryColor: Colors.teal,
    primarySwatch: Colors.teal,
    backgroundColor: Colors.grey[800],
    accentColor: Colors.tealAccent,
    scaffoldBackgroundColor: Colors.grey[900],
    errorColor: Colors.red[800],
    splashColor: Colors.white,
    //accentColorBrightness to dark: to avoid ending up with black text on indigoAccent background
    //so we tell flutter that the brightness is dark, to use bright stuff
    accentColorBrightness: Brightness.dark,
    textTheme: ThemeData.light().textTheme.copyWith(
          //TextStyle small size / TEAL:
          bodyText1: TextStyle(
            color: Colors.teal,
          ),
          //TextStyle small size / WHITE:
          bodyText2: TextStyle(
            color: Colors.white,
          ),
          //TextStyle Large size / White:
          headline6: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          //TextStyle Large size / Teal:
          headline5: TextStyle(
            fontSize: 16,
            color: Colors.teal,
          ),
          //TextStyle Smaller size / White:
          headline4: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          //TextStyle Smaller size / White:
          headline3: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
          //TextStyle Smaller size / White:
          headline2: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
          //TextStyle Very Large size / White:
          headline1: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
    //inheriting then overwrite some parts in buttonTheme
    buttonTheme: ButtonTheme.of(context).copyWith(
      buttonColor: Colors.teal,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
