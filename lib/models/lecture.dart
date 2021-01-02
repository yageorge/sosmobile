import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Lecture {
  final int id;
  final String title;
  final String content;
  final String urlVideo;
  final int duration;
  final int courseId;
  final bool isComplete;
  final DateTime createdAt;
  final DateTime updatedAt;

  Lecture({
    @required this.id,
    @required this.title,
    @required this.content,
    @required this.urlVideo,
    @required this.duration,
    @required this.courseId,
    @required this.isComplete,
    @required this.createdAt,
    @required this.updatedAt,
  });
}
