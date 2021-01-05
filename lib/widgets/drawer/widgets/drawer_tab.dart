import 'package:flutter/material.dart';

ListTile drawerTab({
  BuildContext ctx,
  IconData icon,
  String title,
  Function onTapFn,
}) {
  return ListTile(
    leading: Icon(
      icon,
      color: Theme.of(ctx).accentColor,
    ),
    title: Text(
      title,
      style: Theme.of(ctx).textTheme.bodyText2,
    ),
    onTap: onTapFn,
  );
}
