import '/backend/supabase/supabase.dart';
import '/components/items_and_thumbs/list_featured/list_featured_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'status_bottom_sheet_widget.dart' show StatusBottomSheetWidget;
import 'package:flutter/material.dart';

class StatusBottomSheetModel extends FlutterFlowModel<StatusBottomSheetWidget> {
  ///  Local state fields for this component.

  String? selectedReading;

  String? selectedOwnership;

  List<String> itemListIds = [];
  void addToItemListIds(String item) => itemListIds.add(item);
  void removeFromItemListIds(String item) => itemListIds.remove(item);
  void removeAtIndexFromItemListIds(int index) => itemListIds.removeAt(index);
  void insertAtIndexInItemListIds(int index, String item) =>
      itemListIds.insert(index, item);
  void updateItemListIdsAtIndex(int index, Function(String) updateFn) =>
      itemListIds[index] = updateFn(itemListIds[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - fetchItemListIds] action in StatusBottomSheet widget.
  List<String>? fetchedListIds;
  Completer<List<AppUserCustomListsRow>>? requestCompleter;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Stack widget.
  List<ListItemsRow>? removeItemFromList;
  // Models for ListFeatured dynamic component.
  late FlutterFlowDynamicModels<ListFeaturedModel> listFeaturedModels;

  @override
  void initState(BuildContext context) {
    listFeaturedModels = FlutterFlowDynamicModels(() => ListFeaturedModel());
  }

  @override
  void dispose() {
    listFeaturedModels.dispose();
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
