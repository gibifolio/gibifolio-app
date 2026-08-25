import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'grid_item_list_model.dart';
export 'grid_item_list_model.dart';

class GridItemListWidget extends StatefulWidget {
  const GridItemListWidget({
    super.key,
    this.listTitle,
    this.listDescription,
    this.thumbUrl1,
    this.thumbUrl2,
    this.thumbUrl3,
    this.colorBg,
    this.issueCount,
    this.isPublic,
    this.isAuthorVerified,
    this.listAuthor,
  });

  final String? listTitle;
  final String? listDescription;
  final String? thumbUrl1;
  final String? thumbUrl2;
  final String? thumbUrl3;
  final String? colorBg;
  final String? issueCount;
  final bool? isPublic;
  final bool? isAuthorVerified;
  final String? listAuthor;

  @override
  State<GridItemListWidget> createState() => _GridItemListWidgetState();
}

class _GridItemListWidgetState extends State<GridItemListWidget> {
  late GridItemListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GridItemListModel());

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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Container(
                width: double.infinity,
                height: 112.0,
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    child: Stack(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 1.0),
                          child: Transform.rotate(
                            angle: 0.0 * (math.pi / 180),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 1.0),
                              child: custom_widgets.ComicCover(
                                width: 64.0,
                                height: 96.0,
                                imageUrl: () {
                                  if ((widget.thumbUrl3 != null &&
                                          widget.thumbUrl3 != '') &&
                                      (widget.thumbUrl2 != null &&
                                          widget.thumbUrl2 != '') &&
                                      (widget.thumbUrl1 != null &&
                                          widget.thumbUrl1 != '')) {
                                    return widget.thumbUrl3;
                                  } else if ((widget.thumbUrl3 == null ||
                                          widget.thumbUrl3 == '') &&
                                      (widget.thumbUrl2 != null &&
                                          widget.thumbUrl2 != '') &&
                                      (widget.thumbUrl1 != null &&
                                          widget.thumbUrl1 != '')) {
                                    return widget.thumbUrl2;
                                  } else if ((widget.thumbUrl3 == null ||
                                          widget.thumbUrl3 == '') &&
                                      (widget.thumbUrl2 == null ||
                                          widget.thumbUrl2 == '') &&
                                      (widget.thumbUrl1 != null &&
                                          widget.thumbUrl1 != '')) {
                                    return widget.thumbUrl1;
                                  } else {
                                    return '';
                                  }
                                }(),
                                spineHeight: 3.0,
                                alignBottom: true,
                                enableLightbox: false,
                              ),
                            ),
                          ),
                        ),
                        if ((widget.thumbUrl1 != null &&
                                widget.thumbUrl1 != '') &&
                            (widget.thumbUrl2 != null &&
                                widget.thumbUrl2 != ''))
                          Align(
                            alignment: AlignmentDirectional(-1.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Transform.rotate(
                                angle: 0.0 * (math.pi / 180),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: custom_widgets.ComicCover(
                                      width: 64.0,
                                      height: 96.0,
                                      imageUrl: () {
                                        if ((widget.thumbUrl3 == null ||
                                                widget.thumbUrl3 == '') &&
                                            (widget.thumbUrl1 != null &&
                                                widget.thumbUrl1 != '')) {
                                          return widget.thumbUrl1;
                                        } else if (widget.thumbUrl2 != null &&
                                            widget.thumbUrl2 != '') {
                                          return widget.thumbUrl2;
                                        } else {
                                          return '';
                                        }
                                      }(),
                                      spineHeight: 3.0,
                                      alignBottom: true,
                                      enableLightbox: false,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if ((widget.thumbUrl3 != null &&
                                widget.thumbUrl3 != '') &&
                            (widget.thumbUrl2 != null &&
                                widget.thumbUrl2 != '') &&
                            (widget.thumbUrl1 != null &&
                                widget.thumbUrl1 != ''))
                          Align(
                            alignment: AlignmentDirectional(-1.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 6.0),
                              child: Transform.rotate(
                                angle: 0.0 * (math.pi / 180),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 0.0, 0.0),
                                    child: custom_widgets.ComicCover(
                                      width: 64.0,
                                      height: 96.0,
                                      imageUrl: widget.thumbUrl1,
                                      spineHeight: 3.0,
                                      alignBottom: true,
                                      enableLightbox: false,
                                    ),
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
            ),
          ),
          Container(
            width: double.infinity,
            height: 56.0,
            decoration: BoxDecoration(),
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.listTitle,
                      'Lista de HQs',
                    ),
                    maxLines: () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return 1;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return 2;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return 3;
                      } else {
                        return 3;
                      }
                    }(),
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                          lineHeight: 1.2,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (widget.isPublic ?? true)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            '@${widget.listAuthor}',
                            'criador',
                          ),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 11.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                    lineHeight: 1.2,
                                  ),
                        ),
                        if (false)
                          Icon(
                            Icons.verified_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 12.0,
                          ),
                      ].divide(SizedBox(width: 4.0)),
                    ),
                ].divide(SizedBox(height: 2.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
