import 'package:flutter/material.dart';

import '../../../../models/course.dart';
import '../../../../services/providers/courses_provider.dart';
import '../../../../services/sharedPrefs.dart';
import '../../../../widgets/alert_modal.dart';
import '../../../../widgets/notification_snackbar.dart';

class EnrollButton extends StatefulWidget {
  final CoursesProvider coursesProvider;
  final Course course;
  final int userId;

  const EnrollButton({
    Key key,
    this.coursesProvider,
    this.course,
    this.userId,
  }) : super(key: key);

  @override
  _EnrollButtonState createState() => _EnrollButtonState();
}

class _EnrollButtonState extends State<EnrollButton> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    Future<void> enrollUserInCourse({
      CoursesProvider coursesProvider,
      int userId,
      Course course,
    }) async {
      setState(() {
        isLoading = true;
      });
      await coursesProvider.enroll(
        userId: userId,
        course: course,
      );
      setState(() {
        isLoading = false;
      });
      notificationSnackBar(context, 'You\'ve enrolled. Get started now!');
    }

    Future<void> disEnrollUserFromCourse({
      BuildContext context,
      CoursesProvider coursesProvider,
      Course course,
    }) async {
      // Confirm DisEnrollment
      bool confirmationResult = await getAlertModal(
        ctx: context,
        isQuestion: true,
        title: 'Are you sure?',
        message: 'All your progress will be lost in relation to this course!',
      );

      // On confirmation => disEnroll
      if (confirmationResult) {
        setState(() {
          isLoading = true;
        });
        await coursesProvider.disEnroll(
          course: course,
        );
        setState(() {
          isLoading = false;
        });
        notificationSnackBar(context, 'Sorry to see you going!');
      }
    }

    return !isLoading
        ? InkWell(
            child: Container(
              width: sharedPrefs.deviceWidth * 0.22,
              height: 54,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(26)),
                color: widget.course.isUserEnrolled
                    ? Theme.of(context).backgroundColor
                    : Theme.of(context).primaryColor,
              ),
              child: Center(
                child: Text(
                  widget.course.isUserEnrolled ? 'DisEnroll' : 'Enroll',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: widget.course.isUserEnrolled
                ? () => disEnrollUserFromCourse(
                      context: context,
                      coursesProvider: widget.coursesProvider,
                      course: widget.course,
                    )
                : () => enrollUserInCourse(
                      coursesProvider: widget.coursesProvider,
                      userId: widget.userId,
                      course: widget.course,
                    ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
            ),
          );
  }
}
