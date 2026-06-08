import '/components/skeletons/list_featured_loading_compact/list_featured_loading_compact_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'status_bottom_sheet_skeleton_widget.dart'
    show StatusBottomSheetSkeletonWidget;
import 'package:flutter/material.dart';

class StatusBottomSheetSkeletonModel
    extends FlutterFlowModel<StatusBottomSheetSkeletonWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ListFeaturedLoadingCompact component.
  late ListFeaturedLoadingCompactModel listFeaturedLoadingCompactModel;

  @override
  void initState(BuildContext context) {
    listFeaturedLoadingCompactModel =
        createModel(context, () => ListFeaturedLoadingCompactModel());
  }

  @override
  void dispose() {
    listFeaturedLoadingCompactModel.dispose();
  }
}
