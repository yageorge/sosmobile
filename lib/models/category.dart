import 'package:flutter/foundation.dart';

class Category {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    @required this.id,
    @required this.name,
    @required this.createdAt,
    @required this.updatedAt,
  });

  static List<Category> categoriesList = <Category>[
    Category(
      id: 1,
      name: "Programming",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    Category(
      id: 2,
      name: "Social skills training",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    Category(
      id: 3,
      name: "Safety",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
}
