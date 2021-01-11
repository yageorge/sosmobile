import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/userFeedback.dart';
import 'feedback_item.dart';

class FeedbacksList extends StatelessWidget {
  final int courseId;

  const FeedbacksList({
    Key key,
    this.courseId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _usersFeedbacks = Provider.of<List<UserFeedback>>(context);

    final _filteredFeedbacks = _usersFeedbacks
        .where((UserFeedback feedback) => feedback.courseId == courseId)
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (_filteredFeedbacks.length == 0)
            ? Container(
                padding: EdgeInsets.all(14),
                child: Text(
                  'No Feedbacks yet!\nStart by adding one yourself ...',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ))
            : ListView.builder(
                itemCount: _filteredFeedbacks.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, i) {
                  return feedbackItem(
                    ctx: context,
                    feedback: _usersFeedbacks[i],
                  );
                },
              ),
      ],
    );
  }
}
