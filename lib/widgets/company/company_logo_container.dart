import 'package:flutter/material.dart';

import 'company_logo.dart';

// Logo Container UI
Widget companyLogoContainer(
  BuildContext ctx,
) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Theme.of(ctx).scaffoldBackgroundColor,
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 1.0,
          offset: Offset(
            1.0, // horizontal, move right 10
            1.0, // vertical, move down 10
          ),
        )
      ],
    ),
    child: companyLogo(
      height: 104,
      width: 104,
    ),
  );
}
