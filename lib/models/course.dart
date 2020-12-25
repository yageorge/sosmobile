import 'package:flutter/foundation.dart';
import '../models/lectures.dart';

class Course {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final int totalLectures;
  final int totalMinutes;
  final int points;
  final int categoryId;
  final String categoryName;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Lecture> lectures;

  Course({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.totalLectures,
    @required this.totalMinutes,
    @required this.points,
    @required this.categoryId,
    @required this.categoryName,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.lectures,
  });

  static List<Course> coursesData = <Course>[
    Course(
      id: 1,
      title: "Learn Flutter Framework",
      description: "Learn Flutter Framwork and Dart Programming Language",
      imageUrl: "https://flutter.dev/images/catalog-widget-placeholder.png",
      totalLectures: 46,
      totalMinutes: 234,
      points: 7,
      categoryId: 1,
      categoryName: "Programming",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      lectures: [
        Lecture(
          id: 1,
          title: "What is Flutter",
          content: "flutter detailssssss",
          urlVideo: "",
          duration: 18,
          courseId: 1,
          courseName: "Learn Flutter Framework",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Lecture(
          id: 1,
          title: "Install Flutter",
          content: "Install flutter detailssssss",
          urlVideo: "",
          duration: 26,
          courseId: 1,
          courseName: "Learn Flutter Framework",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ],
    ),
    Course(
      id: 2,
      title: "Learn ReactJS Framework",
      description: "Learn ReactJS Framwork and Dart Programming Language",
      imageUrl:
          "https://blog.wildix.com/wp-content/uploads/2020/06/react-logo.jpg",
      totalLectures: 66,
      totalMinutes: 124,
      points: 6,
      categoryId: 1,
      categoryName: "Programming",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      lectures: [
        Lecture(
          id: 3,
          title: "What is React JS",
          content: "React JS detailssssss",
          urlVideo: "",
          duration: 13,
          courseId: 2,
          courseName: "Learn ReactJS Framework",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Lecture(
          id: 4,
          title: "Install React JS",
          content: "Install React JS detailssssss",
          urlVideo: "",
          duration: 16,
          courseId: 1,
          courseName: "Learn React JS Framework",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ],
    ),
    Course(
      id: 4,
      title: "Communicate Better",
      description: "Communicate Better description etc etc",
      imageUrl:
          "https://zoetalentsolutions.com/wp-content/uploads/2017/04/Advanced-Communication-Skills-Training-Course.jpg",
      totalLectures: 9,
      totalMinutes: 14,
      points: 2,
      categoryId: 2,
      categoryName: "Social skills training",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      lectures: [
        Lecture(
          id: 5,
          title: "Type of Communications",
          content: "Communications detailssssss",
          urlVideo: "",
          duration: 8,
          courseId: 4,
          courseName: "Communicate Better",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Lecture(
          id: 6,
          title: "Improving Communications",
          content: "Improving Communications detailssssss",
          urlVideo: "",
          duration: 19,
          courseId: 4,
          courseName: "Communicate Better",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ],
    ),
    Course(
      id: 5,
      title: "Fire Safety Phase 1 / 24 Training",
      description: "Fire Safety Training description etc etc",
      imageUrl:
          "https://183263-537949-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/05/Fire-safety.jpg",
      totalLectures: 6,
      totalMinutes: 28,
      points: 2,
      categoryId: 3,
      categoryName: "Safety",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      lectures: [
        Lecture(
          id: 7,
          title: "Fire Safety details",
          content: "Fire Safety detailssssss",
          urlVideo: "",
          duration: 6,
          courseId: 5,
          courseName: "Fire Safety Training",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Lecture(
          id: 8,
          title: "How to run for your life",
          content: "How to run for your life detailssssss",
          urlVideo: "",
          duration: 11,
          courseId: 5,
          courseName: "Fire Safety Training",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ],
    ),
  ];
}
