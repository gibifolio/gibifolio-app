import '/components/skeletons/list_item_skeleton_l/list_item_skeleton_l_widget.dart';
import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'title_page_skeleton_widget.dart' show TitlePageSkeletonWidget;
import 'package:flutter/material.dart';

class TitlePageSkeletonModel extends FlutterFlowModel<TitlePageSkeletonWidget> {
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
  // Model for ListItemSkeletonL component.
  late ListItemSkeletonLModel listItemSkeletonLModel;

  @override
  void initState(BuildContext context) {
    textSkeletonModel1 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel2 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel3 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel4 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel5 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel6 = createModel(context, () => TextSkeletonModel());
    listItemSkeletonLModel =
        createModel(context, () => ListItemSkeletonLModel());
  }

  @override
  void dispose() {
    textSkeletonModel1.dispose();
    textSkeletonModel2.dispose();
    textSkeletonModel3.dispose();
    textSkeletonModel4.dispose();
    textSkeletonModel5.dispose();
    textSkeletonModel6.dispose();
    listItemSkeletonLModel.dispose();
  }
}
