import 'package:flutter/material.dart';

import '../../video/video_player.dart';

Widget getVideoButton({
  BuildContext ctx,
  String urlId,
}) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
      child: Stack(children: [
        // Thumbnail image:
        Image.network(
          "https://img.youtube.com/vi/$urlId/hqdefault.jpg",
          fit: BoxFit.cover,
        ),

        // Play Icon:
        Center(
          heightFactor: 4,
          child: Icon(
            Icons.play_circle_fill,
            size: 56,
            color: Colors.red[900],
          ),
        ),
      ]),
    ),
    onTap: () => {
      Navigator.of(ctx).pushNamed(
        VideoPlayer.routeName,
        // Sending arguments params: Course + All lectures + current lecture index
        arguments: {'urlId': urlId},
      )
    },
  );
}
