import 'package:flutter/material.dart';

AppBar appBar(
  BuildContext context,
  String title,
) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    ),
    titleSpacing: 0.0,
  );
}
