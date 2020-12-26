import 'package:flutter/material.dart';

import '../../../services/sharedPrefs.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/drawer/app_drawer.dart';
import '../../../widgets/loading_indicator.dart';
import '../../../helpers/enums/coursesTabs.dart';

import './widgets/courses_list_view.dart';
import '../../../models/course.dart';

class Courses extends StatefulWidget {
  static const routeName = '/courses';

  final coursesTabs coursesTab;

  Courses(this.coursesTab);

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<Course> filteredCoursesData;

  // Filtering courses as All / Enrolled / Completed
  Future<List<Course>> filterCourses(List<Course> coursesData) async {
    List<Course> _filteredCoursesData = coursesData;

    if (widget.coursesTab == coursesTabs.enrolled) {
      // Filtering for enrolled courses only
      _filteredCoursesData =
          coursesData.where((Course course) => course.isUserEnrolled).toList();
    } else if (widget.coursesTab == coursesTabs.completed) {
      // Filtering for completed courses only
      _filteredCoursesData =
          coursesData.where((Course course) => course.isComplete).toList();
    }

    return _filteredCoursesData;
  }

  Future<bool> getCourses() async {
    // Delay test
    await Future<dynamic>.delayed(const Duration(milliseconds: 500));
    // Fetching hard coded Courses data
    filteredCoursesData = await filterCourses(Course.coursesData);

    return true;
  }

// need to fix appbar caption + filter courses as per enum
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: appBar(context, 'Courses'),
      body: FutureBuilder<bool>(
        future: getCourses(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator(
              ctx: context,
              deviceHeight: sharedPrefs.deviceHeight,
            );
          } else {
            return CoursesListView(
              coursesData: filteredCoursesData,
            );
          }
        },
      ),
    );
  }
}
