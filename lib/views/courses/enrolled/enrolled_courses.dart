import 'package:flutter/material.dart';

import '../../../widgets/app_bar.dart';
import '../../../widgets/drawer/app_drawer.dart';

class EnrolledCourses extends StatelessWidget {
  static const routeName = '/courses/enrolled';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: appBar(context, 'Enrolled Courses'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('ADD : List of All Enrolled courses '),
          ],
        ),
      ),
    );
  }
}
