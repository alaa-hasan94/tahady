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

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeIframe extends StatefulWidget {
  const YoutubeIframe({
    Key? key,
    this.width,
    this.height,
    required this.url,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String url;

  @override
  State<YoutubeIframe> createState() => _YoutubeIframeState();
}

class _YoutubeIframeState extends State<YoutubeIframe> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoId = YoutubePlayerController.convertUrlToId(widget.url);
    final initialVideoId = videoId ?? 'vdbIPF6tcrU';

// If the requirement is just to play a single video.
    _controller = YoutubePlayerController.fromVideoId(
      videoId: initialVideoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
          mute: false, showControls: true, showFullscreenButton: true),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      aspectRatio: 16 / 9,
      builder: (context, player) {
        return Column(
          children: [
            player,
            Text('Youtube Player'),
          ],
        );
      },
    );
  }
}
