import '/components/items_and_thumbs/list_item/list_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'licensor_titles_page_widget.dart' show LicensorTitlesPageWidget;
import 'package:flutter/material.dart';

class LicensorTitlesPageModel
    extends FlutterFlowModel<LicensorTitlesPageWidget> {
  ///  State fields for stateful widgets in this page.

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
}
