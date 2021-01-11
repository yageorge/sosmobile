import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../models/userFeedback.dart';
import '../../../services/sharedPrefs.dart';
import '../../../services/providers/userFeedbacks_provider.dart';
import '../../../widgets/alert_modal.dart';
import '../../../widgets/notification_snackBar.dart';

Widget feedbackItem({
  BuildContext ctx,
  UserFeedback feedback,
}) {
  final _userFeedbackProvider = Provider.of<UserFeedBacksProvider>(ctx);
  final bool isCurrentUser = sharedPrefs.userId == feedback.userId;
  return Dismissible(
    key: ValueKey(feedback.docId),
    background: Container(
      color: Colors.red[800],
      child: Icon(
        Icons.remove_circle,
        color: Colors.white,
        size: 40,
      ),
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(
        right: 20,
      ),
    ),
    direction: DismissDirection.endToStart,
    confirmDismiss: (direction) {
      if (isCurrentUser) {
        return getAlertModal(
            ctx: ctx,
            title: 'Are you sure?!',
            message: 'Delete this feedback?',
            isQuestion: true);
      }
      return getAlertModal(
          ctx: ctx,
          title: 'Oups!',
          message: 'Is this feedback yours?',
          isQuestion: false);
    },
    onDismissed: (direction) async {
      // Deleting Feedback:
      await _userFeedbackProvider.deleteFeedback(feedback.docId);
      notificationSnackBar(ctx, 'Feedback deleted!');
    },
    child: Stack(
      //overflow.visible to make sure any element in this Stack is always visible
      overflow: Overflow.visible,
      children: [
        Row(
          // Align my feedbacks to the end
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: isCurrentUser
                    ? Theme.of(ctx).primaryColor.withOpacity(0.6)
                    : Theme.of(ctx).primaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(12),
                ),
              ),
              width: sharedPrefs.deviceWidth - 48,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // User full name info
                  Text(
                    feedback.userFullName,
                    style: Theme.of(ctx).textTheme.headline3.copyWith(
                          color: Colors.blue[400],
                        ),
                  ),

                  // Content
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      feedback.content,
                      style: Theme.of(ctx).textTheme.headline3,
                      textAlign: TextAlign.start,
                    ),
                  ),

                  // Added date
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${DateFormat.yMMMd().format(feedback.addedAt)}',
                      style: Theme.of(ctx).textTheme.headline1,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // User Avatar
        Positioned(
          top: -6,
          left: null,
          right: 22,
          child: Center(
            child: CircleAvatar(
              backgroundColor: isCurrentUser
                  ? Theme.of(ctx).accentColor
                  : Theme.of(ctx).primaryColor,
              radius: isCurrentUser ? 24 : 22,
              child: CircleAvatar(
                radius: isCurrentUser ? 20 : 18,
                backgroundImage: NetworkImage(
                  feedback.userUrlImage,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
