import '/components/skeletons/grid_item_skeleton/grid_item_skeleton_widget.dart';
import '/components/skeletons/list_featured_loading/list_featured_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_lists_page_skeleton_model.dart';
export 'my_lists_page_skeleton_model.dart';

class MyListsPageSkeletonWidget extends StatefulWidget {
  const MyListsPageSkeletonWidget({super.key});

  @override
  State<MyListsPageSkeletonWidget> createState() =>
      _MyListsPageSkeletonWidgetState();
}

class _MyListsPageSkeletonWidgetState extends State<MyListsPageSkeletonWidget> {
  late MyListsPageSkeletonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyListsPageSkeletonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SafeArea(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Minhas listas',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      font: GoogleFonts.fraunces(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    ),
              ),
            ),
          ),
        ),
        if (!FFAppState().isGridView)
          Expanded(
            child: wrapWithModel(
              model: _model.listFeaturedLoadingModel,
              updateCallback: () => safeSetState(() {}),
              child: ListFeaturedLoadingWidget(),
            ),
          ),
        if (FFAppState().isGridView)
          Padding(
            padding: EdgeInsets.all(16.0),
            child: wrapWithModel(
              model: _model.gridItemSkeletonModel,
              updateCallback: () => safeSetState(() {}),
              child: GridItemSkeletonWidget(),
            ),
          ),
      ],
    );
  }
}
