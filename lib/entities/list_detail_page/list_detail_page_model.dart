import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/items_and_thumbs/list_item/list_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'list_detail_page_widget.dart' show ListDetailPageWidget;
import 'package:flutter/material.dart';

class ListDetailPageModel extends FlutterFlowModel<ListDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<List<AppListDetailRow>>? requestCompleter;
  // Stores action output result for [Custom Action - duplicateList] action in IconButton widget.
  String? newListIdCopy;
  // Stores action output result for [Custom Action - loadListIntoBuffer] action in IconButton widget.
  List<ListEditItemStruct>? listActionBuffer;
  // Models for ListItem dynamic component.
  late FlutterFlowDynamicModels<ListItemModel> listItemModels;

  @override
  void initState(BuildContext context) {
    listItemModels = FlutterFlowDynamicModels(() => ListItemModel());
  }

  @override
  void dispose() {
    listItemModels.dispose();
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
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
