import 'package:flutter/material.dart';
import 'package:sosmobile/views/courses/list/courses/widgets/course_view/widgets/header.dart';

import '../../../../course/courseDetails.dart';
import '../../../../../../models/course.dart';

import 'widgets/properties.dart';
import 'widgets/status.dart';

class CourseView extends StatelessWidget {
  final Course course;

  const CourseView({
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
                AspectRatio(
                  aspectRatio: 3,
                  child: Opacity(
                    opacity: 0.9,
                    child: Image.network(
                      course.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Course name + category
                      getHeader(
                        context,
                        course,
                        category,
                        categoryColor,
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
            if (course.isComplete) status(context),
          ]),
        ),
      ),
    );
  }
}
