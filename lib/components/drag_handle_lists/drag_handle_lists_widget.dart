import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'drag_handle_lists_model.dart';
export 'drag_handle_lists_model.dart';

class DragHandleListsWidget extends StatefulWidget {
  const DragHandleListsWidget({super.key});

  @override
  State<DragHandleListsWidget> createState() => _DragHandleListsWidgetState();
}

class _DragHandleListsWidgetState extends State<DragHandleListsWidget> {
  late DragHandleListsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DragHandleListsModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Opacity(
                opacity: 0.5,
                child: Icon(
                  Icons.expand_less,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20.0,
                ),
              ),
              Icon(
                Icons.drag_indicator,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 20.0,
              ),
              Opacity(
                opacity: 0.5,
                child: Icon(
                  Icons.expand_more_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
