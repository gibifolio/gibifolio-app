import '/components/skeletons/grid_item_skeleton/grid_item_skeleton_widget.dart';
import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'library_page_content_skeleton_model.dart';
export 'library_page_content_skeleton_model.dart';

class LibraryPageContentSkeletonWidget extends StatefulWidget {
  const LibraryPageContentSkeletonWidget({super.key});

  @override
  State<LibraryPageContentSkeletonWidget> createState() =>
      _LibraryPageContentSkeletonWidgetState();
}

class _LibraryPageContentSkeletonWidgetState
    extends State<LibraryPageContentSkeletonWidget> {
  late LibraryPageContentSkeletonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LibraryPageContentSkeletonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 64.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    wrapWithModel(
                      model: _model.textSkeletonModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: TextSkeletonWidget(
                        width: 140.0,
                      ),
                    ),
                    Container(
                      width: 48.0,
                      height: 48.0,
                      decoration: BoxDecoration(),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Opacity(
                        opacity: 0.2,
                        child: wrapWithModel(
                          model: _model.textSkeletonModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: TextSkeletonWidget(
                            width: 24.0,
                            height: 24.0,
                            borderRadius: 100.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: wrapWithModel(
                model: _model.gridItemSkeletonModel,
                updateCallback: () => safeSetState(() {}),
                child: GridItemSkeletonWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
