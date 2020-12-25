import 'package:flutter/material.dart';
import 'package:sosmobile/models/course.dart';

Widget property({
  BuildContext ctx,
  IconData icon,
  int figure,
}) {
  return Container(
    // color: Colors.red,
    width: 44,
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
    padding: const EdgeInsets.only(right: 14, left: 18, top: 6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Total lectures
        property(
          ctx: ctx,
          icon: Icons.format_list_bulleted,
          figure: course.totalLectures,
        ),

        // Total minutes
        property(
          ctx: ctx,
          icon: Icons.access_time,
          figure: course.totalMinutes,
        ),

        // Course points
        property(
          ctx: ctx,
          icon: Icons.local_parking,
          figure: course.points,
        ),
      ],
    ),
  );
}
