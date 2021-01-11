import 'package:flutter/material.dart';

import 'company/company_logo.dart';

Widget abscentData(BuildContext ctx) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SOS Logo
        companyLogo(
          height: 84,
          width: 84,
        ),

        SizedBox(
          height: 16,
        ),
        Text(
          'Nothing to show yet\nExpect Amazing Soon!',
          style: Theme.of(ctx).textTheme.headline5.copyWith(fontSize: 12),
        ),
      ],
    ),
  );
}
