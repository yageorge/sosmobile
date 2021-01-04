import 'package:flutter/foundation.dart';

import './department.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final int pointsTarget;
  final Department department;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.pointsTarget,
    @required this.department,
    @required this.createdAt,
    @required this.updatedAt,
  });
}

// Json to User Model Data converter
jsonToUser({
  Map<String, dynamic> jsonUser,
  Map<String, dynamic> jsonDepartment,
}) =>
    User(
      id: jsonUser["id"] ?? 0,
      firstName: jsonUser["firstName"] ?? '',
      lastName: jsonUser["lastName"] ?? '',
      email: jsonUser["email"] ?? '',
      pointsTarget: jsonUser["pointsTarget"] ?? 0,
      createdAt: jsonUser["created_at"] == null
          ? null
          : DateTime.parse(jsonUser["created_at"]),
      updatedAt: jsonUser["updated_at"] == null
          ? null
          : DateTime.parse(jsonUser["updated_at"]),
      department:
          jsonDepartment == null ? null : jsonToDepartment(jsonDepartment),
    );
