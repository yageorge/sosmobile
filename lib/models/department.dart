import 'package:flutter/foundation.dart';

class Department {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  Department({
    @required this.id,
    @required this.name,
    @required this.createdAt,
    @required this.updatedAt,
  });
}

// Convert Json department to Department Model
jsonToDepartment(Map<String, dynamic> jsonDepartment) => Department(
      id: jsonDepartment['id'] ?? 0,
      name: jsonDepartment['name'] ?? '',
      createdAt: jsonDepartment['created_at'] == null
          ? null
          : DateTime.parse(jsonDepartment['created_at']),
      updatedAt: jsonDepartment['updated_at'] == null
          ? null
          : DateTime.parse(jsonDepartment['updated_at']),
    );
