import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_header_loading_widget.dart' show ListHeaderLoadingWidget;
import 'package:flutter/material.dart';

class ListHeaderLoadingModel extends FlutterFlowModel<ListHeaderLoadingWidget> {
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
