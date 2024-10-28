# MT Video Player

This package wraps the official video_player package by flutter and extends it with a fully customisable control bar, a fullscreen mode and adjustable video settings. For every control in this video player you can decide if you want to show it and if so how it should look.

<br />

## Top Features

-  [ NEW ] Change voluming with swiping on right side of screen.
-  [ NEW ] Mute/Unmute video
-  [ NEW ] Hide Picture in Picture Mode on Web
-  [ NEW ] Cache Network Video
- Seek forward and backward
- Fullscreen Mode
- Native controls and fullscreen for web apps
- Change Video Quality
- Thumbnail / Poster
- Adjust Playback Speed
- Fully Customizable Controls
- Fluid Progress Bar
- Prevent Seeking in Progress Bar
- Prevent video from being played more than once

<br />

## Getting started

- To get started just create a VideoPlayerController as you would for the normal video_player and define a source to use.
- Secondly create a MtVideoPlayerController to access the fullscreen and control bar visibility switches by yourself. Pass the controllers to a MtVideoPlayer widget to use all its functionality and customisation oppurtunities.
- Secondly create a MtVideoPlayerController and pass it the created VideoPlayerController as well as your custom settings or additional video sources
- On the examples tab is a selection of parameters you can customize to your needs. There you can also see how the additional video sources are added in case you want the user to be able to switch between video qualities

<br />

## Usage

```dart
class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController videoPlayerController;
  late MtcVideoPlayerController _mtcVideoPlayerController;

  String videoUrl =
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(videoUrl)
      ..initialize().then((value) => setState(() {}));
    _mtcVideoPlayerController = MtcVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }

  @override
  void dispose() {
    _mtcVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: SafeArea(
        child: MtcVideoPlayer(
          mtcVideoPlayerController: _mtcVideoPlayerController
        ),
      ),
    );
  }
}
```

<hr/>
Made with ❤ by <a href="https://milad-tech.com">Milad Mostafaei</a>
