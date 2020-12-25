import 'package:flutter/material.dart';

import '../../../../widgets/app_bar.dart';
import '../../../../widgets/drawer/app_drawer.dart';

class CompletedCourses extends StatelessWidget {
  static const routeName = '/courses/completed';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: appBar(context, 'Completed Courses'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('ADD : List of All Completed courses '),
          ],
        ),
      ),
    );
  }
}
