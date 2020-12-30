import 'package:flutter/material.dart';
import 'package:sosmobile/models/course.dart';

import '../../../../helpers/minutes_to_string.dart';

Widget property({
  BuildContext ctx,
  double width,
  IconData icon,
  String figure,
}) {
  return Container(
    width: width,
    padding: const EdgeInsets.only(bottom: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 14,
          color: Theme.of(ctx).accentColor,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          '$figure',
          textAlign: TextAlign.left,
          style: Theme.of(ctx).textTheme.headline3,
        ),
      ],
    ),
  );
}

Widget getProperties(
  BuildContext ctx,
  Course course,
) {
  return Padding(
    padding: const EdgeInsets.only(right: 14, left: 10, top: 6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Total lectures
        property(
          ctx: ctx,
          width: 44,
          icon: Icons.format_list_bulleted,
          figure: course.totalLectures.toString(),
        ),

        // Course points
        property(
          ctx: ctx,
          width: 44,
          icon: Icons.local_parking,
          figure: course.points.toString(),
        ),

        // Total minutes
        property(
          ctx: ctx,
          width: 84,
          icon: Icons.access_time,
          figure: minutesToString(course.totalMinutes),
        ),
      ],
    ),
  );
}
