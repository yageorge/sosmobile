import 'package:flutter/material.dart';

import '../../../../services/providers/courses_provider.dart';
import 'package:sosmobile/models/course.dart';
import '../../../../services/sharedPrefs.dart';

Future<void> enrollUserToCourse({
  CoursesProvider coursesProvider,
  int userId,
  int courseId,
}) async {
  await coursesProvider.enrollUserToCourse(
    userId: userId,
    courseId: courseId,
  );
}

// Enroll Button / Already Enrolled
Widget getEnrollButton({
  BuildContext ctx,
  CoursesProvider coursesProvider,
  Course course,
  int userId,
}) {
  return InkWell(
    child: Container(
      width: sharedPrefs.deviceWidth * 0.22,
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(26)),
        color: course.isUserEnrolled
            ? Theme.of(ctx).backgroundColor
            : Theme.of(ctx).primaryColor,
      ),
      child: Center(
        child: Text(
          course.isUserEnrolled ? 'Enrolled' : 'Enroll',
          style: Theme.of(ctx)
              .textTheme
              .headline4
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    ),
    onTap: course.isUserEnrolled
        ? null
        : () => enrollUserToCourse(
              coursesProvider: coursesProvider,
              userId: userId,
              courseId: course.id,
            ),
  );
}
