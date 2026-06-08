import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'grid_item_issue_model.dart';
export 'grid_item_issue_model.dart';

class GridItemIssueWidget extends StatefulWidget {
  const GridItemIssueWidget({
    super.key,
    String? issueId,
    bool? showTitleInfo,
    String? issueNumber,
    String? issueName,
    String? issueSubtitle,
    this.issuePages,
    String? titleName,
    String? titleSubtitle,
    String? publisherName,
    String? licensors,
    this.issueDate,
    String? titleId,
    String? series,
    String? publicationStatus,
    this.indexPosition,
    String? thumb,
    bool? isAdult,
    bool? canSeeAdult,
  })  : this.issueId = issueId ?? '',
        this.showTitleInfo = showTitleInfo ?? false,
        this.issueNumber = issueNumber ?? '',
        this.issueName = issueName ?? '',
        this.issueSubtitle = issueSubtitle ?? '',
        this.titleName = titleName ?? '',
        this.titleSubtitle = titleSubtitle ?? '',
        this.publisherName = publisherName ?? '',
        this.licensors = licensors ?? '',
        this.titleId = titleId ?? '',
        this.series = series ?? '',
        this.publicationStatus = publicationStatus ?? '',
        this.thumb = thumb ?? '',
        this.isAdult = isAdult ?? false,
        this.canSeeAdult = canSeeAdult ?? false;

  final String issueId;
  final bool showTitleInfo;
  final String issueNumber;
  final String issueName;
  final String issueSubtitle;
  final int? issuePages;
  final String titleName;
  final String titleSubtitle;
  final String publisherName;
  final String licensors;
  final DateTime? issueDate;
  final String titleId;
  final String series;
  final String publicationStatus;
  final int? indexPosition;
  final String thumb;
  final bool isAdult;
  final bool canSeeAdult;

  @override
  State<GridItemIssueWidget> createState() => _GridItemIssueWidgetState();
}

class _GridItemIssueWidgetState extends State<GridItemIssueWidget> {
  late GridItemIssueModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GridItemIssueModel());

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
      height: 220.0,
      decoration: BoxDecoration(),
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 120.0,
            decoration: BoxDecoration(),
            alignment: AlignmentDirectional(-1.0, 1.0),
            child: Align(
              alignment: AlignmentDirectional(-1.0, 1.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional(-1.0, 1.0),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Transform.rotate(
                          angle: 0.0 * (math.pi / 180),
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 1.0),
                            child: custom_widgets.ComicCover(
                              width: 72.0,
                              height: 96.0,
                              imageUrl:
                                  widget.thumb != ''
                                      ? widget.thumb
                                      : 'null',
                              titleName: widget.titleName,
                              issueNumber: widget.issueNumber,
                              titleId: widget.titleId,
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
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.titleName}${widget.issueNumber != '' ? ' #${widget.issueNumber}' : ''}',
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                    lineHeight: 1.2,
                                  ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (valueOrDefault<bool>(
                          widget.publisherName != '',
                          true,
                        ))
                          Text(
                            valueOrDefault<String>(
                              widget.publisherName,
                              'Editora',
                            ),
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontStyle,
                                  lineHeight: 1.2,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ].divide(SizedBox(height: 2.0)),
      ),
    );
  }
}
