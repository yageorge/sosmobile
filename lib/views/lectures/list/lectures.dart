import 'package:flutter/material.dart';

import '../../../models/lectures.dart';

import 'widgets/lecture_summary.dart';

class Lectures extends StatelessWidget {
  static const routeName = '/lectures';

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
                child: LectureSummary(
                  index: i,
                  lectures: lectures,
                  categoryColor: categoryColor,
                ),
              ),
            ),
          ],
        ));
  }
}
