import 'package:flutter/material.dart';

import 'company/company_logo.dart';

Widget loadingIndicator({
  BuildContext ctx,
  double deviceHeight,
}) {
  return Center(
    child: Container(
      height: deviceHeight - 146,
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SOS Logo
          companyLogo(
            height: 84,
            width: 84,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 28.0, bottom: 6.0),
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(ctx).primaryColor,
            ),
          ),

          Text(
            'Loading',
            style: Theme.of(ctx).textTheme.headline5.copyWith(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
