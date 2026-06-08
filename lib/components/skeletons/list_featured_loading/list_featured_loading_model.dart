import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_featured_loading_widget.dart' show ListFeaturedLoadingWidget;
import 'package:flutter/material.dart';

class ListFeaturedLoadingModel
    extends FlutterFlowModel<ListFeaturedLoadingWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel1;
  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel2;
  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel3;
  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel4;
  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel5;
  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel6;

  @override
  void initState(BuildContext context) {
    textSkeletonModel1 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel2 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel3 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel4 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel5 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel6 = createModel(context, () => TextSkeletonModel());
  }

  @override
  void dispose() {
    textSkeletonModel1.dispose();
    textSkeletonModel2.dispose();
    textSkeletonModel3.dispose();
    textSkeletonModel4.dispose();
    textSkeletonModel5.dispose();
    textSkeletonModel6.dispose();
  }
}
