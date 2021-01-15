import 'package:flutter/material.dart';

import '../../../models/course.dart';
import '../../../models/courseCategory.dart';
import '../../../models/lecture.dart';
import '../course/course_details.dart';

import '../../../widgets/percent_indicator.dart';
import '../widgets/course_image.dart';
import '../widgets/course_header.dart';

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
    final List<Lecture> _lectures = course.lectures;
    final CourseCategory _category = course.category;
    final Color _categoryColor = Color(int.parse(_category.colorVal));

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
              color: _categoryColor.withOpacity(0.2),
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
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Course Image:
                  getCourseImage(
                    ratio: 3,
                    opacity: 0.9,
                    urlImage: course.urlImage,
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
                            _category.name,
                            _categoryColor,
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

                  // Percent Progress indicator
                  if (course.isUserEnrolled)
                    getPercentIndicator(
                      ctx: context,
                      lectures: _lectures,
                    ),
                ],
              ),

              // Course status None / Enrolled / Complete
              if (course.isUserEnrolled)
                status(
                  ctx: context,
                  isComplete: course.completedDate != null,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
