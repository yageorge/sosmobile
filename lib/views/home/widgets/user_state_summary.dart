import 'package:flutter/material.dart';

Widget getUserStateSummary({BuildContext ctx}) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    getState(
      ctx: ctx,
      title: 'Points',
      value: 23,
      image: 'assets/images/app/points_progress.png',
      color: Theme.of(ctx).primaryColor,
    ),
    getState(
      ctx: ctx,
      title: 'Completed Courses',
      value: 4,
      image: 'assets/images/app/courses_progress.png',
      color: Colors.blue[900],
    ),
  ]);
}

Widget getState({
  BuildContext ctx,
  String title,
  int value,
  String image,
  Color color,
}) {
  return Stack(children: [
    Container(
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
        children: [
          // Top status image
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(22.0)),
            child: Image.asset(
              image,
              width: 126.0,
              height: 52,
              fit: BoxFit.cover,
            ),
          ),

          // Status title
          Container(
            height: 60,
            child: Center(
              child: Text(
                title,
                style: Theme.of(ctx).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ),

    // Middle Point score
    Positioned(
      width: 58,
      height: 42,
      top: 18,
      left: 36,
      child: Opacity(
        opacity: 0.9,
        child: Container(
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: color,
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              value.toString(),
              style: Theme.of(ctx).textTheme.headline6.copyWith(
                    fontSize: 24,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ),
  ]);
}
