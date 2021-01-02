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

// Get data from server
  Future<void> updateCoursesData() async {
    // API get call
    final response = await coursesApi.getCourses();
    print('updateCoursesData() response: ${response.body}');
    // Converting response to Course
    _courses = jsonToCourses(response.body);

    // Notifying all _courses listeners
    notifyListeners();
  }
}
