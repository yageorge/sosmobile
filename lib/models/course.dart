import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'courseCategory.dart';
import 'lecture.dart';

class Course {
  final int id;
  final String title;
  final String description;
  final String urlImage;
  final int totalLectures;
  final int totalMinutes;
  final int points;
  final DateTime createdAt;
  final DateTime updatedAt;
  final CourseCategory category;
  final List<Lecture> lectures;
  final bool isUserEnrolled;
  final DateTime completedDate;

  Course({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.urlImage,
    @required this.totalLectures,
    @required this.totalMinutes,
    @required this.points,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.category,
    @required this.lectures,
    @required this.isUserEnrolled,
    @required this.completedDate,
  });
}

// Json to Course Model Data converter
jsonToCourse(Map<String, dynamic> jsonCourse) => Course(
      id: jsonCourse["id"] ?? 0,
      title: jsonCourse["title"] ?? '',
      description: jsonCourse["description"] ?? '',
      totalLectures: jsonCourse["totalLectures"] ?? 0,
      totalMinutes: jsonCourse["totalMinutes"] ?? 0,
      points: jsonCourse["points"] ?? 0,
      urlImage: jsonCourse["urlImage"] ?? '',
      isUserEnrolled: jsonCourse["isUserEnrolled"] ?? false,
      completedDate: jsonCourse["completedDate"] == null
          ? null
          : DateTime.parse(jsonCourse["completedDate"]),
      createdAt: jsonCourse["created_at"] == null
          ? null
          : DateTime.parse(jsonCourse["created_at"]),
      updatedAt: jsonCourse["updated_at"] == null
          ? null
          : DateTime.parse(jsonCourse["updated_at"]),
      category: jsonCourse["category"] == null
          ? null
          : jsonToCourseCategory(jsonCourse["category"]),
      lectures: jsonCourse["lectures"] == null
          ? null
          : List<Lecture>.from(
              jsonCourse["lectures"].map((lecture) => jsonToLecture(lecture))),
    );

List<Course> jsonToCourses(String jsonData) {
  return List<Course>.from(
      json.decode(jsonData).map((course) => jsonToCourse(course)));
}
