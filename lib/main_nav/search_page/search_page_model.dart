import '/components/status/issue_status_indicator/issue_status_indicator_widget.dart';
import '/components/status/title_status_indicator/title_status_indicator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for IssueStatusIndicator dynamic component.
  late FlutterFlowDynamicModels<IssueStatusIndicatorModel>
      issueStatusIndicatorModels;
  // Models for TitleStatusIndicator dynamic component.
  late FlutterFlowDynamicModels<TitleStatusIndicatorModel>
      titleStatusIndicatorModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    issueStatusIndicatorModels =
        FlutterFlowDynamicModels(() => IssueStatusIndicatorModel());
    titleStatusIndicatorModels =
        FlutterFlowDynamicModels(() => TitleStatusIndicatorModel());
  }

  @override
  void dispose() {
    issueStatusIndicatorModels.dispose();
    titleStatusIndicatorModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
