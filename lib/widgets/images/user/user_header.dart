import 'package:flutter/material.dart';

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
        Center(
          child: CircleAvatar(
            backgroundColor: Theme.of(ctx).accentColor,
            radius: 42,
            child: CircleAvatar(
              radius: 39,
              backgroundImage: NetworkImage(
                user.urlImage,
              ),
            ),
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
