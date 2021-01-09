import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/providers/user_provider.dart';
import '../../services/providers/courses_provider.dart';
import '../../services/sharedPrefs.dart';
import '../../models/user.dart';
import '../../models/course.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/drawer/app_drawer.dart';
import '../../widgets/loading_indicator.dart';
import 'widgets/latest_course.dart';
import 'widgets/inprogress_course.dart';
import 'widgets/user_state_summary.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    CoursesProvider _coursesProvider =
        Provider.of<CoursesProvider>(context, listen: false);
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    User _user = _userProvider.user;
    List<Course> _courses;

    // Fetching Courses
    Future<void> getCourses() async {
      await _coursesProvider.updateCoursesData();
      _courses = _coursesProvider.coursesData;
      return true;
    }

    return Scaffold(
      drawer: AppDrawer(),
      appBar: appBar(context, 'Home'),
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
              onRefresh: () => getCourses(),
              backgroundColor: Theme.of(context).primaryColor,
              color: Theme.of(context).accentColor,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Most recent course:
                      getLatestCourse(
                        ctx: context,
                        // courses are sorted by laravel, [0] is always the latest
                        course: _courses[0],
                      ),

                      // In Progress course:
                      getInProgressCourse(
                        ctx: context,
                        courses: _courses,
                      ),

                      // Total completed + total Points
                      getUserStateSummary(
                        ctx: context,
                        user: _user,
                        courses: _courses,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
