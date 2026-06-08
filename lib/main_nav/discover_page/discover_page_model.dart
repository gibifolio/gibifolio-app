import '/backend/supabase/supabase.dart';
import '/components/items_and_thumbs/card_featured_list_color/card_featured_list_color_widget.dart';
import '/components/search_button_custom/search_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'discover_page_widget.dart' show DiscoverPageWidget;
import 'package:flutter/material.dart';

class DiscoverPageModel extends FlutterFlowModel<DiscoverPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkAdminEmail] action in DiscoverPage widget.
  bool? isAdminUser;
  // Stores action output result for [Backend Call - Query Rows] action in DiscoverPage widget.
  List<UsersRow>? currentUser;
  // Stores action output result for [Custom Action - checkHasReadingIssues] action in DiscoverPage widget.
  bool? hasReadingResult;
  // Stores action output result for [Custom Action - fetchDiscoverBrands] action in DiscoverPage widget.
  List<dynamic>? discoverBrandsResult;
  // Model for SearchButtonCustom component.
  late SearchButtonCustomModel searchButtonCustomModel;
  bool requestCompleted1 = false;
  String? requestLastUniqueKey1;
  bool requestCompleted5 = false;
  String? requestLastUniqueKey5;
  bool requestCompleted7 = false;
  String? requestLastUniqueKey7;
  bool requestCompleted8 = false;
  String? requestLastUniqueKey8;
  bool requestCompleted6 = false;
  String? requestLastUniqueKey6;
  bool requestCompleted2 = false;
  String? requestLastUniqueKey2;
  bool requestCompleted3 = false;
  String? requestLastUniqueKey3;
  bool requestCompleted4 = false;
  String? requestLastUniqueKey4;
  // Models for CardFeaturedListColor dynamic component.
  late FlutterFlowDynamicModels<CardFeaturedListColorModel>
      cardFeaturedListColorModels1;
  // Models for CardFeaturedListColor dynamic component.
  late FlutterFlowDynamicModels<CardFeaturedListColorModel>
      cardFeaturedListColorModels2;
  // Models for CardFeaturedListColor dynamic component.
  late FlutterFlowDynamicModels<CardFeaturedListColorModel>
      cardFeaturedListColorModels3;
  // Models for CardFeaturedListColor dynamic component.
  late FlutterFlowDynamicModels<CardFeaturedListColorModel>
      cardFeaturedListColorModels4;

  @override
  void initState(BuildContext context) {
    searchButtonCustomModel =
        createModel(context, () => SearchButtonCustomModel());
    cardFeaturedListColorModels1 =
        FlutterFlowDynamicModels(() => CardFeaturedListColorModel());
    cardFeaturedListColorModels2 =
        FlutterFlowDynamicModels(() => CardFeaturedListColorModel());
    cardFeaturedListColorModels3 =
        FlutterFlowDynamicModels(() => CardFeaturedListColorModel());
    cardFeaturedListColorModels4 =
        FlutterFlowDynamicModels(() => CardFeaturedListColorModel());
  }

  @override
  void dispose() {
    searchButtonCustomModel.dispose();
    cardFeaturedListColorModels1.dispose();
    cardFeaturedListColorModels2.dispose();
    cardFeaturedListColorModels3.dispose();
    cardFeaturedListColorModels4.dispose();
  }

  /// Additional helper methods.
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

  Future waitForRequestCompleted5({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted5;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted7({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted7;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted8({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted8;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted6({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted6;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

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
      final requestComplete = requestCompleted3;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted4;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
