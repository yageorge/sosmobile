import 'package:flutter/material.dart';

import '../../../../models/course.dart';
import '../../../../services/providers/courses_provider.dart';
import '../../../../services/sharedPrefs.dart';
import '../../../../widgets/alert_modal.dart';

Future<void> enrollUserInCourse({
  CoursesProvider coursesProvider,
  int userId,
  Course course,
  Function callBack,
}) async {
  await coursesProvider.enroll(
    userId: userId,
    course: course,
  );
  callBack();
}

Future<void> disEnrollUserFromCourse({
  BuildContext ctx,
  CoursesProvider coursesProvider,
  Course course,
  Function callBack,
}) async {
  // Confirm DisEnrollment
  bool confirmationResult = await getAlertModal(
    ctx: ctx,
    isQuestion: true,
    title: 'Are you sure?',
    message: 'All your progress will be lost in relation to this course!',
  );

  // On confirmation => disEnroll
  if (confirmationResult) {
    await coursesProvider.disEnroll(
      course: course,
    );
    callBack();
  }
}

// Enroll Button / Already Enrolled
Widget getEnrollButton({
  BuildContext ctx,
  CoursesProvider coursesProvider,
  Course course,
  int userId,
  Function callBack,
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
          course.isUserEnrolled ? 'DisEnroll' : 'Enroll',
          style: Theme.of(ctx)
              .textTheme
              .headline4
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    ),
    onTap: course.isUserEnrolled
        ? () => disEnrollUserFromCourse(
              ctx: ctx,
              coursesProvider: coursesProvider,
              course: course,
              callBack: callBack,
            )
        : () => enrollUserInCourse(
              coursesProvider: coursesProvider,
              userId: userId,
              course: course,
              callBack: callBack,
            ),
  );
}
