import '/components/search_button_custom/search_button_custom_widget.dart';
import '/components/skeletons/list_featured_loading/list_featured_loading_widget.dart';
import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'discover_page_skeleton_widget.dart' show DiscoverPageSkeletonWidget;
import 'package:flutter/material.dart';

class DiscoverPageSkeletonModel
    extends FlutterFlowModel<DiscoverPageSkeletonWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SearchButtonCustom component.
  late SearchButtonCustomModel searchButtonCustomModel;
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
  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel7;
  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel8;
  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel9;
  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel10;
  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel11;
  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel12;
  // Model for TextSkeleton component.
  late TextSkeletonModel textSkeletonModel13;
  // Model for ListFeaturedLoading component.
  late ListFeaturedLoadingModel listFeaturedLoadingModel;

  @override
  void initState(BuildContext context) {
    searchButtonCustomModel =
        createModel(context, () => SearchButtonCustomModel());
    textSkeletonModel1 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel2 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel3 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel4 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel5 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel6 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel7 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel8 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel9 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel10 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel11 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel12 = createModel(context, () => TextSkeletonModel());
    textSkeletonModel13 = createModel(context, () => TextSkeletonModel());
    listFeaturedLoadingModel =
        createModel(context, () => ListFeaturedLoadingModel());
  }

  @override
  void dispose() {
    searchButtonCustomModel.dispose();
    textSkeletonModel1.dispose();
    textSkeletonModel2.dispose();
    textSkeletonModel3.dispose();
    textSkeletonModel4.dispose();
    textSkeletonModel5.dispose();
    textSkeletonModel6.dispose();
    textSkeletonModel7.dispose();
    textSkeletonModel8.dispose();
    textSkeletonModel9.dispose();
    textSkeletonModel10.dispose();
    textSkeletonModel11.dispose();
    textSkeletonModel12.dispose();
    textSkeletonModel13.dispose();
    listFeaturedLoadingModel.dispose();
  }
}
