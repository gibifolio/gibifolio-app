import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'featured_list_color_skeleton_model.dart';
export 'featured_list_color_skeleton_model.dart';

class FeaturedListColorSkeletonWidget extends StatefulWidget {
  const FeaturedListColorSkeletonWidget({super.key});

  @override
  State<FeaturedListColorSkeletonWidget> createState() =>
      _FeaturedListColorSkeletonWidgetState();
}

class _FeaturedListColorSkeletonWidgetState
    extends State<FeaturedListColorSkeletonWidget> {
  late FeaturedListColorSkeletonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeaturedListColorSkeletonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: 220.0,
        constraints: BoxConstraints(
          maxWidth: 400.0,
        ),
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
          child: Container(
            width: double.infinity,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.3,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 24.0),
                          child: Container(
                            height: 40.0,
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: wrapWithModel(
                                    model: _model.textSkeletonModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TextSkeletonWidget(
                                      width: 172.0,
                                      height: 16.0,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: wrapWithModel(
                                    model: _model.textSkeletonModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TextSkeletonWidget(
                                      width: 120.0,
                                      height: 16.0,
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            wrapWithModel(
                              model: _model.textSkeletonModel3,
                              updateCallback: () => safeSetState(() {}),
                              child: TextSkeletonWidget(
                                width: 72.0,
                                height: 104.0,
                              ),
                            ),
                            wrapWithModel(
                              model: _model.textSkeletonModel4,
                              updateCallback: () => safeSetState(() {}),
                              child: TextSkeletonWidget(
                                width: 72.0,
                                height: 104.0,
                              ),
                            ),
                            wrapWithModel(
                              model: _model.textSkeletonModel5,
                              updateCallback: () => safeSetState(() {}),
                              child: TextSkeletonWidget(
                                width: 72.0,
                                height: 104.0,
                              ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
