import 'package:flutter/material.dart';

import '../../../widgets/app_bar.dart';
import '../../../widgets/drawer/app_drawer.dart';

import './widgets/courses_list_view.dart';
import '../../../models/course.dart';

class Courses extends StatefulWidget {
  static const routeName = '/courses';

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<Course> coursesData;

  Future<bool> getCourses() async {
    // Delay test
    await Future<dynamic>.delayed(const Duration(milliseconds: 500));
    // Fetching hard coded Courses data
    coursesData = Course.coursesData;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: appBar(context, 'My Courses'),
      body: FutureBuilder<bool>(
        future: getCourses(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return CoursesListView(
              coursesData: coursesData,
            );
          }
        },
      ),
    );
  }
}
