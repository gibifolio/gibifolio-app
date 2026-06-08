import '/components/skeletons/grid_item_skeleton/grid_item_skeleton_widget.dart';
import '/components/skeletons/list_featured_loading/list_featured_loading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_lists_page_skeleton_widget.dart' show MyListsPageSkeletonWidget;
import 'package:flutter/material.dart';

class MyListsPageSkeletonModel
    extends FlutterFlowModel<MyListsPageSkeletonWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ListFeaturedLoading component.
  late ListFeaturedLoadingModel listFeaturedLoadingModel;
  // Model for GridItemSkeleton component.
  late GridItemSkeletonModel gridItemSkeletonModel;

  @override
  void initState(BuildContext context) {
    listFeaturedLoadingModel =
        createModel(context, () => ListFeaturedLoadingModel());
    gridItemSkeletonModel = createModel(context, () => GridItemSkeletonModel());
  }

  @override
  void dispose() {
    listFeaturedLoadingModel.dispose();
    gridItemSkeletonModel.dispose();
  }
}
