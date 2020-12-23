import 'package:flutter/material.dart';

Image companyLogo({
  double height,
  double width,
}) {
  return Image.asset(
    'assets/images/app/sos_logo.png',
    height: height,
    width: width,
    fit: BoxFit.fitHeight,
  );
}
