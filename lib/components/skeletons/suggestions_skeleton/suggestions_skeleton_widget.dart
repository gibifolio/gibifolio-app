import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'suggestions_skeleton_model.dart';
export 'suggestions_skeleton_model.dart';

class SuggestionsSkeletonWidget extends StatefulWidget {
  const SuggestionsSkeletonWidget({super.key});

  @override
  State<SuggestionsSkeletonWidget> createState() =>
      _SuggestionsSkeletonWidgetState();
}

class _SuggestionsSkeletonWidgetState extends State<SuggestionsSkeletonWidget> {
  late SuggestionsSkeletonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuggestionsSkeletonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: wrapWithModel(
              model: _model.textSkeletonModel1,
              updateCallback: () => safeSetState(() {}),
              child: TextSkeletonWidget(
                height: 160.0,
              ),
            ),
          ),
          Expanded(
            child: wrapWithModel(
              model: _model.textSkeletonModel2,
              updateCallback: () => safeSetState(() {}),
              child: TextSkeletonWidget(
                height: 160.0,
              ),
            ),
          ),
          Expanded(
            child: wrapWithModel(
              model: _model.textSkeletonModel3,
              updateCallback: () => safeSetState(() {}),
              child: TextSkeletonWidget(
                height: 160.0,
              ),
            ),
          ),
        ].divide(SizedBox(width: 16.0)),
      ),
    );
  }
}
