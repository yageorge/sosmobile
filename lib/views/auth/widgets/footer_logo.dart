import 'package:flutter/material.dart';

import '../../../widgets/company/company_logo.dart';

Widget getFooterLogo(BuildContext ctx) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(86),
      bottomLeft: Radius.circular(86),
    ),
    child: Container(
      height: 74,
      width: (MediaQuery.of(ctx).size.width - 72) > 176
          ? MediaQuery.of(ctx).size.width - 72
          : 176,
      decoration: BoxDecoration(
        color: Theme.of(ctx).primaryColor.withOpacity(1),
      ),
      padding: EdgeInsets.all(4),
      child: companyLogo(
        height: 74,
        width: 74,
      ),
    ),
  );
}
