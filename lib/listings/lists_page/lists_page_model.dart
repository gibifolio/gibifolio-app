import '/components/items_and_thumbs/grid_item_list/grid_item_list_widget.dart';
import '/components/items_and_thumbs/list_featured/list_featured_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'lists_page_widget.dart' show ListsPageWidget;
import 'package:flutter/material.dart';

class ListsPageModel extends FlutterFlowModel<ListsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for ListFeatured dynamic component.
  late FlutterFlowDynamicModels<ListFeaturedModel> listFeaturedModels;
  // Models for GridItemList dynamic component.
  late FlutterFlowDynamicModels<GridItemListModel> gridItemListModels;

  @override
  void initState(BuildContext context) {
    listFeaturedModels = FlutterFlowDynamicModels(() => ListFeaturedModel());
    gridItemListModels = FlutterFlowDynamicModels(() => GridItemListModel());
  }

  @override
  void dispose() {
    listFeaturedModels.dispose();
    gridItemListModels.dispose();
  }
}
