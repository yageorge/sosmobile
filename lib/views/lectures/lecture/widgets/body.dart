import 'package:flutter/material.dart';

import 'package:sosmobile/models/lecture.dart';
import '../../widgets/done_checkbox.dart';

Widget getLectureBody({
  BuildContext ctx,
  int index,
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
                onChangedFn: (value) {
                  print(value);
                },
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
