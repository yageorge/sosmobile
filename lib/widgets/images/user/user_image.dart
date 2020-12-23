import 'package:flutter/material.dart';

Image userImage({
  double height,
  double width,
}) {
  return Image.asset(
    'assets/images/users/user_image.png',
    height: height,
    width: width,
    fit: BoxFit.fitHeight,
  );
}
