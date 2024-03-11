import '/flutter_flow/flutter_flow_util.dart';
import 'userprofile_widget.dart' show UserprofileWidget;
import 'package:flutter/material.dart';

class UserprofileModel extends FlutterFlowModel<UserprofileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? didpurchase;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for phonenumber widget.
  FocusNode? phonenumberFocusNode;
  TextEditingController? phonenumberController;
  String? Function(BuildContext, String?)? phonenumberControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    nameFocusNode?.dispose();
    nameController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
