// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class CustomVidPlayer extends StatefulWidget {
  CustomVidPlayer({
    Key? key,
    this.width,
    this.height,
    required this.videoPath,
    this.playPauseVideoAction = false,
    this.autoPlay = false,
    this.looping = false,
    this.showControls = false,
    this.allowFullScreen = false,
    this.allowPlayBackSpeedChanging = false,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String videoPath;
  bool playPauseVideoAction;
  final bool autoPlay;
  final bool looping;
  final bool showControls;
  final bool allowFullScreen;
  final bool allowPlayBackSpeedChanging;

  @override
  _CustomVidPlayerState createState() => _CustomVidPlayerState();
}

class _CustomVidPlayerState extends State<CustomVidPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoPath);
    _videoPlayerController.setLooping(true);
    _videoPlayerController.initialize().then((_) {
      setState(() {});
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: 16 / 9,
        autoPlay: widget.autoPlay,
        looping: widget.looping,
        showControls: widget.showControls,
        allowFullScreen: widget.allowFullScreen,
        allowPlaybackSpeedChanging: widget.allowPlayBackSpeedChanging,
      );
    });
  }

  @override
  void didUpdateWidget(CustomVidPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.playPauseVideoAction != oldWidget.playPauseVideoAction) {
      if (widget.playPauseVideoAction) {
        _videoPlayerController.play();
      } else {
        _videoPlayerController.pause();
      }
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  void _toggleVideoPlayback() {
    // additionally to onTap play / pause, video can be played / paused by parameter 'playPauseVideoAction'
    if (widget.playPauseVideoAction || _isVideoPlaying) {
      _videoPlayerController.play();
    } else {
      _videoPlayerController.pause();
    }
    setState(() {
      _isVideoPlaying = !_isVideoPlaying;

      // update parameter to reflect video play state
      widget.playPauseVideoAction = _isVideoPlaying;

      // remember that if you want to use eg. app state to play/pause video, you should update it here:
      // FFAppState().yourAppState = widget.playPauseVideoAction;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: _videoPlayerController.value.isInitialized
          ? Stack(
              children: [
                Chewie(
                  controller: _chewieController,
                ),
                GestureDetector(
                  onTap: _toggleVideoPlayback, // play / pause video on tap
                  behavior: HitTestBehavior.opaque,
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
