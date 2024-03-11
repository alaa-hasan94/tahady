// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:screen_protector/screen_protector.dart';
import 'dart:io'; // Import dart:io for Platform class
import 'dart:ui'; // Import dart:ui for SystemNavigator

Future<void> screenProtector() async {
  final isRecording = await ScreenProtector.isRecording();
  if (Platform.isIOS) {
    await ScreenProtector.protectDataLeakageWithColor(Colors.black);
    await ScreenProtector.preventScreenshotOn();
  } else if (Platform.isAndroid) {
    await ScreenProtector.protectDataLeakageOn();
    await ScreenProtector.preventScreenshotOn();
  }
  if (isRecording) {
    exit(0);
  }
}

class ScreenProtectorMixin extends StatefulWidget {
  final Widget child;

  const ScreenProtectorMixin({Key? key, required this.child}) : super(key: key);

  @override
  _ScreenProtectorMixinState createState() => _ScreenProtectorMixinState();
}

class _ScreenProtectorMixinState extends State<ScreenProtectorMixin> {
  @override
  void dispose() async {
    await ScreenProtector.protectDataLeakageOff();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
