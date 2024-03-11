import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'coupon_widget.dart' show CouponWidget;
import 'package:flutter/material.dart';

class CouponModel extends FlutterFlowModel<CouponWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CouponCodeRecord? usedCoupon;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
