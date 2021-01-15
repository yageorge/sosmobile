import 'package:flutter/material.dart';

import '../../../../models/course.dart';
import '../../../../models/courseCategory.dart';
import '../../../userFeedbacks/feedbacks.dart';

Widget getUsersFeedbacksButton(
  BuildContext ctx,
  Course course,
  CourseCategory category,
) {
  return Container(
    width: double.infinity,
    height: 36,
    padding: const EdgeInsets.only(top: 10),
    child: ElevatedButton.icon(
      label: Text('Feedbacks'),
      icon: Icon(
        Icons.add_comment,
        size: 20,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo.withOpacity(0.7),
      ),
      onPressed: () {
        Navigator.of(ctx).pushNamed(
          Feedbacks.routeName,
          // Sending arguments params: Course + All lectures + current lecture index
          arguments: {
            'course': course,
            'category': category,
          },
        );
      },
    ),
  );
}
