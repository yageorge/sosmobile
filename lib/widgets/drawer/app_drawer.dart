import 'package:flutter/material.dart';

import '../company/company_logo.dart';

import './widgets/drawer_tab.dart';
import '../images/user/user_header.dart';

import '../../views/auth/auth.dart';
import '../../views/about/about.dart';
import '../../views/home/home.dart';
import '../../views/user_profile/user_profile.dart';
import '../../widgets/navigation_bar/navigation_bar.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                userHeader(context),

                // Home Tab
                drawerTab(
                  ctx: context,
                  icon: Icons.home,
                  title: 'Home',
                  onTapFn: () {
                    Navigator.of(context).pushReplacementNamed(Home.routeName);
                  },
                ),

                // Courses
                drawerTab(
                  ctx: context,
                  icon: Icons.account_balance,
                  title: 'My Courses',
                  onTapFn: () {
                    Navigator.of(context)
                        .pushReplacementNamed(NavigationBar.routeName);
                  },
                ),

                // Connect
                drawerTab(
                  ctx: context,
                  icon: Icons.connect_without_contact,
                  title: 'Connect',
                  onTapFn: () {},
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
                  onTapFn: () {
                    Navigator.of(context).pushReplacementNamed(Auth.routeName);
                  },
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
                  height: 64,
                  width: 64,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
