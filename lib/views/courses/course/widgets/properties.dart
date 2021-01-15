import 'package:flutter/material.dart';
import 'package:sosmobile/models/course.dart';

import '../../../../services/sharedPrefs.dart';
import '../../../../helpers/minutes_to_string.dart';

Widget property({
  BuildContext ctx,
  IconData icon,
  String figure,
}) {
  return Container(
    padding: const EdgeInsets.only(bottom: 2),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 20,
          color: Colors.white,
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
  Color categoryColor,
) {
  return Container(
    padding: EdgeInsets.all(8),
    width: sharedPrefs.deviceWidth * 0.65,
    height: 54,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(26)),
      color: Colors.teal,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Total lectures
        property(
          ctx: ctx,
          icon: Icons.format_list_bulleted,
          figure: course.totalLectures.toString(),
        ),

        // Total minutes
        property(
          ctx: ctx,
          icon: Icons.access_time,
          figure: minutesToString(course.totalMinutes),
        ),

        // Course points
        property(
          ctx: ctx,
          icon: Icons.star,
          figure: course.points.toString(),
        ),
      ],
    ),
  );
}
