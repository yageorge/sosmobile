import 'package:flutter/material.dart';

import 'user_image.dart';
import '../../../models/user.dart';

// User Header
Widget userHeader({
  BuildContext ctx,
  User user,
}) {
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
                '${user.firstName} ${user.lastName}',
                style: Theme.of(ctx).textTheme.headline5,
              ),
              Text(
                user.email,
                style: Theme.of(ctx).textTheme.headline2,
              ),
              Text(
                user.department.name,
                style: Theme.of(ctx).textTheme.headline2,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
