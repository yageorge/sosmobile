import 'package:flutter/material.dart';

Widget property({
  BuildContext ctx,
  IconData icon,
  int figure,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 14,
          color: Theme.of(ctx).accentColor,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          '$figure',
          textAlign: TextAlign.left,
          style: Theme.of(ctx).textTheme.headline3,
        ),
      ],
    ),
  );
}
