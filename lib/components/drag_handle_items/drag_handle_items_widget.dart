import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'drag_handle_items_model.dart';
export 'drag_handle_items_model.dart';

class DragHandleItemsWidget extends StatefulWidget {
  const DragHandleItemsWidget({super.key});

  @override
  State<DragHandleItemsWidget> createState() => _DragHandleItemsWidgetState();
}

class _DragHandleItemsWidgetState extends State<DragHandleItemsWidget> {
  late DragHandleItemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DragHandleItemsModel());

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
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(2.0),
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
