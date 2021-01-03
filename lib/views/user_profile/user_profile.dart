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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                userHeader(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
