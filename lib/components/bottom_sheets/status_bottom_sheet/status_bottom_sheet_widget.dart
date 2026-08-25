import '/backend/supabase/supabase.dart';
import '/components/bottom_sheets/create_list_bottom_sheet/create_list_bottom_sheet_widget.dart';
import '/components/items_and_thumbs/list_featured/list_featured_widget.dart';
import '/components/skeletons/list_featured_loading_compact/list_featured_loading_compact_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'status_bottom_sheet_model.dart';
export 'status_bottom_sheet_model.dart';

class StatusBottomSheetWidget extends StatefulWidget {
  const StatusBottomSheetWidget({
    super.key,
    this.issueId,
    this.initialReading,
    this.initialOwnership,
    this.onSaved,
    this.titleId,
    String? entityType,
    bool? isBulk,
    bool? isSingleIssue,
  })  : this.entityType = entityType ?? 'issue',
        this.isBulk = isBulk ?? false,
        this.isSingleIssue = isSingleIssue ?? false;

  final String? issueId;
  final String? initialReading;
  final String? initialOwnership;
  final Future Function()? onSaved;
  final String? titleId;
  final String entityType;
  final bool isBulk;
  final bool isSingleIssue;

  @override
  State<StatusBottomSheetWidget> createState() =>
      _StatusBottomSheetWidgetState();
}

class _StatusBottomSheetWidgetState extends State<StatusBottomSheetWidget> {
  late StatusBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusBottomSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.fetchedListIds = await actions.fetchItemListIds(
        widget.entityType == 'title' ? widget.titleId! : widget.issueId!,
      );
      _model.selectedReading = widget.initialReading;
      _model.selectedOwnership = widget.initialOwnership;
      _model.itemListIds = _model.fetchedListIds!.toList().cast<String>();
      safeSetState(() {});
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
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
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
            height: MediaQuery.sizeOf(context).height * 0.8,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 520.0,
                      maxHeight: MediaQuery.sizeOf(context).height * 0.8,
                    ),
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (!true)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.initialReading,
                                      'initial reading',
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
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    ' • ',
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
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.initialOwnership,
                                      'initial ownership',
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
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          Container(
                            width: double.infinity,
                            height: 24.0,
                            decoration: BoxDecoration(),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Coleção',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    if (widget.isBulk)
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await actions
                                              .bulkUpdateIssueOwnershipStatus(
                                            '',
                                            widget.titleId!,
                                          );
                                        },
                                        text: 'REMOVER',
                                        icon: Icon(
                                          FFIcons.kdismiss,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          iconAlignment: IconAlignment.end,
                                          iconPadding: EdgeInsets.all(0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (widget.isBulk) {
                                              await actions
                                                  .bulkUpdateIssueOwnershipStatus(
                                                'wanted',
                                                widget.titleId!,
                                              );
                                              _model.selectedOwnership =
                                                  'wanted';
                                              safeSetState(() {});
                                            } else {
                                              if (widget.entityType ==
                                                  'title') {
                                                if (_model.selectedOwnership ==
                                                    'wanted') {
                                                  await actions
                                                      .updateTitleOwnershipStatus(
                                                    widget.titleId!,
                                                    null,
                                                    widget.isSingleIssue,
                                                  );
                                                  _model.selectedOwnership =
                                                      null;
                                                  safeSetState(() {});
                                                } else {
                                                  await actions
                                                      .updateTitleOwnershipStatus(
                                                    widget.titleId!,
                                                    'wanted',
                                                    widget.isSingleIssue,
                                                  );
                                                  _model.selectedOwnership =
                                                      'wanted';
                                                  safeSetState(() {});
                                                }
                                              } else {
                                                if (_model.selectedOwnership ==
                                                    'wanted') {
                                                  await actions
                                                      .updateOwnershipStatus(
                                                    widget.issueId!,
                                                    widget.titleId!,
                                                    '',
                                                  );
                                                  _model.selectedOwnership =
                                                      'null';
                                                  safeSetState(() {});
                                                } else {
                                                  await actions
                                                      .updateOwnershipStatus(
                                                    widget.issueId!,
                                                    widget.titleId!,
                                                    'wanted',
                                                  );
                                                  _model.selectedOwnership =
                                                      'wanted';
                                                  safeSetState(() {});
                                                }
                                              }
                                            }

                                            FFAppState().needsLibraryRefresh =
                                                true;
                                            await widget.onSaved?.call();

                                            FFAppState().update(() {});
                                          },
                                          text: 'Quero',
                                          icon: Icon(
                                            Icons.auto_awesome,
                                            size: 20.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 8.0, 12.0, 8.0),
                                            iconPadding: EdgeInsets.all(0.0),
                                            iconColor: valueOrDefault<Color>(
                                              _model.selectedOwnership ==
                                                      'wanted'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primary,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            color: valueOrDefault<Color>(
                                              _model.selectedOwnership ==
                                                      'wanted'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: valueOrDefault<Color>(
                                                    _model.selectedOwnership ==
                                                            'wanted'
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: valueOrDefault<Color>(
                                                _model.selectedOwnership ==
                                                        'wanted'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                              ),
                                              width: 0.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(24.0),
                                              topRight: Radius.circular(8.0),
                                              bottomLeft: Radius.circular(24.0),
                                              bottomRight: Radius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (widget.isBulk) {
                                              await actions
                                                  .bulkUpdateIssueOwnershipStatus(
                                                'owned',
                                                widget.titleId!,
                                              );
                                              _model.selectedOwnership =
                                                  'owned';
                                              safeSetState(() {});
                                            } else {
                                              if (widget.entityType ==
                                                  'title') {
                                                if (_model.selectedOwnership ==
                                                    'owned') {
                                                  await actions
                                                      .updateTitleOwnershipStatus(
                                                    widget.titleId!,
                                                    '',
                                                    widget.isSingleIssue,
                                                  );
                                                  _model.selectedOwnership =
                                                      null;
                                                  safeSetState(() {});
                                                } else {
                                                  await actions
                                                      .updateTitleOwnershipStatus(
                                                    widget.titleId!,
                                                    'owned',
                                                    widget.isSingleIssue,
                                                  );
                                                  _model.selectedOwnership =
                                                      'owned';
                                                  safeSetState(() {});
                                                }
                                              } else {
                                                if (_model.selectedOwnership ==
                                                    'owned') {
                                                  await actions
                                                      .updateOwnershipStatus(
                                                    widget.issueId!,
                                                    widget.titleId!,
                                                    '',
                                                  );
                                                  _model.selectedOwnership =
                                                      'null';
                                                  safeSetState(() {});
                                                } else {
                                                  await actions
                                                      .updateOwnershipStatus(
                                                    widget.issueId!,
                                                    widget.titleId!,
                                                    'owned',
                                                  );
                                                  _model.selectedOwnership =
                                                      'owned';
                                                  safeSetState(() {});
                                                }
                                              }
                                            }

                                            FFAppState().needsLibraryRefresh =
                                                true;
                                            await widget.onSaved?.call();

                                            FFAppState().update(() {});
                                          },
                                          text: 'Tenho',
                                          icon: Icon(
                                            Icons.shelves,
                                            size: 20.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 8.0, 12.0, 8.0),
                                            iconPadding: EdgeInsets.all(0.0),
                                            iconColor: valueOrDefault<Color>(
                                              _model.selectedOwnership ==
                                                      'owned'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primary,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            color: valueOrDefault<Color>(
                                              _model.selectedOwnership ==
                                                      'owned'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: valueOrDefault<Color>(
                                                    _model.selectedOwnership ==
                                                            'owned'
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: valueOrDefault<Color>(
                                                _model.selectedOwnership ==
                                                        'owned'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                              ),
                                              width: 0.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(24.0),
                                              bottomLeft: Radius.circular(8.0),
                                              bottomRight:
                                                  Radius.circular(24.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Leitura',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    if (widget.isBulk)
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await actions
                                              .bulkUpdateIssueReadingStatus(
                                            '',
                                            widget.titleId!,
                                          );
                                        },
                                        text: 'REMOVER',
                                        icon: Icon(
                                          FFIcons.kdismiss,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          iconAlignment: IconAlignment.end,
                                          iconPadding: EdgeInsets.all(0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (widget.isBulk) {
                                              await actions
                                                  .bulkUpdateIssueReadingStatus(
                                                'reading',
                                                widget.titleId!,
                                              );
                                              _model.selectedReading =
                                                  'reading';
                                              safeSetState(() {});
                                            } else {
                                              if (widget.entityType ==
                                                  'title') {
                                                if (_model.selectedReading ==
                                                    'reading') {
                                                  await actions
                                                      .updateTitleReadingStatus(
                                                    widget.titleId!,
                                                    null,
                                                    widget.isSingleIssue,
                                                  );
                                                  _model.selectedReading =
                                                      'null';
                                                  safeSetState(() {});
                                                } else {
                                                  await actions
                                                      .updateTitleReadingStatus(
                                                    widget.titleId!,
                                                    'reading',
                                                    widget.isSingleIssue,
                                                  );
                                                  _model.selectedReading =
                                                      'reading';
                                                  safeSetState(() {});
                                                }
                                              } else {
                                                if (_model.selectedReading ==
                                                    'reading') {
                                                  await actions
                                                      .updateReadingStatus(
                                                    widget.issueId!,
                                                    widget.titleId!,
                                                    '',
                                                  );
                                                  _model.selectedReading =
                                                      'null';
                                                  safeSetState(() {});
                                                } else {
                                                  await actions
                                                      .updateReadingStatus(
                                                    widget.issueId!,
                                                    widget.titleId!,
                                                    'reading',
                                                  );
                                                  _model.selectedReading =
                                                      'reading';
                                                  safeSetState(() {});
                                                }
                                              }
                                            }

                                            FFAppState().needsLibraryRefresh =
                                                true;
                                            await widget.onSaved?.call();

                                            FFAppState().update(() {});
                                          },
                                          text: 'Lendo',
                                          icon: FaIcon(
                                            FontAwesomeIcons.glasses,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 8.0, 12.0, 8.0),
                                            iconPadding: EdgeInsets.all(0.0),
                                            iconColor: valueOrDefault<Color>(
                                              _model.selectedReading ==
                                                      'reading'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primary,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            color: valueOrDefault<Color>(
                                              _model.selectedReading ==
                                                      'reading'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: valueOrDefault<Color>(
                                                    _model.selectedReading ==
                                                            'reading'
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: valueOrDefault<Color>(
                                                _model.selectedReading ==
                                                        'reading'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                              ),
                                              width: 0.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(24.0),
                                              topRight: Radius.circular(8.0),
                                              bottomLeft: Radius.circular(24.0),
                                              bottomRight: Radius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (widget.isBulk) {
                                              await actions
                                                  .bulkUpdateIssueReadingStatus(
                                                'read',
                                                widget.titleId!,
                                              );
                                              _model.selectedReading = 'read';
                                              safeSetState(() {});
                                            } else {
                                              if (widget.entityType ==
                                                  'title') {
                                                if (_model.selectedReading ==
                                                    'read') {
                                                  await actions
                                                      .updateTitleReadingStatus(
                                                    widget.titleId!,
                                                    '',
                                                    widget.isSingleIssue,
                                                  );
                                                  _model.selectedReading =
                                                      'null';
                                                  safeSetState(() {});
                                                } else {
                                                  await actions
                                                      .updateTitleReadingStatus(
                                                    widget.titleId!,
                                                    'read',
                                                    widget.isSingleIssue,
                                                  );
                                                  _model.selectedReading =
                                                      'read';
                                                  safeSetState(() {});
                                                }
                                              } else {
                                                if (_model.selectedReading ==
                                                    'read') {
                                                  await actions
                                                      .updateReadingStatus(
                                                    widget.issueId!,
                                                    widget.titleId!,
                                                    '',
                                                  );
                                                  _model.selectedReading =
                                                      'null';
                                                  safeSetState(() {});
                                                } else {
                                                  await actions
                                                      .updateReadingStatus(
                                                    widget.issueId!,
                                                    widget.titleId!,
                                                    'read',
                                                  );
                                                  _model.selectedReading =
                                                      'read';
                                                  safeSetState(() {});
                                                }
                                              }
                                            }

                                            FFAppState().needsLibraryRefresh =
                                                true;
                                            await widget.onSaved?.call();

                                            FFAppState().update(() {});
                                          },
                                          text: 'Lido',
                                          icon: Icon(
                                            Icons.done_all,
                                            size: 20.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 8.0, 12.0, 8.0),
                                            iconPadding: EdgeInsets.all(0.0),
                                            iconColor: valueOrDefault<Color>(
                                              _model.selectedReading == 'read'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primary,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            color: valueOrDefault<Color>(
                                              _model.selectedReading == 'read'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: valueOrDefault<Color>(
                                                    _model.selectedReading ==
                                                            'read'
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: valueOrDefault<Color>(
                                                _model.selectedReading == 'read'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                              ),
                                              width: 0.0,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(24.0),
                                              bottomLeft: Radius.circular(8.0),
                                              bottomRight:
                                                  Radius.circular(24.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Minhas listas',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                        minHeight: 40.0,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child:
                                                    CreateListBottomSheetWidget(
                                                  onListCreated: () async {
                                                    await ListItemsTable()
                                                        .insert({
                                                      'list_id': FFAppState()
                                                          .newlyCreatedListId,
                                                      'entity_type':
                                                          widget.entityType,
                                                      'entity_id':
                                                          widget.entityType ==
                                                                  'issue'
                                                              ? widget.issueId
                                                              : widget.titleId,
                                                      'position': 0,
                                                      'added_at': supaSerialize<
                                                              DateTime>(
                                                          getCurrentTimestamp),
                                                    });
                                                    _model.addToItemListIds(
                                                        FFAppState()
                                                            .newlyCreatedListId);
                                                    safeSetState(() {});
                                                    safeSetState(() => _model
                                                            .requestCompleter =
                                                        null);
                                                    safeSetState(() {});
                                                  },
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        text: 'Criar lista',
                                        icon: Icon(
                                          Icons.add,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              decoration: BoxDecoration(),
                              child: FutureBuilder<List<AppUserCustomListsRow>>(
                                future: (_model.requestCompleter ??= Completer<
                                        List<AppUserCustomListsRow>>()
                                      ..complete(
                                          AppUserCustomListsTable().queryRows(
                                        queryFn: (q) => q.order('updated_at'),
                                      )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return ListFeaturedLoadingCompactWidget();
                                  }
                                  List<AppUserCustomListsRow>
                                      listViewAppUserCustomListsRowList =
                                      snapshot.data!;

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewAppUserCustomListsRowList
                                        .length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewAppUserCustomListsRow =
                                          listViewAppUserCustomListsRowList[
                                              listViewIndex];
                                      return AnimatedContainer(
                                        duration: Duration(milliseconds: 860),
                                        curve: Curves.easeInOut,
                                        decoration: BoxDecoration(),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (widget.isBulk) {
                                              await actions.bulkToggleList(
                                                listViewAppUserCustomListsRow
                                                    .listId!,
                                              );
                                              _model.addToItemListIds(
                                                  listViewAppUserCustomListsRow
                                                      .listId!);
                                              safeSetState(() {});
                                            } else {
                                              if (_model.itemListIds.contains(
                                                  listViewAppUserCustomListsRow
                                                      .listId)) {
                                                _model.removeItemFromList =
                                                    await ListItemsTable()
                                                        .delete(
                                                  matchingRows: (rows) => rows
                                                      .eqOrNull(
                                                        'list_id',
                                                        listViewAppUserCustomListsRow
                                                            .listId,
                                                      )
                                                      .eqOrNull(
                                                        'entity_id',
                                                        widget.entityType ==
                                                                'title'
                                                            ? widget.titleId
                                                            : widget.issueId,
                                                      ),
                                                  returnRows: true,
                                                );
                                                _model.removeFromItemListIds(
                                                    listViewAppUserCustomListsRow
                                                        .listId!);
                                                safeSetState(() {});
                                              } else {
                                                await ListItemsTable().insert({
                                                  'list_id':
                                                      listViewAppUserCustomListsRow
                                                          .listId,
                                                  'entity_id':
                                                      widget.entityType ==
                                                              'title'
                                                          ? widget.titleId
                                                          : widget.issueId,
                                                  'entity_type':
                                                      widget.entityType,
                                                  'added_at':
                                                      supaSerialize<DateTime>(
                                                          getCurrentTimestamp),
                                                });
                                                _model.addToItemListIds(
                                                    listViewAppUserCustomListsRow
                                                        .listId!);
                                                safeSetState(() {});
                                              }
                                            }

                                            FFAppState().needsLibraryRefresh =
                                                true;
                                            FFAppState().update(() {});

                                            safeSetState(() {});
                                          },
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(1.0, 1.0),
                                            children: [
                                              wrapWithModel(
                                                model: _model.listFeaturedModels
                                                    .getModel(
                                                  listViewAppUserCustomListsRow
                                                      .listId!,
                                                  listViewIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ListFeaturedWidget(
                                                  key: Key(
                                                    'Key44q_${listViewAppUserCustomListsRow.listId!}',
                                                  ),
                                                  listTitle:
                                                      listViewAppUserCustomListsRow
                                                          .listName,
                                                  listDescription:
                                                      listViewAppUserCustomListsRow
                                                          .description,
                                                  thumbUrl1:
                                                      'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listViewAppUserCustomListsRow.thumb1}',
                                                  thumbUrl2:
                                                      'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listViewAppUserCustomListsRow.thumb2}',
                                                  thumbUrl3:
                                                      'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listViewAppUserCustomListsRow.thumb3}',
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 16.0, 8.0),
                                                  child: Container(
                                                    width: 64.0,
                                                    height: 136.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(
                                                                16.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                16.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        if (_model.itemListIds
                                                            .contains(
                                                                listViewAppUserCustomListsRow
                                                                    .listId))
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
                                                              child: Icon(
                                                                FFIcons
                                                                    .kcheckOn,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 28.0,
                                                              ),
                                                            ),
                                                          ),
                                                        if (!_model.itemListIds
                                                            .contains(
                                                                listViewAppUserCustomListsRow
                                                                    .listId))
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
                                                              child: Icon(
                                                                Icons
                                                                    .add_circle_outline,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 28.0,
                                                              ),
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
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80.0,
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Divider(
                        height: 1.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await actions.clearSelection();
                            Navigator.pop(context);
                          },
                          text: 'Fechar',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            iconPadding: EdgeInsets.all(16.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(24.0),
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
      ),
    );
  }
}
