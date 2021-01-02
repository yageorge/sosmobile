import 'package:flutter/material.dart';

import 'package:sosmobile/models/course.dart';
import 'package:sosmobile/models/lecture.dart';
import 'package:sosmobile/models/courseCategory.dart';

import '../../courses/list/course_summary.dart';

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
          child: Text('LATEST',
              style: Theme.of(ctx).textTheme.headline6.copyWith(
                    color: Colors.grey,
                  )),
        ),
        CourseSummary(
          //TODO convert this hard-coded course, into a fetch method that gets the most recent course
          course: Course(
            id: 2,
            title: "Learn ReactJS Framework",
            description:
                "Learn ReactJS Framework and Dart Programming Language",
            urlImage:
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
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                isCompleted: false,
              ),
              Lecture(
                id: 4,
                title: "Install React JS",
                content: "Install React JS detailssssss",
                urlVideo: "",
                duration: 16,
                courseId: 1,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                isCompleted: false,
              ),
            ],
            isUserEnrolled: true,
            completedDate: null,
          ),
        ),
      ],
    ),
  );
}
