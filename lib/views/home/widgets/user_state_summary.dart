import 'package:flutter/material.dart';

Widget getUserStateSummary(
  BuildContext ctx,
) {
  return Stack(children: [
    Container(
      padding: const EdgeInsets.only(bottom: 18.0),
      width: 126,
      height: 116,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(22.0)),
            child: Image.asset(
              'assets/images/app/points_progress.png',
              width: 126.0,
              height: 52,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'Total Points',
            style: Theme.of(ctx).textTheme.headline4,
          ),
        ],
      ),
    ),

    // Middle Point score
    Positioned(
      width: 58,
      height: 42,
      top: 24,
      left: 42,
      child: Container(
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: Theme.of(ctx).primaryColor,
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            '23',
            style: Theme.of(ctx).textTheme.headline6.copyWith(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  ]);
}
