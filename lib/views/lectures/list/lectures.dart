import 'package:flutter/material.dart';

import '../../../models/lectures.dart';

import './widgets/lecture_view.dart';

class Lectures extends StatelessWidget {
  final List<Lecture> lectures;
  final Color categoryColor;

  const Lectures({
    Key key,
    this.lectures,
    this.categoryColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Render Courses List View
            ListView.builder(
              itemCount: lectures.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) => Padding(
                padding: const EdgeInsets.only(top: 6),
                child: LectureView(
                  index: i + 1,
                  lecture: lectures[i],
                  categoryColor: categoryColor,
                ),
              ),
            ),
          ],
        ));
  }
}
