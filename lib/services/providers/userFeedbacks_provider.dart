import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/userFeedback.dart';

class UserFeedBacksProvider with ChangeNotifier {
  //--------------- User Feedbacks STREAMS ---------------

  final CollectionReference userFeedbacksCollection =
      FirebaseFirestore.instance.collection('feedbacks');

  //Creating Feedbacks List from Feedback snapshot
  List<UserFeedback> _userFeedbacksListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserFeedback(
        docId: doc.id,
        courseId: doc.data()['courseId'] ?? 0,
        userId: doc.data()['userId'] ?? 0,
        userFullName: doc.data()['userFullName'] ?? '',
        userUrlImage: doc.data()['userUrlImage'] ?? '',
        content: doc.data()['content'] ?? '',
        addedAt: doc.data()['addedAt'] != null
            ? doc.data()['addedAt'].toDate()
            : null,
      );
    }).toList();
  }

  //get User Feedbacks Stream + running _userFeedbacksListFromSnapshot on every snapshot:
  Stream<List<UserFeedback>> get getUserFeedbacks {
    return userFeedbacksCollection
        .orderBy('addedAt', descending: true)
        .snapshots()
        .map(_userFeedbacksListFromSnapshot);
  }

  Future<void> addFeedback({
    int userId,
    int courseId,
    String userFullName,
    String content,
    String userUrlImage,
  }) async {
    userFeedbacksCollection.add({
      'userId': userId,
      'courseId': courseId,
      'userFullName': userFullName,
      'content': content,
      'userUrlImage': userUrlImage,
      'addedAt': Timestamp.now(),
    });
  }

  Future<void> deleteFeedback(
    String feedbackDocId,
  ) async {
    userFeedbacksCollection.doc(feedbackDocId).delete();
  }
}
