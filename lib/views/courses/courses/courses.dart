import 'package:flutter/material.dart';

import '../../../widgets/app_bar.dart';
import '../../../widgets/drawer/app_drawer.dart';

class Courses extends StatelessWidget {
  static const routeName = '/courses';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: appBar(context, 'My Courses'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('ADD : List of All courses '),
          ],
        ),
      ),
    );
  }
}
