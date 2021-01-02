import 'package:flutter/material.dart';

import '../../services/api/courses_api.dart';
import '../../models/course.dart';

class CoursesProvider with ChangeNotifier {
  final CoursesApi coursesApi = CoursesApi();

  List<Course> _courses = [];

  //sending history Scores
  List<Course> getCoursesData() {
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

    // on success Enrollment
    if (response['success']) {
      await updateCoursesData();
    }
  }

  // Set Lecture isCompleted by current user
  Future<void> toggleIsLectureCompleted({
    int userId,
    int lectureId,
    bool value,
  }) async {
    // API call
    final response =
        await coursesApi.toggleIsLectureCompleted(userId, lectureId, value);

    // on success Enrollment
    if (response['success']) {
      await updateCoursesData();
    }
  }
}
