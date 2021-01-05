import 'package:flutter/material.dart';

Widget getCourseHeader(
  BuildContext ctx,
  String courseTitle,
  String categoryName,
  Color categoryColor,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 14, top: 8, bottom: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Course Title
        Text(
          courseTitle.toUpperCase(),
          textAlign: TextAlign.left,
          style: Theme.of(ctx).textTheme.headline3,
        ),

        SizedBox(
          height: 6,
        ),

        // Category Name
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.category,
              size: 24,
              color: categoryColor,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              categoryName,
              style: Theme.of(ctx).textTheme.headline2,
            ),
          ],
        ),
      ],
    ),
  );
}
