import '/flutter_flow/flutter_flow_util.dart';
import 'reply_widget.dart' show ReplyWidget;
import 'package:flutter/material.dart';

class ReplyModel extends FlutterFlowModel<ReplyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for commentreply widget.
  FocusNode? commentreplyFocusNode;
  TextEditingController? commentreplyController;
  String? Function(BuildContext, String?)? commentreplyControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentreplyFocusNode?.dispose();
    commentreplyController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
