import 'package:flutter/material.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/drawer/app_drawer.dart';
import '../../widgets/company/company_logo_container.dart';

class About extends StatelessWidget {
  static const routeName = '/about';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'About'),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // SOS Logo and Details
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: companyLogoContainer(context),
                ),
                Center(
                  child: Text('Managed by Skill Optimizer Solutions'),
                ),
                Center(
                  child: Text('Developed by George Yaacoub'),
                ),
                Center(
                  child: Text('+961 71 747740'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
