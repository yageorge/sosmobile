import 'package:flutter/foundation.dart';

class CourseCategory {
  final int id;
  final String name;
  final String colorVal;
  final DateTime createdAt;
  final DateTime updatedAt;

  CourseCategory({
    @required this.id,
    @required this.name,
    @required this.colorVal,
    @required this.createdAt,
    @required this.updatedAt,
  });

  static List<CourseCategory> categoriesList = <CourseCategory>[
    CourseCategory(
      id: 1,
      name: "Programming",
      colorVal: "0xFF64DD17",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    CourseCategory(
      id: 2,
      name: "Social skills training",
      colorVal: "0xFF0277BD",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    CourseCategory(
      id: 3,
      name: "Safety",
      colorVal: "0xff9c27b0",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
}

// Convert Json category to CourseCategory Model
jsonToCourseCategory(Map<String, dynamic> jsonCategory) => CourseCategory(
      id: jsonCategory["id"] ?? null,
      name: jsonCategory["name"] ?? null,
      colorVal: jsonCategory["colorVal"] ?? null,
      createdAt: jsonCategory["created_at"] == null
          ? null
          : DateTime.parse(jsonCategory["created_at"]),
      updatedAt: jsonCategory["updated_at"] == null
          ? null
          : DateTime.parse(jsonCategory["updated_at"]),
    );
