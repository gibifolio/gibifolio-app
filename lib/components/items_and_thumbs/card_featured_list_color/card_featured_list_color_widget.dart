import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_featured_list_color_model.dart';
export 'card_featured_list_color_model.dart';

class CardFeaturedListColorWidget extends StatefulWidget {
  const CardFeaturedListColorWidget({
    super.key,
    String? listName,
    String? thumb1,
    String? thumb2,
    String? thumb3,
    this.bgColor,
  })  : this.listName = listName ?? 'Lista de HQs e mangás',
        this.thumb1 = thumb1 ?? 'thumb1',
        this.thumb2 = thumb2 ?? 'thumb2',
        this.thumb3 = thumb3 ?? 'thumb3';

  final String listName;
  final String thumb1;
  final String thumb2;
  final String thumb3;
  final Color? bgColor;

  @override
  State<CardFeaturedListColorWidget> createState() =>
      _CardFeaturedListColorWidgetState();
}

class _CardFeaturedListColorWidgetState
    extends State<CardFeaturedListColorWidget> {
  late CardFeaturedListColorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardFeaturedListColorModel());

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

    return Container(
      width: 300.0,
      height: 200.0,
      constraints: BoxConstraints(
        maxWidth: 400.0,
      ),
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
        child: Container(
          width: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional(-1.0, -1.0),
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        widget.bgColor,
                        FlutterFlowTheme.of(context).accent1,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Container(
                            height: 40.0,
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: AutoSizeText(
                                widget.listName,
                                maxLines: 2,
                                minFontSize: 16.0,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.fraunces(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                      lineHeight: 1.2,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: custom_widgets.ComicCover(
                                      width: 72.0,
                                      height: 104.0,
                                      imageUrl:
                                          'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${widget.thumb1}',
                                      titleName: '',
                                      issueNumber: '',
                                      titleId: '',
                                      spineHeight: 4.0,
                                      alignBottom: true,
                                      enableLightbox: false,
                                      isAdult: false,
                                      canSeeAdult: functions.canSeeAdultContent(
                                          FFAppState()
                                              .currentUserBirthDateString,
                                          FFAppState().adultContentEnabled),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: custom_widgets.ComicCover(
                                      width: 72.0,
                                      height: 104.0,
                                      imageUrl:
                                          'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${widget.thumb2}',
                                      titleName: '',
                                      issueNumber: '',
                                      titleId: '',
                                      spineHeight: 4.0,
                                      alignBottom: true,
                                      enableLightbox: false,
                                      isAdult: false,
                                      canSeeAdult: functions.canSeeAdultContent(
                                          FFAppState()
                                              .currentUserBirthDateString,
                                          FFAppState().adultContentEnabled),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: custom_widgets.ComicCover(
                                      width: 72.0,
                                      height: 104.0,
                                      imageUrl:
                                          'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${widget.thumb3}',
                                      titleName: '',
                                      issueNumber: '',
                                      titleId: '',
                                      spineHeight: 4.0,
                                      alignBottom: true,
                                      enableLightbox: false,
                                      isAdult: false,
                                      canSeeAdult: functions.canSeeAdultContent(
                                          FFAppState()
                                              .currentUserBirthDateString,
                                          FFAppState().adultContentEnabled),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
