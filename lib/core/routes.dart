import 'package:flutter/material.dart';

import '../views/auth/auth.dart';
import '../views/about/about.dart';
import '../views/home/home.dart';
import '../views/user_profile/user_profile.dart';
import '../widgets/navigation_bar/navigation_bar.dart';
import '../views/courses/list/courses/courses.dart';
import '../views/courses/list/completed/completed_courses.dart';
import '../views/courses/list/enrolled/enrolled_courses.dart';
import '../views/courses/course/courseDetails.dart';

import '../helpers/enums/coursesTabs.dart';

Map<String, Widget Function(BuildContext)> buildRoutes(BuildContext ctx) {
  return {
    Auth.routeName: (ctx) => Auth(),
    About.routeName: (ctx) => About(),
    Home.routeName: (ctx) => Home(),
    UserProfile.routeName: (ctx) => UserProfile(),
    NavigationBar.routeName: (ctx) => NavigationBar(),
    Courses.routeName: (ctx) => Courses(coursesTabs.all),
    CompletedCourses.routeName: (ctx) => CompletedCourses(),
    EnrolledCourses.routeName: (ctx) => EnrolledCourses(),
    CourseDetails.routeName: (ctx) => CourseDetails(),
  };
}
