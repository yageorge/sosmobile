import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../../models/course.dart';
import '../../../widgets/state_card.dart';

Widget getUserStateSummary({
  BuildContext ctx,
  User user,
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

  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Points Target
          getStateCard(
            ctx: ctx,
            title: 'Target Points',
            value: user.pointsTarget,
            image: 'assets/images/app/target_progress.png',
            color: Colors.blue[900],
          ),

          // Points state
          getStateCard(
            ctx: ctx,
            title: 'Points',
            value: _completedCoursesPoints,
            image: 'assets/images/app/points_progress.png',
            color: Theme.of(ctx).primaryColor,
          ),
        ],
      ),

      // Completed courses state
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: getStateCard(
          ctx: ctx,
          title: 'Completed Courses',
          value: _completedCoursesCount,
          image: 'assets/images/app/courses_progress.png',
          color: Colors.blue[900],
        ),
      ),
    ],
  );
}
