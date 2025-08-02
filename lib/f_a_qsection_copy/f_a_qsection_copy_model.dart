import '/flutter_flow/flutter_flow_util.dart';
import 'f_a_qsection_copy_widget.dart' show FAQsectionCopyWidget;
import 'package:flutter/material.dart';

class FAQsectionCopyModel extends FlutterFlowModel<FAQsectionCopyWidget> {
  ///  Local state fields for this page.

  String selectedCategory = '';

  String selectedQuestion = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
