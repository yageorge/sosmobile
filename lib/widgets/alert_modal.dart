import 'package:flutter/material.dart';

// Widget Alert Modal - question or just notification
Future<bool> getAlertModal({
  BuildContext ctx,
  String title,
  String message,
  bool isQuestion,
}) async {
  return showDialog(
    context: ctx,
    builder: (ctx) => AlertDialog(
      backgroundColor: Theme.of(ctx).scaffoldBackgroundColor,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.red[800],
        ),
      ),
      content: Text(
        message,
        style: Theme.of(ctx).textTheme.headline5,
      ),
      actions: <Widget>[
        //If Question Dialog, show No
        if (isQuestion)
          FlatButton(
            child: Text(
              'No',
              style: Theme.of(ctx).textTheme.headline5,
            ),
            onPressed: () {
              //pop the AlertDialog + return FALSE
              Navigator.of(ctx).pop(false);
            },
          ),
        //If Question Dialog, show Yes
        if (isQuestion)
          FlatButton(
            child: Text(
              'Yes',
              style: Theme.of(ctx).textTheme.headline5,
            ),
            onPressed: () {
              //pop the AlertDialog + return TRUE
              Navigator.of(ctx).pop(true);
            },
          ),
        //If NOT Question Dialog, just show Okay
        if (!isQuestion)
          FlatButton(
            child: Text(
              'Okay',
              style: Theme.of(ctx).textTheme.headline5,
            ),
            onPressed: () {
              Navigator.of(ctx).pop(false);
            },
          ),
      ],
    ),
  );
}
