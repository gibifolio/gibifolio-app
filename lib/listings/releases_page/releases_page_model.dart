import '/components/items_and_thumbs/grid_item_issue/grid_item_issue_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'releases_page_widget.dart' show ReleasesPageWidget;
import 'package:flutter/material.dart';

class ReleasesPageModel extends FlutterFlowModel<ReleasesPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for GridItemIssue dynamic component.
  late FlutterFlowDynamicModels<GridItemIssueModel> gridItemIssueModels;

  @override
  void initState(BuildContext context) {
    gridItemIssueModels = FlutterFlowDynamicModels(() => GridItemIssueModel());
  }

  @override
  void dispose() {
    gridItemIssueModels.dispose();
  }
}
