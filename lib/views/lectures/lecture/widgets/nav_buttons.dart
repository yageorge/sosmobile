import 'package:flutter/material.dart';

Widget getNavButtons({
  int index,
  int lecturesLength,
  Function previousLectureFn,
  Function nextLectureFn,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Previous lecture
      ElevatedButton.icon(
        label: Text('back'),
        icon: Icon(Icons.arrow_left),
        style: ElevatedButton.styleFrom(
          // Disabled color
          onSurface: Colors.grey,
        ),
        // Disabling button on first lecture
        onPressed: index == 0 ? null : () => previousLectureFn(),
      ),

      // Lecture index
      Text('${index + 1} / $lecturesLength'),

      // Next lecture
      ElevatedButton.icon(
        label: Text('next'),
        icon: Icon(Icons.arrow_right),
        style: ElevatedButton.styleFrom(
          // Disabled color
          onSurface: Colors.grey,
        ),
        // Disabling button on last lecture
        onPressed: index + 1 == lecturesLength ? null : () => nextLectureFn(),
      ),
    ],
  );
}
