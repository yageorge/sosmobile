import 'package:flutter/material.dart';

import 'package:sosmobile/services/sharedPrefs.dart';
import '../../../../models/lectures.dart';

class LectureView extends StatelessWidget {
  final int index;
  final Lecture lecture;
  final Color categoryColor;

  const LectureView({
    Key key,
    this.index,
    this.lecture,
    this.categoryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              '${index.toString()}',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ),

          //Title + minutes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: sharedPrefs.deviceWidth - 80,
                child: Text(
                  lecture.title,
                  style: Theme.of(context).textTheme.headline3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
              Text(
                lecture.urlVideo.isNotEmpty
                    ? 'Video - ${lecture.duration.toString()} min'
                    : 'Article - ${lecture.duration.toString()} min',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
