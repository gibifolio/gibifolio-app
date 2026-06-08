import '/components/items_and_thumbs/list_item/list_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'status_reading_page_widget.dart' show StatusReadingPageWidget;
import 'package:flutter/material.dart';

class StatusReadingPageModel extends FlutterFlowModel<StatusReadingPageWidget> {
  ///  Local state fields for this page.

  String searchQuery = '%';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool requestCompleted = false;
  String? requestLastUniqueKey;
  // Models for ListItem dynamic component.
  late FlutterFlowDynamicModels<ListItemModel> listItemModels;

  @override
  void initState(BuildContext context) {
    listItemModels = FlutterFlowDynamicModels(() => ListItemModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

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
      final requestComplete = requestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
