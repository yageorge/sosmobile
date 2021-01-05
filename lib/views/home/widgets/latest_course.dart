import 'package:flutter/material.dart';

import 'package:sosmobile/models/course.dart';
import 'package:sosmobile/models/lecture.dart';
import 'package:sosmobile/models/courseCategory.dart';

import '../../courses/list/course_summary.dart';

Widget getLatestCourse({
  BuildContext ctx,
  Course course,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 18.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Text('LATEST',
              style: Theme.of(ctx).textTheme.headline6.copyWith(
                    color: Colors.grey,
                  )),
        ),
        CourseSummary(
          course: course,
        ),
      ],
    ),
  );
}
