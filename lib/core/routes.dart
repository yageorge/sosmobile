import 'package:flutter/material.dart';

import '../helpers/enums/coursesTabs.dart';
import '../widgets/navigation_bar/navigation_bar.dart';

import '../views/auth/auth.dart';
import '../views/about/about.dart';
import '../views/home/home.dart';
import '../views/user_profile/user_profile.dart';
import '../views/userFeedbacks/feedbacks.dart';
import '../views/courses/list/courses.dart';
import '../views/courses/course/course_details.dart';
import '../views/lectures/lecture/lecture_details.dart';
import '../views/lectures/video/video_player.dart';

Map<String, Widget Function(BuildContext)> buildRoutes(BuildContext ctx) {
  return {
    Auth.routeName: (ctx) => Auth(),
    About.routeName: (ctx) => About(),
    Home.routeName: (ctx) => Home(),
    UserProfile.routeName: (ctx) => UserProfile(),
    NavigationBar.routeName: (ctx) => NavigationBar(),
    Courses.routeName: (ctx) => Courses(coursesTabs.all),
    CourseDetails.routeName: (ctx) => CourseDetails(),
    LectureDetails.routeName: (ctx) => LectureDetails(),
    VideoPlayer.routeName: (ctx) => VideoPlayer(),
    Feedbacks.routeName: (ctx) => Feedbacks(),
  };
}
