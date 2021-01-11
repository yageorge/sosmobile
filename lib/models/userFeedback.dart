import 'package:flutter/foundation.dart';

class UserFeedback {
  final String docId;
  final int userId;
  final String userFullName;
  final String userUrlImage;
  final int courseId;
  final String content;
  final DateTime addedAt;

  UserFeedback({
    @required this.docId,
    @required this.userId,
    @required this.userFullName,
    @required this.userUrlImage,
    @required this.courseId,
    @required this.content,
    @required this.addedAt,
  });
}
