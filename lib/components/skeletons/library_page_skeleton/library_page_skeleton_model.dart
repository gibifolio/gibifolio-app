import '/components/chip/chip_widget.dart';
import '/components/skeletons/library_page_content_skeleton/library_page_content_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'library_page_skeleton_widget.dart' show LibraryPageSkeletonWidget;
import 'package:flutter/material.dart';

class LibraryPageSkeletonModel
    extends FlutterFlowModel<LibraryPageSkeletonWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for chip component.
  late ChipModel chipModel1;
  // Model for chip component.
  late ChipModel chipModel2;
  // Model for chip component.
  late ChipModel chipModel3;
  // Model for chip component.
  late ChipModel chipModel4;
  // Model for LibraryPageContentSkeleton component.
  late LibraryPageContentSkeletonModel libraryPageContentSkeletonModel;

  @override
  void initState(BuildContext context) {
    chipModel1 = createModel(context, () => ChipModel());
    chipModel2 = createModel(context, () => ChipModel());
    chipModel3 = createModel(context, () => ChipModel());
    chipModel4 = createModel(context, () => ChipModel());
    libraryPageContentSkeletonModel =
        createModel(context, () => LibraryPageContentSkeletonModel());
  }

  @override
  void dispose() {
    chipModel1.dispose();
    chipModel2.dispose();
    chipModel3.dispose();
    chipModel4.dispose();
    libraryPageContentSkeletonModel.dispose();
  }
}
