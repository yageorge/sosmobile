import 'package:flutter/material.dart';

import '../../../models/course.dart';
import '../../../models/lecture.dart';

import 'widgets/lecture_summary.dart';

class Lectures extends StatelessWidget {
  static const routeName = '/lectures';

  final Course course;

  const Lectures({
    Key key,
    this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Lecture> lectures = course.lectures;
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
                child: LectureSummary(
                  index: i,
                  lectures: lectures,
                  course: course,
                ),
              ),
            ),
          ],
        ));
  }
}
