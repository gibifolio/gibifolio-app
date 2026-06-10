import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'grid_item_skeleton_model.dart';
export 'grid_item_skeleton_model.dart';

class GridItemSkeletonWidget extends StatefulWidget {
  const GridItemSkeletonWidget({super.key});

  @override
  State<GridItemSkeletonWidget> createState() => _GridItemSkeletonWidgetState();
}

class _GridItemSkeletonWidgetState extends State<GridItemSkeletonWidget> {
  late GridItemSkeletonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GridItemSkeletonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 302.21,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Opacity(
                opacity: 0.8,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: wrapWithModel(
                    model: _model.textSkeletonModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: TextSkeletonWidget(
                      width: 80.0,
                      height: 108.0,
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.7,
                child: wrapWithModel(
                  model: _model.textSkeletonModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: TextSkeletonWidget(
                    height: 12.0,
                  ),
                ),
              ),
              Opacity(
                opacity: 0.5,
                child: wrapWithModel(
                  model: _model.textSkeletonModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: TextSkeletonWidget(
                    width: 60.0,
                  ),
                ),
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Opacity(
                opacity: 0.8,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: wrapWithModel(
                    model: _model.textSkeletonModel4,
                    updateCallback: () => safeSetState(() {}),
                    child: TextSkeletonWidget(
                      width: 80.0,
                      height: 108.0,
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.7,
                child: wrapWithModel(
                  model: _model.textSkeletonModel5,
                  updateCallback: () => safeSetState(() {}),
                  child: TextSkeletonWidget(
                    height: 12.0,
                  ),
                ),
              ),
              Opacity(
                opacity: 0.5,
                child: wrapWithModel(
                  model: _model.textSkeletonModel6,
                  updateCallback: () => safeSetState(() {}),
                  child: TextSkeletonWidget(
                    width: 60.0,
                  ),
                ),
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Opacity(
                opacity: 0.8,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: wrapWithModel(
                    model: _model.textSkeletonModel7,
                    updateCallback: () => safeSetState(() {}),
                    child: TextSkeletonWidget(
                      width: 80.0,
                      height: 108.0,
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.7,
                child: wrapWithModel(
                  model: _model.textSkeletonModel8,
                  updateCallback: () => safeSetState(() {}),
                  child: TextSkeletonWidget(
                    height: 12.0,
                  ),
                ),
              ),
              Opacity(
                opacity: 0.5,
                child: wrapWithModel(
                  model: _model.textSkeletonModel9,
                  updateCallback: () => safeSetState(() {}),
                  child: TextSkeletonWidget(
                    width: 60.0,
                  ),
                ),
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
        ],
      ),
    );
  }
}
