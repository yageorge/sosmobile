import 'package:flutter/material.dart';

// Main background image
Widget mainBackground(BuildContext ctx) {
  return Opacity(
    opacity: 0.2,
    child: Image(
      image: AssetImage('assets/images/app/admin_background.png'),
      width: MediaQuery.of(ctx).size.width,
      height: MediaQuery.of(ctx).size.height,
      fit: BoxFit.cover,
    ),
  );
}
