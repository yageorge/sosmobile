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
}

// Convert Json category to CourseCategory Model
jsonToCourseCategory(Map<String, dynamic> jsonCategory) => CourseCategory(
      id: jsonCategory['id'] ?? 0,
      name: jsonCategory['name'] ?? '',
      colorVal: jsonCategory['colorVal'] ?? '',
      createdAt: jsonCategory['created_at'] == null
          ? null
          : DateTime.parse(jsonCategory['created_at']),
      updatedAt: jsonCategory['updated_at'] == null
          ? null
          : DateTime.parse(jsonCategory['updated_at']),
    );
