import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Lecture {
  final int id;
  final String title;
  final String content;
  final String urlVideo;
  final int duration;
  final int courseId;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  Lecture({
    @required this.id,
    @required this.title,
    @required this.content,
    @required this.urlVideo,
    @required this.duration,
    @required this.courseId,
    @required this.isCompleted,
    @required this.createdAt,
    @required this.updatedAt,
  });
}

// Convert Json lecture to Lecture Model
jsonToLecture(Map<String, dynamic> jsonLecture) => Lecture(
      id: jsonLecture["id"] ?? 0,
      title: jsonLecture["title"] ?? '',
      content: jsonLecture["content"] ?? '',
      urlVideo: jsonLecture["urlVideo"] ?? '',
      duration: jsonLecture["duration"] ?? 0,
      courseId: jsonLecture["course_id"] ?? 0,
      createdAt: jsonLecture["created_at"] == null
          ? null
          : DateTime.parse(jsonLecture["created_at"]),
      updatedAt: jsonLecture["updated_at"] == null
          ? null
          : DateTime.parse(jsonLecture["updated_at"]),
      isCompleted: jsonLecture["isCompleted"] ?? null,
    );
