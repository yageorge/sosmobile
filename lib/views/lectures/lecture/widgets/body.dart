import 'package:flutter/material.dart';

import '../../../../services/providers/courses_provider.dart';
import 'package:sosmobile/models/lecture.dart';
import '../../widgets/done_checkbox.dart';

Future<void> toggleIsLectureCompleted({
  CoursesProvider coursesProvider,
  bool value,
  int userId,
  int lectureId,
}) async {
  await coursesProvider.toggleIsLectureCompleted(
    userId: userId,
    lectureId: lectureId,
    value: value,
  );
}

Widget getLectureBody({
  BuildContext ctx,
  CoursesProvider coursesProvider,
  int userId,
  int index, // index for lecture index in lectures (for numbers 1/7 example)
  Lecture lecture,
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
                  lectureId: lecture.id,
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
