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

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ToutubeThumbnail extends StatefulWidget {
  const ToutubeThumbnail({
    Key? key,
    this.width,
    this.height,
    required this.url,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String url;

  @override
  State<ToutubeThumbnail> createState() => _ToutubeThumbnailState();
}

class _ToutubeThumbnailState extends State<ToutubeThumbnail> {
  late String thumbnailUrl; // Declare thumbnailUrl as a class variable

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.url);
    final initialVideoId = videoId ?? 'vdbIPF6tcrU';
    thumbnailUrl = 'https://img.youtube.com/vi/$initialVideoId/0.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      thumbnailUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        // Handle errors, such as invalid URLs
        return Center(
          child: Text(
            'Error loading thumbnail',
            style: TextStyle(color: Colors.red),
          ),
        );
      },
    );
  }
}
