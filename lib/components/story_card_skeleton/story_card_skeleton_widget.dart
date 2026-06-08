import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'story_card_skeleton_model.dart';
export 'story_card_skeleton_model.dart';

class StoryCardSkeletonWidget extends StatefulWidget {
  const StoryCardSkeletonWidget({
    super.key,
    this.storyId,
    this.title,
    this.number,
    this.titleOriginal,
    this.synopsis,
  });

  final String? storyId;
  final String? title;
  final int? number;
  final String? titleOriginal;
  final String? synopsis;

  @override
  State<StoryCardSkeletonWidget> createState() =>
      _StoryCardSkeletonWidgetState();
}

class _StoryCardSkeletonWidgetState extends State<StoryCardSkeletonWidget> {
  late StoryCardSkeletonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoryCardSkeletonModel());

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
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.textSkeletonModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: TextSkeletonWidget(
                          width: 164.0,
                          height: 14.0,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textSkeletonModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: TextSkeletonWidget(
                            height: 10.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
