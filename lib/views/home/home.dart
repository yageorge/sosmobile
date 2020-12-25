import 'package:flutter/material.dart';

import '../../services/sharedPrefs.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/drawer/app_drawer.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: appBar(context, 'Home'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(' device Width: ${sharedPrefs.deviceWidth}'),
            Text(' device Width: ${sharedPrefs.deviceHeight}'),
            Text('ADD : NEW COURSES Section '),
            Text('ADD : CURRENT ONGOING COURSES Section / Resume Course'),
          ],
        ),
      ),
    );
  }
}
