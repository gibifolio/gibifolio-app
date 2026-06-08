import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'grid_item_skeleton_small_widget.dart' show GridItemSkeletonSmallWidget;
import 'package:flutter/material.dart';

class GridItemSkeletonSmallModel
    extends FlutterFlowModel<GridItemSkeletonSmallWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel;

  @override
  void initState(BuildContext context) {
    textSkeletonModel = createModel(context, () => TextSkeletonModel());
  }

  @override
  void dispose() {
    textSkeletonModel.dispose();
  }
}
