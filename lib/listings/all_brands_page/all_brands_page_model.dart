import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_brands_page_widget.dart' show AllBrandsPageWidget;
import 'package:flutter/material.dart';

class AllBrandsPageModel extends FlutterFlowModel<AllBrandsPageWidget> {
  ///  Local state fields for this page.

  String searchQuery = '';

  bool isLoading = false;

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
