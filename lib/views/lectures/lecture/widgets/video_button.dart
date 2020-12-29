import 'package:flutter/material.dart';

import '../../video/video_player.dart';

Widget getVideoButton({
  BuildContext ctx,
  String urlId,
}) {
  return InkWell(
    child: Image.network(
      "https://img.youtube.com/vi/$urlId/hqdefault.jpg",
      fit: BoxFit.cover,
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
