import '/backend/schema/structs/index.dart';
import '/components/items_and_thumbs/grid_item_list/grid_item_list_widget.dart';
import '/components/items_and_thumbs/list_featured/list_featured_widget.dart';
import '/components/skeletons/user_area_empty_state/user_area_empty_state_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_lists_page_widget.dart' show MyListsPageWidget;
import 'package:flutter/material.dart';

class MyListsPageModel extends FlutterFlowModel<MyListsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - loadUserListsBuffer] action in MyListsPage widget.
  List<UserListItemStruct>? userListsBuffer;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Models for ListFeatured dynamic component.
  late FlutterFlowDynamicModels<ListFeaturedModel> listFeaturedModels1;
  // Models for GridItemList dynamic component.
  late FlutterFlowDynamicModels<GridItemListModel> gridItemListModels1;
  // Models for ListFeatured dynamic component.
  late FlutterFlowDynamicModels<ListFeaturedModel> listFeaturedModels2;
  // Models for GridItemList dynamic component.
  late FlutterFlowDynamicModels<GridItemListModel> gridItemListModels2;
  // Models for ListFeatured dynamic component.
  late FlutterFlowDynamicModels<ListFeaturedModel> listFeaturedModels3;
  // Models for GridItemList dynamic component.
  late FlutterFlowDynamicModels<GridItemListModel> gridItemListModels3;
  // Model for UserAreaEmptyState component.
  late UserAreaEmptyStateModel userAreaEmptyStateModel;

  @override
  void initState(BuildContext context) {
    listFeaturedModels1 = FlutterFlowDynamicModels(() => ListFeaturedModel());
    gridItemListModels1 = FlutterFlowDynamicModels(() => GridItemListModel());
    listFeaturedModels2 = FlutterFlowDynamicModels(() => ListFeaturedModel());
    gridItemListModels2 = FlutterFlowDynamicModels(() => GridItemListModel());
    listFeaturedModels3 = FlutterFlowDynamicModels(() => ListFeaturedModel());
    gridItemListModels3 = FlutterFlowDynamicModels(() => GridItemListModel());
    userAreaEmptyStateModel =
        createModel(context, () => UserAreaEmptyStateModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    listFeaturedModels1.dispose();
    gridItemListModels1.dispose();
    listFeaturedModels2.dispose();
    gridItemListModels2.dispose();
    listFeaturedModels3.dispose();
    gridItemListModels3.dispose();
    userAreaEmptyStateModel.dispose();
  }
}
