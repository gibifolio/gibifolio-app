import '/components/items_and_thumbs/list_featured/list_featured_widget.dart';
import '/components/items_and_thumbs/list_thumb/list_thumb_widget.dart';
import '/components/skeletons/user_area_empty_state/user_area_empty_state_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'my_lists_page_widget.dart' show MyListsPageWidget;
import 'package:flutter/material.dart';

class MyListsPageModel extends FlutterFlowModel<MyListsPageWidget> {
  ///  State fields for stateful widgets in this page.

  bool requestCompleted = false;
  String? requestLastUniqueKey;
  // Models for ListFeatured dynamic component.
  late FlutterFlowDynamicModels<ListFeaturedModel> listFeaturedModels;
  // Models for ListThumb dynamic component.
  late FlutterFlowDynamicModels<ListThumbModel> listThumbModels;
  // Model for UserAreaEmptyState component.
  late UserAreaEmptyStateModel userAreaEmptyStateModel;

  @override
  void initState(BuildContext context) {
    listFeaturedModels = FlutterFlowDynamicModels(() => ListFeaturedModel());
    listThumbModels = FlutterFlowDynamicModels(() => ListThumbModel());
    userAreaEmptyStateModel =
        createModel(context, () => UserAreaEmptyStateModel());
  }

  @override
  void dispose() {
    listFeaturedModels.dispose();
    listThumbModels.dispose();
    userAreaEmptyStateModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
