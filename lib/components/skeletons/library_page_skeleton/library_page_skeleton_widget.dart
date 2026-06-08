import '/components/chip/chip_widget.dart';
import '/components/skeletons/library_page_content_skeleton/library_page_content_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'library_page_skeleton_model.dart';
export 'library_page_skeleton_model.dart';

class LibraryPageSkeletonWidget extends StatefulWidget {
  const LibraryPageSkeletonWidget({super.key});

  @override
  State<LibraryPageSkeletonWidget> createState() =>
      _LibraryPageSkeletonWidgetState();
}

class _LibraryPageSkeletonWidgetState extends State<LibraryPageSkeletonWidget>
    with TickerProviderStateMixin {
  late LibraryPageSkeletonModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LibraryPageSkeletonModel());

    animationsMap.addAll({
      'chipOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).alternate,
            angle: 0.524,
          ),
        ],
      ),
      'chipOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).alternate,
            angle: 0.524,
          ),
        ],
      ),
      'chipOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).alternate,
            angle: 0.524,
          ),
        ],
      ),
      'chipOnPageLoadAnimation4': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).alternate,
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Opacity(
          opacity: 0.5,
          child: Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsets.all(14.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: wrapWithModel(
                          model: _model.chipModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: ChipWidget(
                            icon: Icon(
                              Icons.done_all,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            label: 'Lidos',
                            itemCount: 0,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['chipOnPageLoadAnimation1']!),
                      ),
                      Expanded(
                        child: wrapWithModel(
                          model: _model.chipModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: ChipWidget(
                            icon: FaIcon(
                              FontAwesomeIcons.glasses,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 15.0,
                            ),
                            label: 'Lendo',
                            itemCount: 0,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['chipOnPageLoadAnimation2']!),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: wrapWithModel(
                          model: _model.chipModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: ChipWidget(
                            icon: FaIcon(
                              FontAwesomeIcons.book,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 18.0,
                            ),
                            label: 'Não lidos',
                            itemCount: 0,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['chipOnPageLoadAnimation3']!),
                      ),
                      Expanded(
                        child: wrapWithModel(
                          model: _model.chipModel4,
                          updateCallback: () => safeSetState(() {}),
                          child: ChipWidget(
                            icon: Icon(
                              Icons.auto_awesome,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            label: 'Quero',
                            itemCount: 0,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['chipOnPageLoadAnimation4']!),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
            ),
          ),
        ),
        wrapWithModel(
          model: _model.libraryPageContentSkeletonModel,
          updateCallback: () => safeSetState(() {}),
          child: LibraryPageContentSkeletonWidget(),
        ),
      ],
    );
  }
}
