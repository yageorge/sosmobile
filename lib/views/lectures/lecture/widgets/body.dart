import 'package:flutter/material.dart';

import '../../../../services/providers/courses_provider.dart';
import 'package:sosmobile/models/lecture.dart';
import '../../widgets/done_checkbox.dart';

// Render Lecture Body Title - isDone - status - content
Widget getLectureBody({
  BuildContext ctx,
  CoursesProvider coursesProvider,
  int userId,
  int index,
  Lecture lecture,
  Function callBack,
}) {
  return Container(
    padding: const EdgeInsets.only(bottom: 12.0),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Lecture Title + isDone
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              // Title
              Expanded(
                child: Text(
                  '${index + 1}. ${lecture.title}',
                  style: Theme.of(ctx).textTheme.headline6,
                ),
              ),

              // Lecture status:
              getDoneCheckbox(
                ctx: ctx,
                initValue: lecture.isCompleted,
                onChangedFn: (value) => toggleIsLectureCompleted(
                  coursesProvider: coursesProvider,
                  value: value,
                  userId: userId,
                  lecture: lecture,
                  lectureIndex: index,
                  callBack: callBack,
                ),
              ),
            ],
          ),
        ),

        // Content
        Text('${lecture.content}'),
      ],
    ),
  );
}

// Calling toggle handler + calling callBack function
Future<void> toggleIsLectureCompleted({
  CoursesProvider coursesProvider,
  int userId,
  Lecture lecture,
  int lectureIndex,
  bool value,
  Function callBack,
}) async {
  await coursesProvider.toggleIsLectureCompleted(
    userId: userId,
    lecture: lecture,
    value: value,
  );
  // Running callBack function setState
  callBack(lectureIndex);
}
