import 'package:flutter/material.dart';

// Image config build
Widget buildImage(String assetName) {
  return Align(
    child: Image.asset('assets/images/app/$assetName', width: 350.0),
    alignment: Alignment.bottomCenter,
  );
}
