import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'status_indicator_skeleton_model.dart';
export 'status_indicator_skeleton_model.dart';

class StatusIndicatorSkeletonWidget extends StatefulWidget {
  const StatusIndicatorSkeletonWidget({
    super.key,
    bool? isLarge,
  }) : this.isLarge = isLarge ?? false;

  final bool isLarge;

  @override
  State<StatusIndicatorSkeletonWidget> createState() =>
      _StatusIndicatorSkeletonWidgetState();
}

class _StatusIndicatorSkeletonWidgetState
    extends State<StatusIndicatorSkeletonWidget> with TickerProviderStateMixin {
  late StatusIndicatorSkeletonModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusIndicatorSkeletonModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).primaryBackground,
            angle: 0.524,
          ),
        ],
      ),
    });

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
      alignment: AlignmentDirectional(1.0, 0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Container(
          height: 48.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(24.0),
            shape: BoxShape.rectangle,
          ),
          alignment: AlignmentDirectional(1.0, 0.0),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
