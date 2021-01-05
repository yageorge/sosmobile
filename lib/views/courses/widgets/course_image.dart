import 'package:flutter/material.dart';

Widget getCourseImage({
  String urlImage,
  double ratio,
  double opacity,
}) {
  return // Course image
      AspectRatio(
    aspectRatio: ratio,
    child: Opacity(
      opacity: opacity,
      child: Image.network(
        urlImage,
        fit: BoxFit.cover,
      ),
    ),
  );
}
