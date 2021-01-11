import 'package:flutter/material.dart';

void notificationSnackBar(
  BuildContext ctx,
  String message,
) {
  Scaffold.of(ctx).hideCurrentSnackBar();
  Scaffold.of(ctx).showSnackBar(
    SnackBar(
      content: Text(
        message,
      ),
      duration: Duration(
        seconds: 2,
      ),
    ),
  );
}
