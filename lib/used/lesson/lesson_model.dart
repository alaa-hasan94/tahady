import '/flutter_flow/flutter_flow_util.dart';
import 'lesson_widget.dart' show LessonWidget;
import 'package:flutter/material.dart';

class LessonModel extends FlutterFlowModel<LessonWidget> {
  ///  Local state fields for this page.

  bool lessonList = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
