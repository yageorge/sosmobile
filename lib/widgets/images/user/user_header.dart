import 'package:flutter/material.dart';

import 'user_image.dart';

// Logo Container UI
Widget userHeader(BuildContext ctx) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(160.0)),
          child: userImage(
            height: 86,
            width: 86,
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'George Yaacoub',
                style: Theme.of(ctx).textTheme.headline5,
              ),
              Text(
                'gyaacoub@gmail.com',
                style: Theme.of(ctx).textTheme.headline1,
              ),
              Text(
                'Developers',
                style: Theme.of(ctx).textTheme.headline1,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
