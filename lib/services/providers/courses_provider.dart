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
    Course course,
  }) async {
    // API call
    final response = await coursesApi.enrollToCourse(userId, course.id);

    // on success
    if (response['success'] != null) {
      // update course isUserEnrolled locally:
      course.isUserEnrolled = true;

      // Update all courses - to render updated data in app
      await updateCoursesData();
    } else if (response['error'] != null) {
      // manage this error to user
      print('A problem occurred whith enrollUserToCourse');
    }
  }

  // Set Lecture isCompleted by current user
  Future<void> toggleIsLectureCompleted({
    int userId,
    Lecture lecture,
    bool value,
  }) async {
    // API call
    final response =
        await coursesApi.toggleIsLectureCompleted(userId, lecture.id, value);

    // on success
    if (response['success'] != null) {
      // update related lecture locally:
      lecture.isCompleted = value;

      // Update all courses - to render updated data in app
      await updateCoursesData();
    } else if (response['error'] != null) {
      // manage this error to user
      print('A problem occurred whith toggleIsLectureCompleted');
    }
  }
}
