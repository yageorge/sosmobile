import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/providers/user_provider.dart';
import '../../models/user.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/drawer/app_drawer.dart';
import '../../widgets/images/user/user_header.dart';
import '../../widgets/state_card.dart';

class UserProfile extends StatelessWidget {
  static const routeName = '/user_profile';
  @override
  Widget build(BuildContext context) {
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    User _user = _userProvider.user;

    return Scaffold(
      appBar: appBar(context, 'My Profile'),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                userHeader(
                  ctx: context,
                  user: _user,
                ),
                // User Target Points
                getStateCard(
                  ctx: context,
                  title: 'Target Points',
                  value: _user.pointsTarget,
                  image: 'assets/images/app/target_progress.png',
                  color: Colors.blue[900],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
