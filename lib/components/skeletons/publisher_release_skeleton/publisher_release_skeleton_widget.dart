import '/components/skeletons/grid_item_skeleton/grid_item_skeleton_widget.dart';
import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'publisher_release_skeleton_model.dart';
export 'publisher_release_skeleton_model.dart';

class PublisherReleaseSkeletonWidget extends StatefulWidget {
  const PublisherReleaseSkeletonWidget({super.key});

  @override
  State<PublisherReleaseSkeletonWidget> createState() =>
      _PublisherReleaseSkeletonWidgetState();
}

class _PublisherReleaseSkeletonWidgetState
    extends State<PublisherReleaseSkeletonWidget> {
  late PublisherReleaseSkeletonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PublisherReleaseSkeletonModel());

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
      height: 240.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                wrapWithModel(
                  model: _model.textSkeletonModel,
                  updateCallback: () => safeSetState(() {}),
                  child: TextSkeletonWidget(),
                ),
                Opacity(
                  opacity: 0.2,
                  child: Icon(
                    Icons.chevron_right,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: wrapWithModel(
                model: _model.gridItemSkeletonModel,
                updateCallback: () => safeSetState(() {}),
                child: GridItemSkeletonWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
