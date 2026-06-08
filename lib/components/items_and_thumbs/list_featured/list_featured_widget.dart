import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'list_featured_model.dart';
export 'list_featured_model.dart';

class ListFeaturedWidget extends StatefulWidget {
  const ListFeaturedWidget({
    super.key,
    String? listTitle,
    String? listDescription,
    this.thumbUrl1,
    this.thumbUrl2,
    this.thumbUrl3,
    this.colorBg,
  })  : this.listTitle = listTitle ?? 'Título da Lista',
        this.listDescription = listDescription ?? 'Descrição da lista';

  /// List Title
  final String listTitle;

  /// List description
  final String listDescription;

  final String? thumbUrl1;
  final String? thumbUrl2;
  final String? thumbUrl3;
  final String? colorBg;

  @override
  State<ListFeaturedWidget> createState() => _ListFeaturedWidgetState();
}

class _ListFeaturedWidgetState extends State<ListFeaturedWidget> {
  late ListFeaturedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListFeaturedModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          width: double.infinity,
          height: 136.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 0.33,
                  ),
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.listTitle,
                            'Lista de HQs',
                          ),
                          maxLines: 4,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                    lineHeight: 1.2,
                                  ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (false)
                        Text(
                          valueOrDefault<String>(
                            widget.listDescription,
                            'Descrição',
                          ),
                          maxLines: 2,
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                    lineHeight: 1.2,
                                  ),
                          overflow: TextOverflow.ellipsis,
                        ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
                if (!((widget.thumbUrl1 == null || widget.thumbUrl1 == '') &&
                    (widget.thumbUrl2 == null || widget.thumbUrl2 == '') &&
                    (widget.thumbUrl3 == null || widget.thumbUrl3 == '')))
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (widget.thumbUrl1 != null &&
                            widget.thumbUrl1 != '')
                          custom_widgets.ComicCover(
                            width: 64.0,
                            height: 80.0,
                            imageUrl: widget.thumbUrl1,
                            spineHeight: 3.0,
                          ),
                        if ((widget.thumbUrl2 != null &&
                                widget.thumbUrl2 != '') &&
                            (widget.thumbUrl2 != 'null'))
                          custom_widgets.ComicCover(
                            width: 64.0,
                            height: 80.0,
                            imageUrl: widget.thumbUrl2,
                            spineHeight: 3.0,
                          ),
                        if ((widget.thumbUrl3 != null &&
                                widget.thumbUrl3 != '') &&
                            (widget.thumbUrl3 != 'null'))
                          custom_widgets.ComicCover(
                            width: 64.0,
                            height: 80.0,
                            imageUrl: widget.thumbUrl3,
                            spineHeight: 3.0,
                          ),
                      ]
                          .divide(SizedBox(width: 8.0))
                          .addToEnd(SizedBox(width: 16.0)),
                    ),
                  ),
                if ((widget.thumbUrl1 == null || widget.thumbUrl1 == '') &&
                    (widget.thumbUrl2 == null || widget.thumbUrl2 == '') &&
                    (widget.thumbUrl3 == null || widget.thumbUrl3 == ''))
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Opacity(
                        opacity: 0.3,
                        child: Text(
                          'Lista vazia :(',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ),
                  ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
