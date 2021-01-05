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
  List<Course> filteredCourses;
  bool _initRun = true; // used to fetch data only on this class init

  // Filtering courses as All / InProgress / Completed
  Future<List<Course>> filterCourses(List<Course> coursesData) async {
    List<Course> _filteredCourses = coursesData;

    if (widget.coursesTab == coursesTabs.inProgress) {
      // Filtering for In Progress courses only
      _filteredCourses = coursesData
          .where((Course course) =>
              course.isUserEnrolled && course.completedDate == null)
          .toList();
    } else if (widget.coursesTab == coursesTabs.completed) {
      // Filtering for completed courses only
      _filteredCourses = coursesData
          .where((Course course) => course.completedDate != null)
          .toList();
    }

    return _filteredCourses;
  }

  // Fetching Courses
  Future<void> getCourses() async {
    // only fetch data on init / where _initRun == true
    if (_initRun) {
      await _coursesProvider.updateCoursesData();
      courses = _coursesProvider.coursesData;
      _initRun = false;
    }
    filteredCourses = await filterCourses(courses);
    return true;
  }

  // pullRefresh
  Future<void> pullRefresh() async {
    // Setting _initRun true for getCourses to refresh courses
    _initRun = true;
    await getCourses();
  }

  //TODO Notes pending: ---------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    _coursesProvider = Provider.of<CoursesProvider>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: appBar(context, 'Courses'),
      body: FutureBuilder(
        future: getCourses(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator(
              ctx: context,
              deviceHeight: sharedPrefs.deviceHeight,
            );
          } else {
            // Pull down on screen to refresh Data indicator
            return RefreshIndicator(
              onRefresh: () => pullRefresh(),
              backgroundColor: Theme.of(context).primaryColor,
              color: Theme.of(context).accentColor,
              child: CoursesListView(
                coursesData: filteredCourses,
              ),
            );
          }
        },
      ),
    );
  }
}
