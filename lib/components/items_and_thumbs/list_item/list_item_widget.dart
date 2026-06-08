import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/components/status/issue_status_indicator/issue_status_indicator_widget.dart';
import '/components/status/title_status_indicator/title_status_indicator_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_item_model.dart';
export 'list_item_model.dart';

class ListItemWidget extends StatefulWidget {
  const ListItemWidget({
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
    String? entityType,
    String? entityId,
    String? series,
    String? publicationStatus,
    this.issueCount,
    bool? isSingleIssue,
    String? singleIssueId,
    this.singleIssuePages,
    this.indexPosition,
    String? thumb,
    this.thumb2,
    this.thumb3,
    bool? showDivider,
    this.onTap,
    bool? selectionEnabled,
    bool? showStatus,
    this.onSaved,
    bool? isAdult,
    bool? canSeeAdult,
    bool? showIndex,
  })  : this.issueId = issueId ?? '',
        this.showTitleInfo = showTitleInfo ?? false,
        this.issueNumber = issueNumber ?? '',
        this.issueName = issueName ?? '',
        this.issueSubtitle = issueSubtitle ?? '',
        this.titleName = titleName ?? '',
        this.titleSubtitle = titleSubtitle ?? '',
        this.publisherName = publisherName ?? '',
        this.licensors = licensors ?? '',
        this.entityType = entityType ?? '',
        this.entityId = entityId ?? '',
        this.series = series ?? '',
        this.publicationStatus = publicationStatus ?? '',
        this.isSingleIssue = isSingleIssue ?? false,
        this.singleIssueId = singleIssueId ?? '',
        this.thumb = thumb ?? '',
        this.showDivider = showDivider ?? true,
        this.selectionEnabled = selectionEnabled ?? false,
        this.showStatus = showStatus ?? true,
        this.isAdult = isAdult ?? false,
        this.canSeeAdult = canSeeAdult ?? false,
        this.showIndex = showIndex ?? true;

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
  final String entityType;
  final String entityId;
  final String series;
  final String publicationStatus;
  final int? issueCount;
  final bool isSingleIssue;
  final String singleIssueId;
  final int? singleIssuePages;
  final int? indexPosition;
  final String thumb;
  final String? thumb2;
  final String? thumb3;
  final bool showDivider;
  final Future Function()? onTap;
  final bool selectionEnabled;
  final bool showStatus;
  final Future Function()? onSaved;
  final bool isAdult;
  final bool canSeeAdult;
  final bool showIndex;

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  late ListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListItemModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (FFAppState().isSelectionMode) {
          await actions.toggleSelection(
            widget.issueId,
          );
        } else {
          await widget.onTap?.call();
        }
      },
      onLongPress: () async {
        if (widget.selectionEnabled) {
          if (FFAppState().isSelectionMode) {
            await actions.toggleSelection(
              widget.issueId,
            );
          } else {
            await actions.enterSelectionMode(
              widget.issueId,
            );
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            FFAppState().isSelectionMode &&
                    FFAppState().selectedIds.contains(widget.issueId)
                ? Color(0x3437A3BE)
                : FlutterFlowTheme.of(context).primaryBackground,
            FlutterFlowTheme.of(context).primaryBackground,
          ),
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.showIndex)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: Text(
                          '${functions.indexPositionUpdated(widget.indexPosition).toString()}.',
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
                                  ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: Stack(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        children: [
                          if ((widget.issueCount! > 2) &&
                              (widget.entityType == 'title') &&
                              (widget.thumb3 != null && widget.thumb3 != ''))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 12.0, 0.0, 0.0),
                              child: Transform.rotate(
                                angle: 6.0 * (math.pi / 180),
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  children: [
                                    custom_widgets.ComicCover(
                                      width: 72.0,
                                      height: 80.0,
                                      imageUrl: widget.thumb != ''
                                          ? widget.thumb3
                                          : '',
                                      titleName: widget.titleName,
                                      issueNumber: widget.issueNumber,
                                      titleId: widget.entityId,
                                      spineHeight: 3.0,
                                      alignBottom: false,
                                      enableLightbox: false,
                                      isAdult: widget.isAdult,
                                      canSeeAdult: widget.canSeeAdult,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if ((widget.issueCount! > 1) &&
                              (widget.entityType == 'title') &&
                              (widget.thumb2 != null && widget.thumb2 != ''))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 6.0, 0.0, 0.0),
                              child: Transform.rotate(
                                angle: 3.0 * (math.pi / 180),
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  children: [
                                    custom_widgets.ComicCover(
                                      width: 72.0,
                                      height: 80.0,
                                      imageUrl: widget.thumb != ''
                                          ? widget.thumb2
                                          : '',
                                      titleName: widget.titleName,
                                      issueNumber: widget.issueNumber,
                                      titleId: widget.entityId,
                                      spineHeight: 3.0,
                                      alignBottom: false,
                                      enableLightbox: false,
                                      isAdult: widget.isAdult,
                                      canSeeAdult: widget.canSeeAdult,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          custom_widgets.ComicCover(
                            width: 72.0,
                            height: 80.0,
                            imageUrl:
                                widget.thumb != ''
                                    ? widget.thumb
                                    : '',
                            titleName: widget.titleName,
                            issueNumber: widget.issueNumber,
                            titleId: widget.entityId,
                            spineHeight: 3.0,
                            alignBottom: false,
                            enableLightbox: false,
                            isAdult: widget.isAdult,
                            canSeeAdult: widget.canSeeAdult,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if ((widget.titleName != '') ||
                                (widget.issueNumber != ''))
                              Text(
                                valueOrDefault<String>(
                                  () {
                                    if (widget.showTitleInfo &&
                                        (widget.issueNumber != '')) {
                                      return '${widget.titleName} #${widget.issueNumber}';
                                    } else if (widget.showTitleInfo &&
                                        (widget.issueNumber == '')) {
                                      return widget.titleName;
                                    } else if (widget.issueNumber != '') {
                                      return '#${widget.issueNumber}';
                                    } else {
                                      return widget.titleName;
                                    }
                                  }(),
                                  'Título',
                                ),
                                maxLines: 3,
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                      lineHeight: 1.2,
                                    ),
                              ),
                            if (widget.series != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 4.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.series,
                                    'Série',
                                  ),
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (widget.showTitleInfo)
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        if (widget.titleSubtitle != '')
                                          Text(
                                            valueOrDefault<String>(
                                              widget.titleSubtitle,
                                              'Subtítulo',
                                            ),
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                  lineHeight: 1.2,
                                                ),
                                          ),
                                      ],
                                    ),
                                  if (widget.entityType == 'issue')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          if (widget.issueName != '')
                                            Text(
                                              valueOrDefault<String>(
                                                widget.issueName,
                                                'Título edição',
                                              ),
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                        lineHeight: 1.2,
                                                      ),
                                            ),
                                          if (widget.issueSubtitle != '')
                                            Text(
                                              valueOrDefault<String>(
                                                widget.issueSubtitle,
                                                'Subtítulo edição',
                                              ),
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                        lineHeight: 1.2,
                                                      ),
                                            ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    spacing: 0.0,
                                    runSpacing: 0.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      if (widget.licensors != '')
                                        Text(
                                          valueOrDefault<String>(
                                            widget.licensors,
                                            'Licenciadores',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                                lineHeight: 1.2,
                                              ),
                                        ),
                                      if ((widget.licensors != '') &&
                                          (widget.publisherName != ''))
                                        Text(
                                          ' • ',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                                lineHeight: 1.2,
                                              ),
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
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                                lineHeight: 1.2,
                                              ),
                                        ),
                                    ],
                                  ),
                                  if (widget.issueDate != null)
                                    Text(
                                      dateTimeFormat(
                                        "yMMMM",
                                        widget.issueDate,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  if ((widget.entityType == 'issue') ||
                                      (widget.issueCount == 1))
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((widget.singleIssuePages !=
                                                null) ||
                                            (widget.issuePages != null))
                                          Text(
                                            valueOrDefault<String>(
                                              () {
                                                if (widget.singleIssuePages !=
                                                    null) {
                                                  return widget
                                                      .singleIssuePages
                                                      ?.toString();
                                                } else if (widget.issuePages !=
                                                    null) {
                                                  return widget.issuePages
                                                      ?.toString();
                                                } else {
                                                  return '';
                                                }
                                              }(),
                                              'Número de ',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        if ((widget.issuePages != null) ||
                                            (widget.singleIssuePages != null))
                                          Text(
                                            ' pgs',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                      ],
                                    ),
                                  Spacer(),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        alignment:
                                            AlignmentDirectional(-1.0, 1.0),
                                        child: Visibility(
                                          visible:
                                              (widget.entityType == 'title') &&
                                                  (widget.issueCount != 1),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 4.0, 4.0, 4.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      widget.issueCount
                                                          ?.toString(),
                                                      '#',
                                                    ),
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 8.0, 4.0),
                                                  child: Text(
                                                    'itens',
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (widget.showStatus)
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Container(
                          width: 64.0,
                          decoration: BoxDecoration(),
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if ((widget.entityType != 'title') ||
                                    ((widget.entityType == 'title') &&
                                        (widget.issueCount == 1)))
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.issueStatusIndicatorModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: IssueStatusIndicatorWidget(
                                        issueId:
                                            widget.singleIssueId != ''
                                                ? widget.singleIssueId
                                                : widget.issueId,
                                        isLarge: false,
                                        titleId: widget.entityId,
                                        entityType: widget.entityType,
                                        isSingleIssue: widget.isSingleIssue,
                                        onSaved: () async {
                                          await widget.onSaved?.call();
                                          FFAppState().needsLibraryRefresh =
                                              true;
                                          safeSetState(() {});
                                          _model.refreshLibrary =
                                              await actions.fetchLibraryTitles(
                                            currentUserUid,
                                          );
                                          FFAppState().libraryTitles = _model
                                              .refreshLibrary!
                                              .toList()
                                              .cast<LibraryTitleItemStruct>();
                                          FFAppState().update(() {});

                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                if ((widget.entityType == 'title') &&
                                    (widget.issueCount! > 1))
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.titleStatusIndicatorModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: TitleStatusIndicatorWidget(
                                        isLarge: false,
                                        titleId: widget.entityId,
                                        entityType: widget.entityType,
                                        isSingleIssue: widget.isSingleIssue,
                                        onSaved: () async {
                                          await widget.onSaved?.call();
                                          FFAppState().needsLibraryRefresh =
                                              true;
                                          safeSetState(() {});
                                          _model.refreshLibraryB =
                                              await actions.fetchLibraryTitles(
                                            currentUserUid,
                                          );
                                          FFAppState().libraryTitles = _model
                                              .refreshLibraryB!
                                              .toList()
                                              .cast<LibraryTitleItemStruct>();
                                          FFAppState().update(() {});

                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                if (false)
                                  Text(
                                    widget.issueId,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (widget.showDivider)
              Divider(
                height: 1.0,
                thickness: 1.0,
                color: valueOrDefault<Color>(
                  FFAppState().isSelectionMode &&
                          FFAppState().selectedIds.contains(widget.issueId)
                      ? FlutterFlowTheme.of(context).primaryBackground
                      : FlutterFlowTheme.of(context).alternate,
                  FlutterFlowTheme.of(context).primaryBackground,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
