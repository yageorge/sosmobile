import 'package:flutter/material.dart';

import 'package:sosmobile/services/sharedPrefs.dart';

import '../../lecture/lecture_details.dart';
import '../../../../models/lectures.dart';

class LectureSummary extends StatelessWidget {
  final int index;
  final List<Lecture> lectures;
  final Color categoryColor;

  const LectureSummary({
    Key key,
    this.index,
    this.lectures,
    this.categoryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lecture tap => navigate to Lecture details
    onLectureTap(
      List<Lecture> lectures,
      int indexLecture,
    ) {
      Navigator.of(context).pushNamed(
        LectureDetails.routeName,
        arguments: {'lectures': lectures, 'index': indexLecture},
      );
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => LectureDetails(lectures, indexLecture)));
    }

    Lecture _lecture = lectures[index];
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
            if (_lecture.isComplete)
              Icon(
                Icons.done,
                color: Theme.of(context).accentColor,
              ),
          ],
        ),
      ),
      onTap: () => onLectureTap(lectures, index),
    );
  }
}
