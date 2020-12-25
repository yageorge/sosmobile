import 'package:flutter/material.dart';

import '../../../widgets/app_bar.dart';
import '../../../widgets/drawer/app_drawer.dart';

class CourseDetails extends StatefulWidget {
  static const routeName = '/course-details';

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // no drawer / show back button
      appBar: appBar(context, 'Course Name here'),
      body: Text('Courses full details + lectures'),
    );
  }
}
