import 'package:flutter/material.dart';

import '../../../models/course.dart';
import 'course_summary.dart';
import '../../../widgets/absent_data.dart';

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
      child: coursesData.length != 0
          ?
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
            )
          : abscentData(context),
    );
  }
}
