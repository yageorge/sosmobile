import 'package:flutter/material.dart';

import 'package:sosmobile/models/course.dart';
import 'package:sosmobile/models/lecture.dart';
import 'package:sosmobile/models/courseCategory.dart';

import '../../courses/list/course_summary.dart';

Widget getInProgressCourse(
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
            'In Progress',
            style: Theme.of(ctx).textTheme.headline6.copyWith(
                  color: Colors.grey,
                ),
          ),
        ),
        CourseSummary(
          //TODO convert this hard-coded course, into a fetch method that gets the most recent course
          course: Course(
            id: 5,
            title: "Fire Safety Phase 1 / 24 Training",
            description: "Fire Safety Training description etc etc",
            urlImage:
                "https://183263-537949-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/05/Fire-safety.jpg",
            totalLectures: 6,
            totalMinutes: 28,
            points: 2,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            category: CourseCategory(
              id: 3,
              name: "Safety",
              colorVal: "0xff9c27b0",
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
            lectures: [
              Lecture(
                id: 7,
                title: "Fire Safety details",
                content: "Fire Safety detailssssss",
                urlVideo: "",
                duration: 6,
                courseId: 5,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                isComplete: false,
              ),
              Lecture(
                id: 8,
                title: "How to run for your life",
                content: "How to run for your life detailssssss",
                urlVideo: "",
                duration: 11,
                courseId: 5,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                isComplete: false,
              ),
            ],
            isUserEnrolled: false,
            completedDate: null,
          ),
        ),
      ],
    ),
  );
}
