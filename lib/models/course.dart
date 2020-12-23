import 'package:flutter/foundation.dart';

class Course {
  final int id;
  final String title;
  final String description;
  final int totalLectures;
  final int totalMinutes;
  final int points;
  final int categoryId;
  final String categoryName;
  final DateTime createdAt;
  final DateTime updatedAt;

  Course({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.totalLectures,
    @required this.totalMinutes,
    @required this.points,
    @required this.categoryId,
    @required this.categoryName,
    @required this.createdAt,
    @required this.updatedAt,
  });

  static List<Course> courseList = <Course>[
    Course(
      id: 1,
      title: "Learn Flutter Framework",
      description: "Learn Flutter Framwork and Dart Programming Language",
      totalLectures: 46,
      totalMinutes: 234,
      points: 7,
      categoryId: 1,
      categoryName: "Programming",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    Course(
      id: 2,
      title: "Learn ReactJS Framework",
      description: "Learn ReactJS Framwork and Dart Programming Language",
      totalLectures: 66,
      totalMinutes: 124,
      points: 6,
      categoryId: 1,
      categoryName: "Programming",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    Course(
      id: 3,
      title: "Learn Laravel Framework",
      description: "Learn Laravel Framwork and Dart Programming Language",
      totalLectures: 29,
      totalMinutes: 334,
      points: 9,
      categoryId: 1,
      categoryName: "Programming",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
}
