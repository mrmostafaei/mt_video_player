import 'package:mt_video_player/src/mtc_video_player_controller.dart';
import 'package:flutter/material.dart';

class CustomVideoPlayerSeeker extends StatefulWidget {
  final Widget child;
  final MtcVideoPlayerController customvVideoPlayerController;
  const CustomVideoPlayerSeeker({
    Key? key,
    required this.child,
    required this.customvVideoPlayerController,
  }) : super(key: key);

  @override
  _CustomVideoPlayerSeekerState createState() =>
      _CustomVideoPlayerSeekerState();
}

class _CustomVideoPlayerSeekerState extends State<CustomVideoPlayerSeeker> {
  bool _videoPlaying = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: widget.child,
      onHorizontalDragStart: (DragStartDetails details) {
        if (!widget.customvVideoPlayerController.videoPlayerController.controller.value
            .isInitialized) {
          return;
        }
        _videoPlaying = widget
            .customvVideoPlayerController.videoPlayerController.controller.value.isPlaying;
        if (_videoPlaying) {
          widget.customvVideoPlayerController.videoPlayerController.controller.pause();
        }
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        if (!widget.customvVideoPlayerController.videoPlayerController.controller.value
            .isInitialized) {
          return;
        }
        changeCurrentVideoPosition(details.globalPosition);
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        if (_videoPlaying) {
          widget.customvVideoPlayerController.videoPlayerController.controller.play();
        }
      },
      onTapDown: (TapDownDetails details) {
        if (!widget.customvVideoPlayerController.videoPlayerController.controller.value
            .isInitialized) {
          return;
        }
        changeCurrentVideoPosition(details.globalPosition);
      },
    );
  }

  void changeCurrentVideoPosition(Offset globalPosition) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset tapPos = box.globalToLocal(globalPosition);
    final double relative = tapPos.dx / box.size.width;
    final Duration position = widget
            .customvVideoPlayerController.videoPlayerController.controller.value.duration *
        relative;
    widget.customvVideoPlayerController.videoPlayerController.controller.seekTo(position);
    widget.customvVideoPlayerController.videoProgressNotifier.value = position;
  }
}
