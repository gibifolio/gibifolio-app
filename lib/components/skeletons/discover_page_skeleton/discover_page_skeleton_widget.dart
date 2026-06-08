import '/components/search_button_custom/search_button_custom_widget.dart';
import '/components/skeletons/list_featured_loading/list_featured_loading_widget.dart';
import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'discover_page_skeleton_model.dart';
export 'discover_page_skeleton_model.dart';

class DiscoverPageSkeletonWidget extends StatefulWidget {
  const DiscoverPageSkeletonWidget({super.key});

  @override
  State<DiscoverPageSkeletonWidget> createState() =>
      _DiscoverPageSkeletonWidgetState();
}

class _DiscoverPageSkeletonWidgetState
    extends State<DiscoverPageSkeletonWidget> {
  late DiscoverPageSkeletonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiscoverPageSkeletonModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (false)
              Opacity(
                opacity: 0.7,
                child: wrapWithModel(
                  model: _model.searchButtonCustomModel,
                  updateCallback: () => safeSetState(() {}),
                  child: SearchButtonCustomWidget(
                    label: 'Buscar HQs',
                    icon: Icon(
                      FFIcons.ksearch,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Opacity(
                      opacity: 0.5,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textSkeletonModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: TextSkeletonWidget(),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 192.0,
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.3,
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Opacity(
                                    opacity: 0.5,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 16.0),
                                      child: wrapWithModel(
                                        model: _model.textSkeletonModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TextSkeletonWidget(
                                          width: 80.0,
                                          height: 120.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.5,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 16.0),
                                      child: wrapWithModel(
                                        model: _model.textSkeletonModel3,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TextSkeletonWidget(
                                          width: 80.0,
                                          height: 120.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.5,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 16.0),
                                      child: wrapWithModel(
                                        model: _model.textSkeletonModel4,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TextSkeletonWidget(
                                          width: 80.0,
                                          height: 120.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.5,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 16.0),
                                      child: wrapWithModel(
                                        model: _model.textSkeletonModel5,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TextSkeletonWidget(
                                          width: 80.0,
                                          height: 120.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.5,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 16.0),
                                      child: wrapWithModel(
                                        model: _model.textSkeletonModel6,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TextSkeletonWidget(
                                          width: 80.0,
                                          height: 120.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(width: 16.0))
                                    .addToStart(SizedBox(width: 36.0))
                                    .addToEnd(SizedBox(width: 36.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Opacity(
                      opacity: 0.5,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textSkeletonModel7,
                          updateCallback: () => safeSetState(() {}),
                          child: TextSkeletonWidget(),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 192.0,
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.3,
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Opacity(
                                    opacity: 0.5,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 16.0),
                                      child: wrapWithModel(
                                        model: _model.textSkeletonModel8,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TextSkeletonWidget(
                                          width: 80.0,
                                          height: 120.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.5,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 16.0),
                                      child: wrapWithModel(
                                        model: _model.textSkeletonModel9,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TextSkeletonWidget(
                                          width: 80.0,
                                          height: 120.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.5,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 16.0),
                                      child: wrapWithModel(
                                        model: _model.textSkeletonModel10,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TextSkeletonWidget(
                                          width: 80.0,
                                          height: 120.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.5,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 16.0),
                                      child: wrapWithModel(
                                        model: _model.textSkeletonModel11,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TextSkeletonWidget(
                                          width: 80.0,
                                          height: 120.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.5,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 16.0),
                                      child: wrapWithModel(
                                        model: _model.textSkeletonModel12,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TextSkeletonWidget(
                                          width: 80.0,
                                          height: 120.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(width: 16.0))
                                    .addToStart(SizedBox(width: 36.0))
                                    .addToEnd(SizedBox(width: 36.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Opacity(
                opacity: 0.5,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 8.0),
                  child: wrapWithModel(
                    model: _model.textSkeletonModel13,
                    updateCallback: () => safeSetState(() {}),
                    child: TextSkeletonWidget(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Opacity(
                opacity: 0.8,
                child: wrapWithModel(
                  model: _model.listFeaturedLoadingModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ListFeaturedLoadingWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
