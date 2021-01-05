import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../../services/providers/courses_provider.dart';
import '../../../services/sharedPrefs.dart';
import '../../../widgets/app_bar.dart';
import '../widgets/course_image.dart';
import 'widgets/header.dart';
import 'widgets/properties.dart';
import 'widgets/enroll_button.dart';

import '../../../models/course.dart';
import '../../lectures/list/lectures.dart';

class CourseDetails extends StatefulWidget {
  static const routeName = '/course-details';

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    CoursesProvider _coursesProvider = Provider.of<CoursesProvider>(context);
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
                  urlImage: course.urlImage,
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
                          ctx: context,
                          coursesProvider: _coursesProvider,
                          course: course,
                          userId: sharedPrefs.userId,
                          callBack: () {
                            // setState to refresh the isComplete boolean
                            setState(() {});
                          }),

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
