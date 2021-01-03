import 'package:flutter/material.dart';

import '../../../../widgets/alert_modal.dart';

import '../../lecture/lecture_details.dart';
import '../../../../models/lecture.dart';
import '../../../../models/course.dart';

class LectureSummary extends StatelessWidget {
  final int index;
  final List<Lecture> lectures;
  final Course course;

  // Receiving selected lecture index + all lectures + categoryColor
  const LectureSummary({
    Key key,
    this.index,
    this.lectures,
    this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // navigate to Lecture details
    navigateToLecture(
      List<Lecture> lectures,
      int indexLecture,
    ) {
      Navigator.of(context).pushNamed(
        LectureDetails.routeName,
        // Sending arguments params: Course + All lectures + current lecture index
        arguments: {
          'course': course,
          'lectures': lectures,
          'index': indexLecture
        },
      );
    }

    // Lecture tap => check if User Enrolled to course + navigate to Lecture details
    onLectureTap(
      Course course,
      List<Lecture> lectures,
      int indexLecture,
    ) {
      // Check if course is enrolled
      if (course.isUserEnrolled) {
        navigateToLecture(lectures, indexLecture);
      } else {
        // if user is not enrolled: Show alert
        getAlertModal(
          ctx: context,
          isQuestion: false,
          title: 'You are not enrolled!',
          message: 'Please enroll first to access the content.',
        );
      }
    }

    // Saving the current lecture + category color
    Lecture _lecture = lectures[index];
    Color categoryColor = Color(int.parse(course.category.colorVal));

    //TODO do not allow user to load a lecture, unles he is ENROLLED to the course

    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: categoryColor.withOpacity(0.1),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // ID
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Text(
                '${index + 1}',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),

            //Title + minutes
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // width: sharedPrefs.deviceWidth - 80,
                    child: Text(
                      _lecture.title,
                      style: Theme.of(context).textTheme.headline3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                  ),
                  Text(
                    _lecture.urlVideo.isNotEmpty
                        ? 'Video - ${_lecture.duration.toString()} min'
                        : 'Article - ${_lecture.duration.toString()} min',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),

            // Lecture Status
            if (_lecture.isCompleted)
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Icon(
                  Icons.done,
                  color: Theme.of(context).accentColor,
                ),
              ),
          ],
        ),
      ),
      onTap: () => onLectureTap(course, lectures, index),
    );
  }
}
