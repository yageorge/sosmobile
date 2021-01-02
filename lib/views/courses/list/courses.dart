import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/providers/courses_provider.dart';
import '../../../services/sharedPrefs.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/drawer/app_drawer.dart';
import '../../../widgets/loading_indicator.dart';
import '../../../helpers/enums/coursesTabs.dart';

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
  CoursesProvider _coursesProvider;
  List<Course> courses;
  List<Course> filteredCoursesData;
  bool _initRun = true; // used to fetch data only on this class init

  // Filtering courses as All / InProgress / Completed
  Future<List<Course>> filterCourses(List<Course> coursesData) async {
    List<Course> _filteredCoursesData = coursesData;

    if (widget.coursesTab == coursesTabs.inProgress) {
      // Filtering for In Progress courses only
      _filteredCoursesData = coursesData
          .where((Course course) =>
              course.isUserEnrolled && course.completedDate == null)
          .toList();
    } else if (widget.coursesTab == coursesTabs.completed) {
      // Filtering for completed courses only
      _filteredCoursesData = coursesData
          .where((Course course) => course.completedDate != null)
          .toList();
    }

    return _filteredCoursesData;
  }

  // Fetching Courses
  Future<bool> getCourses() async {
    // only fetch data on init / where _initRun == true
    if (_initRun) {
      print('Future<bool> getCourses() async {');
      await _coursesProvider.updateCoursesData();
      courses = _coursesProvider.getCoursesData();
      _initRun = false;
    }
    filteredCoursesData = await filterCourses(courses);
    return true;
  }

  //TODO Notes pending: ----------------------------------------------------------------------------------
  // Enroll button working, but need to reload all courses tab for a refresh, button wont refresh on tap

  @override
  Widget build(BuildContext context) {
    _coursesProvider = Provider.of<CoursesProvider>(context);

    print('courses build RAN RAN');
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
