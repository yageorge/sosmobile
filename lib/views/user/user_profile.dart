import 'package:flutter/material.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/drawer/app_drawer.dart';
import '../../widgets/images/user/user_header.dart';

class UserProfile extends StatelessWidget {
  static const routeName = '/user_profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'My Profile'),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: [
                userHeader(context),
                Text('Some other info about the user OR company'),
                Text(
                    'Statistics about NBRE of completed courses / Points obtained ...'),
                Text('some settings'),
                Text('Link to change Password'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
