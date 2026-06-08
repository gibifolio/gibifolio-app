import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'title_header_skeleton_widget.dart' show TitleHeaderSkeletonWidget;
import 'package:flutter/material.dart';

class TitleHeaderSkeletonModel
    extends FlutterFlowModel<TitleHeaderSkeletonWidget> {
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

  @override
  void initState(BuildContext context) {
    textSkeletonModel1 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel2 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel3 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel4 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel5 = createModel(context, () => TextSkeletonModel());
  }

  @override
  void dispose() {
    textSkeletonModel1.dispose();
    textSkeletonModel2.dispose();
    textSkeletonModel3.dispose();
    textSkeletonModel4.dispose();
    textSkeletonModel5.dispose();
  }
}
