import '/components/items_and_thumbs/list_item/list_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_reorder_page_widget.dart' show ListReorderPageWidget;
import 'package:flutter/material.dart';

class ListReorderPageModel extends FlutterFlowModel<ListReorderPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - saveListOrder] action in IconButton widget.
  bool? isSaved;
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
