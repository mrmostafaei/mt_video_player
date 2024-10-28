import 'package:mt_video_player/src/mtc_video_player_controller.dart';
import 'package:mt_video_player/src/embedded_video_player.dart';
import 'package:flutter/material.dart';

class MtVideoPlayer extends StatelessWidget {
  final MtcVideoPlayerController customVideoPlayerController;
  const MtVideoPlayer({
    Key? key,
    required this.customVideoPlayerController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmbeddedVideoPlayer(
      isFullscreen: false,
      customVideoPlayerController: customVideoPlayerController,
    );
  }
}
