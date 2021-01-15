import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../company/company_logo.dart';
import '../images/user/user_header.dart';
import '../../services/providers/auth_provider.dart';
import '../../services/providers/user_provider.dart';
import '../../models/user.dart';
import '../../widgets/navigation_bar/navigation_bar.dart';
import './widgets/drawer_tab.dart';

import '../../views/about/about.dart';
import '../../views/home/home.dart';
import '../../views/user_profile/user_profile.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider _authProvider = Provider.of<AuthProvider>(context);
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    User _user = _userProvider.user;

    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                // Drawer app bar
                AppBar(
                  title: Text('User Company Name'),
                  //false to never add a BACK button
                  automaticallyImplyLeading: false,
                ),

                // Current user details
                userHeader(
                  ctx: context,
                  user: _user,
                ),

                // Home Tab
                drawerTab(
                  ctx: context,
                  icon: Icons.home,
                  title: 'Home',
                  onTapFn: () {
                    Navigator.of(context).pushReplacementNamed(Home.routeName);
                  },
                ),

                // Modules
                drawerTab(
                  ctx: context,
                  icon: Icons.account_balance,
                  title: 'Modules',
                  onTapFn: () {
                    Navigator.of(context)
                        .pushReplacementNamed(NavigationBar.routeName);
                  },
                ),

                Divider(
                  thickness: 1,
                  color: Theme.of(context).primaryColor,
                ),

                // User Profile
                drawerTab(
                  ctx: context,
                  icon: Icons.account_box,
                  title: 'Profile',
                  onTapFn: () {
                    Navigator.of(context)
                        .pushReplacementNamed(UserProfile.routeName);
                  },
                ),

                //Logout Button
                drawerTab(
                  ctx: context,
                  icon: Icons.lock,
                  title: 'Logout',
                  onTapFn: () => _authProvider.logoutUser(context),
                ),

                //
                drawerTab(
                  ctx: context,
                  icon: Icons.info_outline,
                  title: 'About',
                  onTapFn: () {
                    Navigator.of(context).pushReplacementNamed(About.routeName);
                  },
                ),

                Divider(),

                // SOS Logo
                companyLogo(
                  height: 84,
                  width: 84,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
