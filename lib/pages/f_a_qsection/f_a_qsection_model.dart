import '/flutter_flow/flutter_flow_util.dart';
import 'f_a_qsection_widget.dart' show FAQsectionWidget;
import 'package:flutter/material.dart';

class FAQsectionModel extends FlutterFlowModel<FAQsectionWidget> {
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
