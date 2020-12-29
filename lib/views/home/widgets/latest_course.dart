import 'package:flutter/material.dart';

import 'package:sosmobile/models/course.dart';
import 'package:sosmobile/models/lecture.dart';
import 'package:sosmobile/models/courseCategory.dart';

import '../../courses/list/widgets/course_view/course_summary.dart';

Widget getLatestCourse(
  BuildContext ctx,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 18.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Text(
            'LATEST',
            style: Theme.of(ctx).textTheme.headline6,
          ),
        ),
        CourseSummary(
          //TODO convert this hard-coded course, into a fetch method that gets the most recent course
          course: Course(
            id: 2,
            title: "Learn ReactJS Framework",
            description:
                "Learn ReactJS Framework and Dart Programming Language",
            imageUrl:
                "https://blog.wildix.com/wp-content/uploads/2020/06/react-logo.jpg",
            totalLectures: 66,
            totalMinutes: 124,
            points: 6,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            category: CourseCategory(
              id: 1,
              name: "Programming",
              colorVal: "0xFF0277BD",
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
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
                isComplete: false,
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
                isComplete: false,
              ),
            ],
            isUserEnrolled: true,
            isComplete: false,
          ),
        ),
      ],
    ),
  );
}
