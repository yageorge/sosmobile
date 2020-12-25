import 'package:flutter/material.dart';

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
          Text(
            'Loading',
            style: Theme.of(ctx).textTheme.headline5,
          ),
          SizedBox(
            height: 12,
          ),
          CircularProgressIndicator(
            backgroundColor: Theme.of(ctx).primaryColor,
          ),
        ],
      ),
    ),
  );
}
