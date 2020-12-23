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
