import 'package:flutter/material.dart';

import '../../services/api/courses_api.dart';
import '../../models/course.dart';
import '../../models/lecture.dart';

class CoursesProvider with ChangeNotifier {
  final CoursesApi coursesApi = CoursesApi();

  List<Course> _courses = [];

  //sending history Scores
  List<Course> get coursesData {
    return [..._courses];
  }

  // Get courses data from server
  Future<void> updateCoursesData() async {
    print(' Future<void> updateCoursesData() async {');
    // API get call
    final response = await coursesApi.getCourses();
    // Converting response to Course
    _courses = jsonToCourses(response.body);

    // Notifying all _courses listeners
    notifyListeners();
  }

  // Enroll current user to a course
  Future<void> enrollUserToCourse({
    int userId,
    int courseId,
  }) async {
    // API call
    final response = await coursesApi.enrollToCourse(userId, courseId);

    // on success
    if (response['success'] != null) {
      await updateCoursesData();
    } else if (response['error'] != null) {
      // manage this error to user
      print('A problem occurred whith enrollUserToCourse');
    }
  }

  // Set Lecture isCompleted by current user
  Future<void> toggleIsLectureCompleted({
    int userId,
    int courseId,
    int lectureId,
    bool value,
  }) async {
    // API call
    final response =
        await coursesApi.toggleIsLectureCompleted(userId, lectureId, value);

    // on success
    if (response['success'] != null) {
      // Maybe no need to updateCoursesData(); and leave it to complete refresh/fetch
      // await updateCoursesData();
      //TODO update bool value in Flutter models:
      Course course = _courses.firstWhere((course) => course.id == courseId);
      List<Lecture> lectures = course.lectures;
      Lecture lecture =
          lectures.firstWhere((lecture) => lecture.id == lectureId);
      print('lecture toupdate: ${lecture.isCompleted}');
      lecture.isCompleted = value;
      print('lecture UPDATED: ${lecture.isCompleted}');
// ABOVE IS WORKING - MODIFY TO MOVE IT MAYBE TO LECTURE MODEL LOGIC

    } else if (response['error'] != null) {
      // manage this error to user
      print('A problem occurred whith toggleIsLectureCompleted');
    }
  }
}
