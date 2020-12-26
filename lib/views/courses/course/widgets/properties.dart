import 'package:flutter/material.dart';
import 'package:sosmobile/models/course.dart';

import '../../../../helpers/minutes_to_string.dart';

Widget property({
  BuildContext ctx,
  IconData icon,
  String figure,
  String name,
  bool isLarge,
}) {
  return Container(
    padding: const EdgeInsets.only(bottom: 2),
    child: Row(
      children: <Widget>[
        Container(
          width: 60,
          child: Text(
            '$name',
            textAlign: TextAlign.left,
            style: isLarge
                ? Theme.of(ctx).textTheme.headline4
                : Theme.of(ctx).textTheme.headline2,
          ),
        ),
        Icon(
          icon,
          size: 14,
          color: Theme.of(ctx).accentColor,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          '$figure',
          textAlign: TextAlign.left,
          style: isLarge
              ? Theme.of(ctx).textTheme.headline6
              : Theme.of(ctx).textTheme.headline2,
        ),
      ],
    ),
  );
}

Widget getProperties(
  BuildContext ctx,
  Course course,
  Color categoryColor,
) {
  return Container(
    margin: EdgeInsets.only(top: 8),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      border: Border.all(
        color: categoryColor,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total lectures
            property(
              ctx: ctx,
              icon: Icons.format_list_bulleted,
              figure: course.totalLectures.toString(),
              name: "Lectures",
              isLarge: false,
            ),

            // Total minutes
            property(
              ctx: ctx,
              icon: Icons.access_time,
              figure: minutesToString(course.totalMinutes),
              name: "Minutes",
              isLarge: false,
            ),
          ],
        ),

        SizedBox(
          width: 14,
        ),

        // Course points
        property(
          ctx: ctx,
          icon: Icons.local_parking,
          figure: course.points.toString(),
          name: "Points",
          isLarge: true,
        ),
      ],
    ),
  );
}
