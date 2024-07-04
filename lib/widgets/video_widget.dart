import 'package:blinqpay/utils/constants.dart';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoWidget extends StatefulWidget {
  final String videoUrl;

  VideoWidget({required this.videoUrl});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late CachedVideoPlayerController _controller;
  final Map<String, CachedVideoPlayerController> _videoPlayerControllerCache =
      {};

  @override
  void initState() {
    super.initState();
    if (_videoPlayerControllerCache.containsKey(widget.videoUrl)) {
      _controller = _videoPlayerControllerCache[widget.videoUrl]!;
    } else {
      _controller = CachedVideoPlayerController.network(widget.videoUrl)
        ..initialize().then((_) {
          setState(() {}); // Ensure the first frame is shown
          _controller.play();
          _controller.setLooping(true); // Loop the video
          _controller.setVolume(1.0);
        });
      _videoPlayerControllerCache[widget.videoUrl] = _controller;
    }
  }

  @override
  void dispose() {
    _videoPlayerControllerCache.remove(widget.videoUrl);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? SizedBox(
            height: Get.height / 3,
            child: Stack(
              children: [
                AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Center(child: CachedVideoPlayer(_controller))),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    colors:
                        const VideoProgressColors(playedColor: primaryColor),
                  ),
                ),
                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.3),
                        shape: BoxShape.circle),
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 20,
                      color: primaryColor,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                ),
              ],
            ),
          )
        : const CircularProgressIndicator(strokeWidth: 1);
  }
}
