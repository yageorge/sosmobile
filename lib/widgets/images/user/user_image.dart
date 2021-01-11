import 'package:flutter/material.dart';

Image userImage({
  String imageUrl,
  double height,
  double width,
}) {
  return Image.network(
    imageUrl ??
        'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png',
    height: height,
    width: width,
    fit: BoxFit.fitHeight,
  );
}
