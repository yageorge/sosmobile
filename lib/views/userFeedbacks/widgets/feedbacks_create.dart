import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/providers/userFeedbacks_provider.dart';
import '../../../services/providers/user_provider.dart';
import '../../../models/course.dart';
import '../../../models/user.dart';

class FeedbacksCreate extends StatefulWidget {
  final Course course;

  const FeedbacksCreate({
    Key key,
    this.course,
  }) : super(key: key);

  @override
  _FeedbacksCreateState createState() => _FeedbacksCreateState();
}

class _FeedbacksCreateState extends State<FeedbacksCreate> {
  final _contentController = TextEditingController();
  bool _validated = true;

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  void _submitFeedback(
    UserFeedBacksProvider userFeedbackProvider,
    User user,
  ) async {
    //if amount is empty, quit, so transaction is not added
    if (_contentController.text.isEmpty) {
      setState(() {
        _validated = false;
      });
      return;
    }
    final String newFeedbackContent = _contentController.text;

    // Adding new feedback to Firestore
    await userFeedbackProvider.addFeedback(
      userId: user.id,
      userFullName: user.firstName + ' ' + user.lastName,
      userUrlImage: user.urlImage,
      courseId: widget.course.id,
      content: newFeedbackContent,
    );

    _contentController.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final _userFeedbackProvider = Provider.of<UserFeedBacksProvider>(context);
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    User _user = _userProvider.user;

    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            //using viewinsets.bottom size (keyboard or anything jumping from the bottom + 10
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Your Feedback',
                  errorText: !_validated ? 'Please add some content!' : null,
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).accentColor,
                  ),
                  fillColor: Colors.red,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.teal)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 1, color: Colors.teal)),
                ),
                style: Theme.of(context).textTheme.headline5,
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                controller: _contentController,
                onChanged: (_) {
                  setState(() {
                    _validated = true;
                  });
                },
                onSubmitted: (_) {},
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () => _submitFeedback(_userFeedbackProvider, _user),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
