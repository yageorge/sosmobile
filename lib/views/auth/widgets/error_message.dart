import 'package:flutter/material.dart';

Widget getErrorMessage({
  BuildContext ctx,
  String errorMessage,
}) {
  final String userMessage = prepareUserMessage(errorMessage);

  return Container(
    height: 24,
    width: (MediaQuery.of(ctx).size.width - 72) > 176
        ? MediaQuery.of(ctx).size.width - 72
        : 176,
    color: Colors.white,
    alignment: Alignment.center,
    child: Text(
      userMessage,
      style: TextStyle(
        color: Colors.red[800],
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

String prepareUserMessage(String message) {
  String userMessage = 'An error occurred, please try again.';
  switch (message) {
    case 'Unauthorized':
      userMessage = 'Invalid Username/Password!';
      break;
    case 'too-many-requests':
      userMessage = 'Too many Requests! Try again later.';
      break;
    default:
  }

  return userMessage;
}
