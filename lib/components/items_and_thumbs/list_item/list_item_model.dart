import '/backend/schema/structs/index.dart';
import '/components/status/issue_status_indicator/issue_status_indicator_widget.dart';
import '/components/status/title_status_indicator/title_status_indicator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_item_widget.dart' show ListItemWidget;
import 'package:flutter/material.dart';

class ListItemModel extends FlutterFlowModel<ListItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for IssueStatusIndicator component.
  late IssueStatusIndicatorModel issueStatusIndicatorModel;
  // Stores action output result for [Custom Action - fetchLibraryTitles] action in IssueStatusIndicator widget.
  List<LibraryTitleItemStruct>? refreshLibrary;
  // Model for TitleStatusIndicator component.
  late TitleStatusIndicatorModel titleStatusIndicatorModel;
  // Stores action output result for [Custom Action - fetchLibraryTitles] action in TitleStatusIndicator widget.
  List<LibraryTitleItemStruct>? refreshLibraryB;

  @override
  void initState(BuildContext context) {
    issueStatusIndicatorModel =
        createModel(context, () => IssueStatusIndicatorModel());
    titleStatusIndicatorModel =
        createModel(context, () => TitleStatusIndicatorModel());
  }

  @override
  void dispose() {
    issueStatusIndicatorModel.dispose();
    titleStatusIndicatorModel.dispose();
  }
}
