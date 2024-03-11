import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'searchcourse_widget.dart' show SearchcourseWidget;
import 'package:flutter/material.dart';

class SearchcourseModel extends FlutterFlowModel<SearchcourseWidget> {
  ///  Local state fields for this page.

  String categoryName = 'all';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for search widget.
  final searchKey = GlobalKey();
  FocusNode? searchFocusNode;
  TextEditingController? searchController;
  String? searchSelectedOption;
  String? Function(BuildContext, String?)? searchControllerValidator;
  List<CoursesRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
