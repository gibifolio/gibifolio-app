import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_sheets/status_bottom_sheet/status_bottom_sheet_widget.dart';
import '/components/skeletons/status_indicator_skeleton/status_indicator_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'issue_status_indicator_model.dart';
export 'issue_status_indicator_model.dart';

class IssueStatusIndicatorWidget extends StatefulWidget {
  const IssueStatusIndicatorWidget({
    super.key,
    required this.issueId,
    bool? isLarge,
    this.titleId,
    this.entityType,
    this.onSaved,
    bool? isSingleIssue,
  })  : this.isLarge = isLarge ?? false,
        this.isSingleIssue = isSingleIssue ?? false;

  final String? issueId;
  final bool isLarge;
  final String? titleId;
  final String? entityType;
  final Future Function()? onSaved;
  final bool isSingleIssue;

  @override
  State<IssueStatusIndicatorWidget> createState() =>
      _IssueStatusIndicatorWidgetState();
}

class _IssueStatusIndicatorWidgetState
    extends State<IssueStatusIndicatorWidget> {
  late IssueStatusIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IssueStatusIndicatorModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isLarge) {
        _model.iconSize = 20.0;
        _model.padding = 16;
        _model.labelSize = 16.0;
        _model.bgColor = FlutterFlowTheme.of(context).secondaryBackground;
        _model.strokeColor = FlutterFlowTheme.of(context).alternate;
        _model.maxWidth = 48.0;
        safeSetState(() {});
      } else {
        _model.iconSize = 20.0;
        _model.padding = 0;
        _model.labelSize = 10.0;
        _model.bgColor = FlutterFlowTheme.of(context).transparent;
        _model.strokeColor = Color(0x00000000);
        _model.maxWidth = 24.0;
        safeSetState(() {});
      }
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
    return Align(
      alignment: AlignmentDirectional(1.0, 0.0),
      child: FutureBuilder<List<UserIssueStatusRow>>(
        future: UserIssueStatusTable().querySingleRow(
          queryFn: (q) => q
              .eqOrNull(
                'issue_id',
                widget.issueId,
              )
              .eqOrNull(
                'user_id',
                currentUserUid,
              ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Container(
              width: widget.isLarge == true ? double.infinity : 24.0,
              height: widget.isLarge == true ? 48.0 : 24.0,
              child: StatusIndicatorSkeletonWidget(),
            );
          }
          List<UserIssueStatusRow> containerUserIssueStatusRowList =
              snapshot.data!;

          final containerUserIssueStatusRow =
              containerUserIssueStatusRowList.isNotEmpty
                  ? containerUserIssueStatusRowList.first
                  : null;

          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (currentUserUid != '') {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: StatusBottomSheetWidget(
                        issueId: widget.issueId,
                        initialOwnership:
                            containerUserIssueStatusRow?.statusOwnership,
                        initialReading:
                            containerUserIssueStatusRow?.statusReading,
                        titleId: widget.titleId,
                        entityType: widget.entityType,
                        isSingleIssue: widget.isSingleIssue,
                        onSaved: () async {},
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));

                await widget.onSaved?.call();
              } else {
                context.pushNamed(
                  LoginPageWidget.routeName,
                  extra: <String, dynamic>{
                    '__transition_info__': TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.bottomToTop,
                    ),
                  },
                );
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(valueOrDefault<double>(
                widget.isLarge ? 64.0 : 0.0,
                64.0,
              )),
              child: Container(
                height: 48.0,
                constraints: BoxConstraints(
                  minWidth: 32.0,
                ),
                decoration: BoxDecoration(
                  color: _model.bgColor,
                  borderRadius: BorderRadius.circular(valueOrDefault<double>(
                    widget.isLarge ? 64.0 : 0.0,
                    64.0,
                  )),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: valueOrDefault<double>(
                      widget.isLarge ? 1.0 : 0.0,
                      1.0,
                    ),
                  ),
                ),
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (!widget.isLarge &&
                          ((containerUserIssueStatusRow?.statusReading != 'want_to_read') &&
                              (containerUserIssueStatusRow?.statusReading !=
                                  'reading') &&
                              (containerUserIssueStatusRow?.statusReading !=
                                  'read')) &&
                          ((containerUserIssueStatusRow?.statusOwnership !=
                                  'wanted') &&
                              (containerUserIssueStatusRow?.statusOwnership !=
                                  'ordered') &&
                              (containerUserIssueStatusRow?.statusOwnership !=
                                  'owned')))
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: valueOrDefault<double>(
                              _model.maxWidth,
                              48.0,
                            ),
                            height: valueOrDefault<double>(
                              _model.maxWidth,
                              48.0,
                            ),
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding:
                                      EdgeInsets.all(valueOrDefault<double>(
                                    _model.padding?.toDouble(),
                                    0.0,
                                  )),
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (widget.isLarge &&
                          ((containerUserIssueStatusRow?.statusReading !=
                                  'reading') &&
                              (containerUserIssueStatusRow?.statusReading !=
                                  'read')))
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: valueOrDefault<double>(
                                _model.maxWidth,
                                48.0,
                              ),
                              decoration: BoxDecoration(),
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.add_circle_outline,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                    if ((containerUserIssueStatusRow
                                                ?.statusOwnership !=
                                            'wanted') &&
                                        (containerUserIssueStatusRow
                                                ?.statusOwnership !=
                                            'owned'))
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Adicionar',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    if ((containerUserIssueStatusRow
                                                ?.statusOwnership ==
                                            'wanted') ||
                                        (containerUserIssueStatusRow
                                                ?.statusOwnership ==
                                            'owned'))
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Adicionar leitura',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                  ]
                                      .addToStart(SizedBox(width: 4.0))
                                      .addToEnd(SizedBox(width: 12.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if ((containerUserIssueStatusRow?.statusReading ==
                              'want_to_read') ||
                          (containerUserIssueStatusRow?.statusReading ==
                              'reading') ||
                          (containerUserIssueStatusRow?.statusReading ==
                              'read'))
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Container(
                              width: widget.isLarge
                                  ? double.infinity
                                  : _model.maxWidth,
                              height: valueOrDefault<double>(
                                _model.maxWidth,
                                48.0,
                              ),
                              decoration: BoxDecoration(),
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (containerUserIssueStatusRow
                                                      ?.statusReading ==
                                                  'reading')
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.glasses,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 14.0,
                                                  ),
                                                ),
                                              if (containerUserIssueStatusRow
                                                      ?.statusReading ==
                                                  'read')
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.done_all,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 16.0,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (widget.isLarge)
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                () {
                                                  if (containerUserIssueStatusRow
                                                          ?.statusReading ==
                                                      'want_to_read') {
                                                    return 'Quero ler';
                                                  } else if (containerUserIssueStatusRow
                                                          ?.statusReading ==
                                                      'reading') {
                                                    return 'Lendo';
                                                  } else if (containerUserIssueStatusRow
                                                          ?.statusReading ==
                                                      'read') {
                                                    return 'Lido';
                                                  } else {
                                                    return '';
                                                  }
                                                }(),
                                                'Leitura',
                                              ),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ]
                                      .addToStart(SizedBox(width: 4.0))
                                      .addToEnd(SizedBox(width: 12.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if ((containerUserIssueStatusRow?.statusOwnership ==
                              'wanted') ||
                          (containerUserIssueStatusRow?.statusOwnership ==
                              'ordered') ||
                          (containerUserIssueStatusRow?.statusOwnership ==
                              'owned'))
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Container(
                            width: valueOrDefault<double>(
                              _model.maxWidth,
                              48.0,
                            ),
                            height: valueOrDefault<double>(
                              _model.maxWidth,
                              48.0,
                            ),
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsets.all(valueOrDefault<double>(
                                  _model.padding?.toDouble(),
                                  0.0,
                                )),
                                child: Container(
                                  decoration: BoxDecoration(),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (containerUserIssueStatusRow
                                              ?.statusOwnership ==
                                          'wanted')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.auto_awesome,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 16.0,
                                          ),
                                        ),
                                      if (containerUserIssueStatusRow
                                              ?.statusOwnership ==
                                          'owned')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.shelves,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 16.0,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (false)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            constraints: BoxConstraints(
                              maxWidth: 40.0,
                            ),
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 1.0, 0.0, 0.0),
                                  child: Text(
                                    '0',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (((containerUserIssueStatusRow?.statusReading == 'want_to_read') ||
                              (containerUserIssueStatusRow?.statusReading ==
                                  'reading') ||
                              (containerUserIssueStatusRow?.statusReading ==
                                  'read')) ||
                          ((containerUserIssueStatusRow?.statusOwnership ==
                                  'wanted') ||
                              (containerUserIssueStatusRow?.statusOwnership ==
                                  'ordered') ||
                              (containerUserIssueStatusRow?.statusOwnership ==
                                  'owned')))
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 4.0, 0.0),
                            child: Container(
                              height: valueOrDefault<double>(
                                _model.maxWidth,
                                48.0,
                              ),
                              decoration: BoxDecoration(),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Icon(
                                  Icons.keyboard_control_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ]
                        .divide(SizedBox(width: 0.0))
                        .addToStart(SizedBox(
                            width: valueOrDefault<double>(
                          widget.isLarge ? 12.0 : 0.0,
                          12.0,
                        )))
                        .addToEnd(SizedBox(
                            width: valueOrDefault<double>(
                          widget.isLarge ? 12.0 : 0.0,
                          12.0,
                        ))),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
