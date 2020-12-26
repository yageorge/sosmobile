import 'package:flutter/material.dart';

import '../../../widgets/app_bar.dart';
import '../../../models/lectures.dart';

class LectureDetails extends StatefulWidget {
  static const routeName = '/lecture';

  @override
  _LectureDetailsState createState() => _LectureDetailsState();
}

class _LectureDetailsState extends State<LectureDetails> {
  @override
  Widget build(BuildContext context) {
    // Retrieving Lectures + current lecture index as args
    final args = ModalRoute.of(context).settings.arguments as Map;
    List<Lecture> lectures = args['lectures'];
    print('rerunnnnn');
    int index = args['index'];

// problem is: index is reloading everytime in build
// need to receive it in state , can try again receiving it as constructor

    void nextLecture() {
      setState(() {
        print('before: $index');
        index = index + 1;
        print('after: $index');
      });
    }

    return Scaffold(
      // no drawer / show back button
      appBar: appBar(context, 'Lecture'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title: ${lectures[index].title}'),
                Text('Content: ${lectures[index].content}'),
                Text('url video: ${lectures[index].urlVideo}'),
                RaisedButton(
                  child: Text('next'),
                  onPressed: () => nextLecture(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
