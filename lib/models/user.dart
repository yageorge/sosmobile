import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final int pointsTarget;
  final int departmentId;
  final String departmentName;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.pointsTarget,
    @required this.departmentId,
    @required this.departmentName,
    @required this.createdAt,
    @required this.updatedAt,
  });

  static User user = User(
    id: 1,
    firstName: "George",
    lastName: "Yaacoub",
    email: "gyaacoub@gmail.com",
    pointsTarget: 28,
    departmentId: 1,
    departmentName: "Software Developers",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}
