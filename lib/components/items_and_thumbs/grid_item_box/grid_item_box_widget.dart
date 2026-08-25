import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'grid_item_box_model.dart';
export 'grid_item_box_model.dart';

class GridItemBoxWidget extends StatefulWidget {
  const GridItemBoxWidget({
    super.key,
    this.listTitle,
    this.listDescription,
    this.thumbUrl1,
    this.thumbUrl2,
    this.thumbUrl3,
  });

  final String? listTitle;
  final String? listDescription;
  final String? thumbUrl1;
  final String? thumbUrl2;
  final String? thumbUrl3;

  @override
  State<GridItemBoxWidget> createState() => _GridItemBoxWidgetState();
}

class _GridItemBoxWidgetState extends State<GridItemBoxWidget> {
  late GridItemBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GridItemBoxModel());

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

    return Align(
      alignment: AlignmentDirectional(-1.0, 1.0),
      child: Container(
        width: 114.0,
        height: 188.0,
        decoration: BoxDecoration(),
        alignment: AlignmentDirectional(-1.0, 1.0),
        child: Align(
          alignment: AlignmentDirectional(-1.0, 1.0),
          child: Container(
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional(-1.0, 1.0),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/images/collection_bottom_dark.png'
                        : 'assets/images/collection_bottom.png',
                    fit: BoxFit.cover,
                    alignment: Alignment(-1.0, -1.0),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                    child: Container(
                      width: 98.0,
                      height: 140.0,
                      child: Stack(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 2.0),
                              child: Transform.rotate(
                                angle: 0.0 * (math.pi / 180),
                                child: custom_widgets.ComicCover(
                                  width: 84.0,
                                  height: 104.0,
                                  imageUrl: () {
                                    if (widget.thumbUrl3 != null &&
                                        widget.thumbUrl3 != '') {
                                      return widget.thumbUrl3;
                                    } else if ((widget.thumbUrl3 == null ||
                                            widget.thumbUrl3 == '') &&
                                        (widget.thumbUrl2 != null &&
                                            widget.thumbUrl2 != '')) {
                                      return widget.thumbUrl2;
                                    } else {
                                      return widget.thumbUrl1;
                                    }
                                  }(),
                                  titleName: '',
                                  issueNumber: '',
                                  titleId: '',
                                  spineHeight: 3.0,
                                  cornersRight: 3.0,
                                  cornersLeft: 0.0,
                                  shadowX: 2.0,
                                  alignBottom: true,
                                  enableLightbox: false,
                                  isAdult: false,
                                  canSeeAdult: functions.canSeeAdultContent(
                                      FFAppState().currentUserBirthDateString,
                                      FFAppState().adultContentEnabled),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 4.0, 6.0),
                              child: Transform.rotate(
                                angle: 0.0 * (math.pi / 180),
                                child: Visibility(
                                  visible: widget.thumbUrl2 != null &&
                                      widget.thumbUrl2 != '',
                                  child: custom_widgets.ComicCover(
                                    width: 84.0,
                                    height: 104.0,
                                    imageUrl: widget.thumbUrl3 != null &&
                                            widget.thumbUrl3 != ''
                                        ? widget.thumbUrl2
                                        : widget.thumbUrl1,
                                    titleName: '',
                                    issueNumber: '',
                                    titleId: '',
                                    spineHeight: 3.0,
                                    cornersRight: 3.0,
                                    cornersLeft: 0.0,
                                    shadowX: 2.0,
                                    alignBottom: true,
                                    enableLightbox: false,
                                    isAdult: false,
                                    canSeeAdult: functions.canSeeAdultContent(
                                        FFAppState().currentUserBirthDateString,
                                        FFAppState().adultContentEnabled),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 10.0),
                              child: Transform.rotate(
                                angle: 0.0 * (math.pi / 180),
                                child: Visibility(
                                  visible: widget.thumbUrl3 != null &&
                                      widget.thumbUrl3 != '',
                                  child: custom_widgets.ComicCover(
                                    width: 84.0,
                                    height: 104.0,
                                    imageUrl: widget.thumbUrl1,
                                    titleName: '',
                                    issueNumber: '',
                                    titleId: '',
                                    spineHeight: 3.0,
                                    cornersRight: 3.0,
                                    cornersLeft: 0.0,
                                    shadowX: 2.0,
                                    alignBottom: true,
                                    enableLightbox: false,
                                    isAdult: false,
                                    canSeeAdult: functions.canSeeAdultContent(
                                        FFAppState().currentUserBirthDateString,
                                        FFAppState().adultContentEnabled),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/images/collection_top_dark.png'
                        : 'assets/images/collection_top.png',
                    fit: BoxFit.cover,
                    alignment: Alignment(-1.0, -1.0),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 0.0, 23.0),
                    child: Transform.rotate(
                      angle: 357.0 * (math.pi / 180),
                      child: Container(
                        width: 72.0,
                        height: 24.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: AutoSizeText(
                          valueOrDefault<String>(
                            widget.listTitle,
                            'Lista de HQs',
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          minFontSize: 7.0,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.permanentMarker(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.black,
                                    fontSize: 9.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.0,
                                  ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
