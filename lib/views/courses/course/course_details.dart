import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../widgets/app_bar.dart';
import '../widgets/course_image.dart';
import 'widgets/header.dart';
import 'widgets/properties.dart';
import 'widgets/enroll_button.dart';

import '../../../models/course.dart';
import '../../lectures/list/lectures.dart';

class CourseDetails extends StatelessWidget {
  static const routeName = '/course-details';

  @override
  Widget build(BuildContext context) {
    final course = ModalRoute.of(context).settings.arguments as Course;
    final category = course.category;
    final categoryColor = Color(int.parse(category.colorVal));

    return Scaffold(
      // no drawer / show back button
      appBar: appBar(context, 'Course'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Course image
                getCourseImage(
                  ratio: 3,
                  opacity: 0.9,
                  imageUrl: course.imageUrl,
                ),

                // Course name + category + date
                getHeader(
                  context,
                  course,
                  category,
                  categoryColor,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Enroll Button
                      getEnrollButton(
                        context,
                        course,
                      ),
                      // number of Lectures - minutes - points
                      getProperties(
                        context,
                        course,
                        categoryColor,
                      ),
                    ],
                  ),
                ),

                // Course lectures
                Lectures(
                  course: course,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
