import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final String videoId;

  const VideoPlayer({
    Key key,
    this.videoId,
  }) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  YoutubePlayerController _controller;
  bool _isPlayerReady = false;

  @override
  void dispose() {
    print('dispose RAN');
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    print('initstate RAAAAAAAAAN');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies RAAAAAAAAAN');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('video player build vidID: ${widget.videoId}');
    // Initiate the Youtube player controller
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );

    if (_isPlayerReady) _controller.load(widget.videoId);

    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16),
      child: YoutubePlayer(
        controller: _controller,
        liveUIColor: Colors.amber,
        onReady: () {
          _isPlayerReady = true;
        },
      ),
    );
  }
}
