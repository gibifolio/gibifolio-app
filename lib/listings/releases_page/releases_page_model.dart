import '/components/items_and_thumbs/grid_item_issue/grid_item_issue_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'releases_page_widget.dart' show ReleasesPageWidget;
import 'package:flutter/material.dart';

class ReleasesPageModel extends FlutterFlowModel<ReleasesPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Models for GridItemIssue dynamic component.
  late FlutterFlowDynamicModels<GridItemIssueModel> gridItemIssueModels1;
  // Models for GridItemIssue dynamic component.
  late FlutterFlowDynamicModels<GridItemIssueModel> gridItemIssueModels2;

  @override
  void initState(BuildContext context) {
    gridItemIssueModels1 = FlutterFlowDynamicModels(() => GridItemIssueModel());
    gridItemIssueModels2 = FlutterFlowDynamicModels(() => GridItemIssueModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    gridItemIssueModels1.dispose();
    gridItemIssueModels2.dispose();
  }
}
