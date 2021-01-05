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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: companyLogoContainer(context),
            ),
            Text(
              'Skill Optimizer',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Digital Learning Platform',
              style: Theme.of(context).textTheme.headline5,
            ),
            Divider(
              height: 92,
            ),
            Text(
              'Copyright © 2021 Skill Optimizer \n By George Yaacoub',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            Text(
              '+961 71 747740',
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
