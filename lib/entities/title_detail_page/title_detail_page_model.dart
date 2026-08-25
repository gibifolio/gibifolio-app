import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/items_and_thumbs/list_item/list_item_widget.dart';
import '/components/status/title_status_indicator/title_status_indicator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'dart:async';
import 'title_detail_page_widget.dart' show TitleDetailPageWidget;
import 'package:flutter/material.dart';

class TitleDetailPageModel extends FlutterFlowModel<TitleDetailPageWidget> {
  ///  Local state fields for this page.

  String? filterReading;

  String? filterOwnership;

  bool? isFiltered = false;

  List<LicensorItemStruct> titleLicensors = [];
  void addToTitleLicensors(LicensorItemStruct item) => titleLicensors.add(item);
  void removeFromTitleLicensors(LicensorItemStruct item) =>
      titleLicensors.remove(item);
  void removeAtIndexFromTitleLicensors(int index) =>
      titleLicensors.removeAt(index);
  void insertAtIndexInTitleLicensors(int index, LicensorItemStruct item) =>
      titleLicensors.insert(index, item);
  void updateTitleLicensorsAtIndex(
          int index, Function(LicensorItemStruct) updateFn) =>
      titleLicensors[index] = updateFn(titleLicensors[index]);

  bool changeFilter = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - fetchTitleLicensors] action in TitleDetailPage widget.
  List<LicensorItemStruct>? titleLicensorsList;
  // Stores action output result for [Custom Action - queueReview] action in scrape widget.
  String? queueTitleResult;
  bool requestCompleted2 = false;
  String? requestLastUniqueKey2;
  Completer<List<AppTitleDetailRow>>? requestCompleter3;
  Completer<List<AppTitleIssueCountsRow>>? requestCompleter1;
  // Model for TitleStatusIndicator component.
  late TitleStatusIndicatorModel titleStatusIndicatorModel;
  // Stores action output result for [Custom Action - fetchLibraryTitles] action in TitleStatusIndicator widget.
  List<LibraryTitleItemStruct>? refreshTitle;
  // Models for ListItem dynamic component.
  late FlutterFlowDynamicModels<ListItemModel> listItemModels;
  // Stores action output result for [Custom Action - fetchLibraryTitles] action in ListItem widget.
  List<LibraryTitleItemStruct>? refreshTitle3;

  /// Query cache managers for this widget.

  final _titleCacheManager = FutureRequestManager<List<AppIssueWithCoverRow>>();
  Future<List<AppIssueWithCoverRow>> titleCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppIssueWithCoverRow>> Function() requestFn,
  }) =>
      _titleCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTitleCacheCache() => _titleCacheManager.clear();
  void clearTitleCacheCacheKey(String? uniqueKey) =>
      _titleCacheManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    titleStatusIndicatorModel =
        createModel(context, () => TitleStatusIndicatorModel());
    listItemModels = FlutterFlowDynamicModels(() => ListItemModel());
  }

  @override
  void dispose() {
    titleStatusIndicatorModel.dispose();
    listItemModels.dispose();

    /// Dispose query cache managers for this widget.

    clearTitleCacheCache();
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

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
