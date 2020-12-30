import 'package:flutter/material.dart';
import 'dart:convert';

import '../../models/course.dart';
import '../../models/courseCategory.dart';
import '../../models/lecture.dart';
import '../../services/api/courses_api.dart';

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

    fromJson(Map<String, dynamic> jsonCourse) => Course(
          id: jsonCourse["id"] ?? null,
          title: jsonCourse["title"] ?? null,
          description: jsonCourse["description"] ?? null,
          totalLectures: jsonCourse["totalLectures"] ?? null,
          totalMinutes: jsonCourse["totalMinutes"] ?? null,
          points: jsonCourse["points"] ?? null,
          createdAt: jsonCourse["created_at"] == null
              ? null
              : DateTime.parse(jsonCourse["created_at"]),
          updatedAt: jsonCourse["updated_at"] == null
              ? null
              : DateTime.parse(jsonCourse["updated_at"]),
          //To add the blow in laravel:
          category: CourseCategory(
            id: 1,
            name: "Programming",
            colorVal: "0xFF0277BD",
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
          imageUrl: "jhsdjhsjdsd",
          isComplete: true,
          isUserEnrolled: true,
          lectures: [
            Lecture(
              id: 3,
              title: "What is React JS",
              content: "React JS detailssssss",
              urlVideo: "",
              duration: 13,
              courseId: 2,
              courseName: "Learn ReactJS Framework",
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              isComplete: false,
            ),
            Lecture(
              id: 4,
              title: "Install React JS",
              content: "Install React JS detailssssss",
              urlVideo: "",
              duration: 16,
              courseId: 1,
              courseName: "Learn React JS Framework",
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              isComplete: false,
            ),
          ],
        );

    List<Course> jsonToCourses(String jsonData) {
      return List<Course>.from(
          json.decode(jsonData).map((course) => fromJson(course)));
    }

    _courses = jsonToCourses(response.body);
    // Notifying all _courses listeners
    notifyListeners();
  }
}
