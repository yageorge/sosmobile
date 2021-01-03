import 'package:flutter/material.dart';

import 'package:sosmobile/models/course.dart';

import '../../courses/list/course_summary.dart';

Widget getInProgressCourse({
  BuildContext ctx,
  List<Course> courses,
}) {
  // Filter courses by isEnrolled + not complete:
  List<Course> _filteredCourses = courses
      .where((Course course) =>
          course.isUserEnrolled && course.completedDate == null)
      .toList();

  return Padding(
    padding: const EdgeInsets.only(bottom: 18.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Text(
            'In Progress',
            style: Theme.of(ctx).textTheme.headline6.copyWith(
                  color: Colors.grey,
                ),
          ),
        ),
        CourseSummary(
          course: _filteredCourses[0],
        ),
      ],
    ),
  );
}
