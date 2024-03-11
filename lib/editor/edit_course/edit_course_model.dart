import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_course_widget.dart' show EditCourseWidget;
import 'package:flutter/material.dart';

class EditCourseModel extends FlutterFlowModel<EditCourseWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for productName widget.
  FocusNode? productNameFocusNode1;
  TextEditingController? productNameController1;
  String? Function(BuildContext, String?)? productNameController1Validator;
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode2;
  TextEditingController? productNameController2;
  String? Function(BuildContext, String?)? productNameController2Validator;
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode3;
  TextEditingController? productNameController3;
  String? Function(BuildContext, String?)? productNameController3Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
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
    unfocusNode.dispose();
    productNameFocusNode1?.dispose();
    productNameController1?.dispose();

    productNameFocusNode2?.dispose();
    productNameController2?.dispose();

    productNameFocusNode3?.dispose();
    productNameController3?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();

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
