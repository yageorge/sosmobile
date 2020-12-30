import 'package:flutter/material.dart';

import 'package:sosmobile/services/sharedPrefs.dart';

// Course status Enrolled / Complete
Widget status({
  BuildContext ctx,
  bool isComplete,
}) {
  return Positioned(
    width: 32,
    height: 32,
    top: 0,
    left: sharedPrefs.deviceWidth - 64,
    child: Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Theme.of(ctx).primaryColor.withOpacity(0.8),
      ),
      child: Icon(
        isComplete ? Icons.done : Icons.widgets_outlined,
        color: Colors.white,
        size: 18,
      ),
    ),
  );
}
