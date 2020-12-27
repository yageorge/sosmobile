import 'package:flutter/material.dart';

import '../../../../../models/course.dart';
import '../../../course/course_details.dart';

import '../../../widgets/course_image.dart';
import '../../../widgets/course_header.dart';

import 'widgets/properties.dart';
import 'widgets/status.dart';

class CourseSummary extends StatelessWidget {
  final Course course;

  const CourseSummary({
    Key key,
    this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = course.category;
    final categoryColor = Color(int.parse(category.colorVal));

    onCourseTap(Course course) {
      Navigator.of(context).pushNamed(
        CourseDetails.routeName,
        arguments: course,
      );
    }

    return InkWell(
      onTap: () => onCourseTap(course),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: [
            BoxShadow(
              color: categoryColor.withOpacity(0.2),
              blurRadius: 3.0,
              offset: Offset(
                1.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          child: Stack(children: [
            Column(
              children: [
                //Course Image:
                getCourseImage(
                  ratio: 3,
                  opacity: 0.9,
                  imageUrl: course.imageUrl,
                ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Course name + category
                      Expanded(
                        child: getCourseHeader(
                          context,
                          course.title,
                          category.name,
                          categoryColor,
                        ),
                      ),

                      // number of Lectures - minutes - points
                      getProperties(
                        context,
                        course,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Course status None / Enrolled / Complete
            if (course.isUserEnrolled)
              status(
                ctx: context,
                isComplete: course.isComplete,
              ),
          ]),
        ),
      ),
    );
  }
}
