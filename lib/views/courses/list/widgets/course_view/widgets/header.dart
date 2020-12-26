// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sosmobile/models/course.dart';
import 'package:sosmobile/models/courseCategory.dart';

Widget getHeader(
  BuildContext ctx,
  Course course,
  CourseCategory category,
  Color categoryColor,
) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(left: 14, top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Course Title
          Text(
            course.title.toUpperCase(),
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
        ],
      ),
    ),
  );
}
