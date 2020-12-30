import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/sharedPrefs.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/drawer/app_drawer.dart';
import '../../../widgets/loading_indicator.dart';
import '../../../helpers/enums/coursesTabs.dart';

import '../../../services/providers/courses_provider.dart';

import 'courses_list_view.dart';
import '../../../models/course.dart';

class Courses extends StatefulWidget {
  static const routeName = '/courses';

  // constructor enum for coursesTab name (All/InProgress/Compelted)
  final coursesTabs coursesTab;

  Courses(this.coursesTab);

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<Course> courses;
  List<Course> filteredCoursesData;

  // Filtering courses as All / InProgress / Completed
  Future<List<Course>> filterCourses(List<Course> coursesData) async {
    List<Course> _filteredCoursesData = coursesData;

    if (widget.coursesTab == coursesTabs.inProgress) {
      // Filtering for In Progress courses only
      _filteredCoursesData = coursesData
          .where((Course course) => course.isUserEnrolled && !course.isComplete)
          .toList();
    } else if (widget.coursesTab == coursesTabs.completed) {
      // Filtering for completed courses only
      _filteredCoursesData =
          coursesData.where((Course course) => course.isComplete).toList();
    }

    return _filteredCoursesData;
  }

  // Fetching Courses
  Future<bool> getCourses() async {
    print('Future<bool> getCourses() async {');

    // Fetching hard coded Courses data
    filteredCoursesData = await filterCourses(Course.coursesData);

    return true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // to avoid fetching data with apis everytime i change the tab / better to get data here, and remove futurebuilder
    //  await coursesProvider.updateCoursesData();
    print('void didChangeDependencies() {');
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
