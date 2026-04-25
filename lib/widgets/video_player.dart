import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const CustomVideoPlayer({required this.videoUrl, super.key});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(widget.videoUrl)!;
    _controller = YoutubePlayerController(
      initialVideoId: videoID,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                _controller.pause();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close, color: Colors.white),
            ),
          ),
          // player
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blue,
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
