import '/components/skeletons/grid_item_skeleton/grid_item_skeleton_widget.dart';
import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'publisher_release_skeleton_widget.dart'
    show PublisherReleaseSkeletonWidget;
import 'package:flutter/material.dart';

class PublisherReleaseSkeletonModel
    extends FlutterFlowModel<PublisherReleaseSkeletonWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel;
  // Model for GridItemSkeleton component.
  late GridItemSkeletonModel gridItemSkeletonModel;

  @override
  void initState(BuildContext context) {
    textSkeletonModel = createModel(context, () => TextSkeletonModel());
    gridItemSkeletonModel = createModel(context, () => GridItemSkeletonModel());
  }

  @override
  void dispose() {
    textSkeletonModel.dispose();
    gridItemSkeletonModel.dispose();
  }
}
