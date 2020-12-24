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

  static Department department = Department(
    id: 1,
    name: "Software Developers",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}
