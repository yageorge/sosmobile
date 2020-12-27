import 'package:flutter/material.dart';

Widget getCourseImage({
  String imageUrl,
  double ratio,
  double opacity,
}) {
  return // Course image
      AspectRatio(
    aspectRatio: ratio,
    child: Opacity(
      opacity: opacity,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    ),
  );
}
