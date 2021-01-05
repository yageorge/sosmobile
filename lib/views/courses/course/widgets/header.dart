import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sosmobile/models/course.dart';
import 'package:sosmobile/models/courseCategory.dart';

Widget getHeader(
  BuildContext ctx,
  Course course,
  CourseCategory category,
  Color categoryColor,
) {
  return Container(
    padding: EdgeInsets.all(6),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16.0)),
      boxShadow: [
        BoxShadow(
          color: categoryColor.withOpacity(0.2),
          blurRadius: 3.0,
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Title
        Text(
          course.title.toUpperCase(),
          textAlign: TextAlign.left,
          style: Theme.of(ctx).textTheme.headline6,
        ),

        SizedBox(
          height: 4,
        ),

        // Description
        Text(
          course.description,
          textAlign: TextAlign.left,
          style: Theme.of(ctx).textTheme.headline3,
        ),

        SizedBox(
          height: 10,
        ),

        // Category Name
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.category,
              size: 24,
              // color: Theme.of(context).accentColor,
              color: categoryColor,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              category.name,
              style: Theme.of(ctx).textTheme.headline2,
            ),
          ],
        ),

        // Date created
        Padding(
          padding: const EdgeInsets.only(
            top: 6.0,
            bottom: 4.0,
          ),
          child: Text(
            'Added: ${DateFormat.yMMMd().format(course.createdAt)}',
            style: Theme.of(ctx).textTheme.headline2,
          ),
        ),
      ],
    ),
  );
}
