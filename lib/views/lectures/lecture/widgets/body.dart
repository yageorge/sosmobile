import 'package:flutter/material.dart';

import '../../../../services/providers/courses_provider.dart';
import 'package:sosmobile/models/lecture.dart';
import '../../widgets/done_checkbox.dart';

Future<void> toggleIsLectureCompleted({
  CoursesProvider coursesProvider,
  bool value,
  int userId,
  int courseId,
  int lectureId,
  Function callBack,
}) async {
  await coursesProvider.toggleIsLectureCompleted(
    userId: userId,
    courseId: courseId,
    lectureId: lectureId,
    value: value,
  );
  callBack();
}

Widget getLectureBody({
  BuildContext ctx,
  CoursesProvider coursesProvider,
  int userId,
  int index, // index for lecture index in lectures (for numbers 1/7 example)
  int courseId,
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
                  courseId: courseId,
                  lectureId: lecture.id,
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
