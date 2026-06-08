import '/components/skeletons/grid_item_skeleton/grid_item_skeleton_widget.dart';
import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'library_page_content_skeleton_widget.dart'
    show LibraryPageContentSkeletonWidget;
import 'package:flutter/material.dart';

class LibraryPageContentSkeletonModel
    extends FlutterFlowModel<LibraryPageContentSkeletonWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel1;
  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel2;
  // Model for GridItemSkeleton component.
  late GridItemSkeletonModel gridItemSkeletonModel;

  @override
  void initState(BuildContext context) {
    textSkeletonModel1 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel2 = createModel(context, () => TextSkeletonModel());
    gridItemSkeletonModel = createModel(context, () => GridItemSkeletonModel());
  }

  @override
  void dispose() {
    textSkeletonModel1.dispose();
    textSkeletonModel2.dispose();
    gridItemSkeletonModel.dispose();
  }
}
