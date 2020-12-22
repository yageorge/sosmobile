import 'package:flutter/material.dart';

Widget footerLogo(BuildContext ctx) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(86),
      bottomLeft: Radius.circular(86),
    ),
    child: Container(
      height: 54,
      width: (MediaQuery.of(ctx).size.width - 72) > 176
          ? MediaQuery.of(ctx).size.width - 72
          : 176,
      decoration: BoxDecoration(
        color: Theme.of(ctx).primaryColor,
      ),
      padding: EdgeInsets.all(4),
      child: Image.asset(
        'assets/images/app/sos_logo.png',
        height: 44,
        width: 44,
        fit: BoxFit.fitHeight,
      ),
    ),
  );
}
