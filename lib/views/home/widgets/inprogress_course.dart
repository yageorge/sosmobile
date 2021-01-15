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
        _filteredCourses.length != 0
            // Show course is user is enrolled to any
            ? CourseSummary(
                course: _filteredCourses[0],
              )
            // show message if not enrolled
            : Container(
                child: Text(
                  'You have not enrolled to any courses yet!\nEnroll and start learning now!',
                  style: Theme.of(ctx).textTheme.headline3.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ),
      ],
    ),
  );
}
