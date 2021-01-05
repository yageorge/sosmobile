import 'package:flutter/material.dart';

import '../../../models/course.dart';
import '../../../widgets/state_card.dart';

Widget getUserStateSummary({
  BuildContext ctx,
  List<Course> courses,
}) {
  // Counting for completed courses + Points
  int _completedCoursesCount = 0;
  int _completedCoursesPoints = 0;
  courses.forEach((course) {
    if (course.completedDate != null) {
      _completedCoursesCount++;
      _completedCoursesPoints += course.points;
    }
  });

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      // Points state
      getStateCard(
        ctx: ctx,
        title: 'Points',
        value: _completedCoursesPoints,
        image: 'assets/images/app/points_progress.png',
        color: Theme.of(ctx).primaryColor,
      ),

      // Completed courses state
      getStateCard(
        ctx: ctx,
        title: 'Completed Courses',
        value: _completedCoursesCount,
        image: 'assets/images/app/courses_progress.png',
        color: Colors.blue[900],
      ),
    ],
  );
}
