import 'package:flutter/material.dart';

import '../../../../models/course.dart';

import 'course_view/course_summary.dart';

class CoursesListView extends StatelessWidget {
  final List<Course> coursesData;

  const CoursesListView({
    Key key,
    this.coursesData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child:
          // Render Courses List View
          ListView.builder(
        itemCount: coursesData.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (ctx, i) => Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: CourseSummary(
            course: coursesData[i],
          ),
        ),
      ),
    );
  }
}
