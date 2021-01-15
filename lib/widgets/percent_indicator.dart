import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../models/lecture.dart';

Widget getPercentIndicator({
  BuildContext ctx,
  List<Lecture> lectures,
}) {
  // Calculate percent values:
  Map<String, Object> result = calculateValues(lectures);

  return Padding(
    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
    child: percentIndicator(
      ctx: ctx,
      percent: result['percent'],
      value: result['value'],
    ),
  );
}

// Function to calculate the percentage and the value
Map<String, Object> calculateValues(List<Lecture> lectures) {
  double percent = 0;
  String value = "";
  int totalLectures = lectures.length;
  int completedLectures = 0;

  lectures.forEach((lecture) {
    if (lecture.isCompleted) completedLectures++;
  });

  percent =
      double.parse((completedLectures / totalLectures).toStringAsFixed(2));
  value = ((percent * 100).toStringAsFixed(0) + "%");

  return {'percent': percent, 'value': value};
}

Widget percentIndicator({
  BuildContext ctx,
  double percent,
  String value,
}) {
  return LinearPercentIndicator(
    lineHeight: 14.0,
    percent: percent,
    center: Text(
      value,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    linearStrokeCap: LinearStrokeCap.roundAll,
    backgroundColor: Colors.grey,
    progressColor: Theme.of(ctx).primaryColor,
  );
}
