import '/flutter_flow/flutter_flow_util.dart';
import 'editlesson_widget.dart' show EditlessonWidget;
import 'package:flutter/material.dart';

class EditlessonModel extends FlutterFlowModel<EditlessonWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for lessonName widget.
  FocusNode? lessonNameFocusNode;
  TextEditingController? lessonNameController;
  String? Function(BuildContext, String?)? lessonNameControllerValidator;
  // State field(s) for youtube widget.
  FocusNode? youtubeFocusNode;
  TextEditingController? youtubeController;
  String? Function(BuildContext, String?)? youtubeControllerValidator;
  // State field(s) for lessonDesc widget.
  FocusNode? lessonDescFocusNode;
  TextEditingController? lessonDescController;
  String? Function(BuildContext, String?)? lessonDescControllerValidator;
  // State field(s) for lessonNumber widget.
  FocusNode? lessonNumberFocusNode;
  TextEditingController? lessonNumberController;
  String? Function(BuildContext, String?)? lessonNumberControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    lessonNameFocusNode?.dispose();
    lessonNameController?.dispose();

    youtubeFocusNode?.dispose();
    youtubeController?.dispose();

    lessonDescFocusNode?.dispose();
    lessonDescController?.dispose();

    lessonNumberFocusNode?.dispose();
    lessonNumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
