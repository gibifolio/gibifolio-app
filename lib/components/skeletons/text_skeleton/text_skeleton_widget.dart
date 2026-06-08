import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'text_skeleton_model.dart';
export 'text_skeleton_model.dart';

class TextSkeletonWidget extends StatefulWidget {
  const TextSkeletonWidget({
    super.key,
    double? width,
    double? height,
    double? borderRadius,
  })  : this.width = width ?? 80.0,
        this.height = height ?? 12.0,
        this.borderRadius = borderRadius ?? 4.0;

  final double width;
  final double height;
  final double borderRadius;

  @override
  State<TextSkeletonWidget> createState() => _TextSkeletonWidgetState();
}

class _TextSkeletonWidgetState extends State<TextSkeletonWidget>
    with TickerProviderStateMixin {
  late TextSkeletonModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextSkeletonModel());

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
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate,
        borderRadius: BorderRadius.circular(valueOrDefault<double>(
          widget.borderRadius,
          0.0,
        )),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
