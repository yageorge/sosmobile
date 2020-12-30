import 'package:flutter/material.dart';

import '../../services/sharedPrefs.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/drawer/app_drawer.dart';

import 'widgets/latest_course.dart';
import 'widgets/inprogress_course.dart';
import 'widgets/user_state_summary.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: appBar(context, 'Home'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Most recent course:
              getLatestCourse(context),

              // In Progress course:
              getInProgressCourse(context),

              // Total completed + total Points
              getUserStateSummary(
                ctx: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
