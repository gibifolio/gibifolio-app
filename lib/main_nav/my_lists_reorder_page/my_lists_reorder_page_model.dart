import '/backend/schema/structs/index.dart';
import '/components/items_and_thumbs/list_featured/list_featured_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_lists_reorder_page_widget.dart' show MyListsReorderPageWidget;
import 'package:flutter/material.dart';

class MyListsReorderPageModel
    extends FlutterFlowModel<MyListsReorderPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - loadUserListsBuffer] action in IconButton widget.
  List<UserListItemStruct>? restoreOrder;
  // Stores action output result for [Custom Action - saveUserListsOrder] action in IconButton widget.
  bool? isSaved;
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
}
