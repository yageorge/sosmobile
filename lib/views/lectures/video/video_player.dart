import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../widgets/app_bar.dart';

class VideoPlayer extends StatefulWidget {
  static const routeName = '/video-player';

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  String _videoId;
  YoutubePlayerController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context).settings.arguments as Map;
    _videoId = args['urlId'];
    _controller = YoutubePlayerController(
      initialVideoId: _videoId,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
        hideThumbnail: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Play Video'),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: 16, bottom: 16),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
                liveUIColor: Colors.amber,
                thumbnail: Image.network(
                  "https://img.youtube.com/vi/$_videoId/hqdefault.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
