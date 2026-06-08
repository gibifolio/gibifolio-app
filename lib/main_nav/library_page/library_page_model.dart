import '/backend/supabase/supabase.dart';
import '/components/chip/chip_widget.dart';
import '/components/items_and_thumbs/grid_item_title/grid_item_title_widget.dart';
import '/components/skeletons/user_area_empty_state/user_area_empty_state_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'library_page_widget.dart' show LibraryPageWidget;
import 'package:flutter/material.dart';

class LibraryPageModel extends FlutterFlowModel<LibraryPageWidget> {
  ///  Local state fields for this page.

  String? searchQuery;

  bool? hasOwned;

  bool? hasWanted;

  bool? hasRead;

  bool libraryIsLoading = false;

  bool? hasReading = false;

  ///  State fields for stateful widgets in this page.

  bool requestCompleted2 = false;
  String? requestLastUniqueKey2;
  bool requestCompleted1 = false;
  String? requestLastUniqueKey1;
  Completer<List<UserTitleStatusRow>>? requestCompleter3;
  // Model for chip component.
  late ChipModel chipModel1;
  // Model for chip component.
  late ChipModel chipModel2;
  // Model for chip component.
  late ChipModel chipModel3;
  // Model for chip component.
  late ChipModel chipModel4;
  // Models for GridItemTitle dynamic component.
  late FlutterFlowDynamicModels<GridItemTitleModel> gridItemTitleModels;
  // Model for UserAreaEmptyState component.
  late UserAreaEmptyStateModel userAreaEmptyStateModel;

  @override
  void initState(BuildContext context) {
    chipModel1 = createModel(context, () => ChipModel());
    chipModel2 = createModel(context, () => ChipModel());
    chipModel3 = createModel(context, () => ChipModel());
    chipModel4 = createModel(context, () => ChipModel());
    gridItemTitleModels = FlutterFlowDynamicModels(() => GridItemTitleModel());
    userAreaEmptyStateModel =
        createModel(context, () => UserAreaEmptyStateModel());
  }

  @override
  void dispose() {
    chipModel1.dispose();
    chipModel2.dispose();
    chipModel3.dispose();
    chipModel4.dispose();
    gridItemTitleModels.dispose();
    userAreaEmptyStateModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted2;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted1;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
