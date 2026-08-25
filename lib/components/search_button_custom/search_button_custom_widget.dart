import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'search_button_custom_model.dart';
export 'search_button_custom_model.dart';

class SearchButtonCustomWidget extends StatefulWidget {
  const SearchButtonCustomWidget({
    super.key,
    String? label,
    this.icon,
  }) : this.label = label ?? 'Buscar';

  final String label;
  final Widget? icon;

  @override
  State<SearchButtonCustomWidget> createState() =>
      _SearchButtonCustomWidgetState();
}

class _SearchButtonCustomWidgetState extends State<SearchButtonCustomWidget> {
  late SearchButtonCustomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchButtonCustomModel());

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
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).primaryBackground,
              FlutterFlowTheme.of(context).transparent
            ],
            stops: [0.9, 1.0],
            begin: AlignmentDirectional(0.0, -1.0),
            end: AlignmentDirectional(0, 1.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            width: () {
              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                return double.infinity;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                return double.infinity;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                return 640.0;
              } else {
                return 640.0;
              }
            }(),
            height: 48.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.0,
                  color: FlutterFlowTheme.of(context).shapeShadow,
                  offset: Offset(
                    4.0,
                    4.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              height: 100.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8.0,
                    color: FlutterFlowTheme.of(context).shapeHighlight,
                    offset: Offset(
                      -4.0,
                      -4.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8.0,
                      color: FlutterFlowTheme.of(context).shapeShadowLight,
                      offset: Offset(
                        4.0,
                        4.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12.0,
                        color: FlutterFlowTheme.of(context).shapeHighlight,
                        offset: Offset(
                          -8.0,
                          -8.0,
                        ),
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).btnGradientB,
                        FlutterFlowTheme.of(context).btnGradientA
                      ],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.03, 1.0),
                      end: AlignmentDirectional(-0.03, -1.0),
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      width: 0.4,
                    ),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.icon!,
                        Expanded(
                          child: Text(
                            widget.label,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Container(
                          width: 20.0,
                          decoration: BoxDecoration(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
