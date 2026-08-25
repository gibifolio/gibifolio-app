import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_sheets/status_bottom_sheet/status_bottom_sheet_widget.dart';
import '/components/items_and_thumbs/list_item/list_item_widget.dart';
import '/components/skeletons/list_item_skeleton_l/list_item_skeleton_l_widget.dart';
import '/components/skeletons/title_page_skeleton/title_page_skeleton_widget.dart';
import '/components/status/title_status_indicator/title_status_indicator_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'title_detail_page_model.dart';
export 'title_detail_page_model.dart';

class TitleDetailPageWidget extends StatefulWidget {
  const TitleDetailPageWidget({
    super.key,
    required this.titleId,
    bool? fromLibrary,
    this.readingStatus,
    this.ownershipStatus,
  }) : this.fromLibrary = fromLibrary ?? false;

  final String? titleId;
  final bool fromLibrary;
  final String? readingStatus;
  final String? ownershipStatus;

  static String routeName = 'TitleDetailPage';
  static String routePath = '/titleDetailPage';

  @override
  State<TitleDetailPageWidget> createState() => _TitleDetailPageWidgetState();
}

class _TitleDetailPageWidgetState extends State<TitleDetailPageWidget> {
  late TitleDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TitleDetailPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.clearSelection();
      _model.titleLicensorsList = await actions.fetchTitleLicensors(
        widget.titleId!,
      );
      _model.isFiltered = widget.fromLibrary;
      _model.titleLicensors =
          _model.titleLicensorsList!.toList().cast<LicensorItemStruct>();
      _model.filterReading = widget.readingStatus;
      _model.filterOwnership = widget.ownershipStatus;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<AppTitleDetailRow>>(
      future: (_model.requestCompleter3 ??= Completer<List<AppTitleDetailRow>>()
            ..complete(AppTitleDetailTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'title_id',
                widget.titleId,
              ),
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: TitlePageSkeletonWidget(),
          );
        }
        List<AppTitleDetailRow> titleDetailPageAppTitleDetailRowList =
            snapshot.data!;

        final titleDetailPageAppTitleDetailRow =
            titleDetailPageAppTitleDetailRowList.isNotEmpty
                ? titleDetailPageAppTitleDetailRowList.first
                : null;

        return Title(
            title: 'Gibifolio - Publicação',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                key: scaffoldKey,
                resizeToAvoidBottomInset: false,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                floatingActionButton: Visibility(
                  visible: FFAppState().isSelectionMode,
                  child: FloatingActionButton(
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: StatusBottomSheetWidget(
                                issueId: null,
                                initialReading: null,
                                initialOwnership: null,
                                titleId: widget.titleId,
                                entityType: 'issue',
                                isBulk: true,
                                onSaved: () async {},
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    backgroundColor: FlutterFlowTheme.of(context).primaryText,
                    elevation: 8.0,
                    child: Icon(
                      Icons.add_circle_outline,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                  ),
                ),
                body: NestedScrollView(
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (context, _) => [
                    if (!FFAppState().isSelectionMode)
                      SliverAppBar(
                        pinned: false,
                        floating: true,
                        snap: false,
                        backgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        automaticallyImplyLeading: false,
                        leading: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 60.0,
                          icon: Icon(
                            FFIcons.karrowLeft,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                        actions: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (FFAppState().isAdminUser)
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    Icons.edit_note,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 31.0,
                                  ),
                                  onPressed: () async {
                                    _model.queueTitleResult =
                                        await actions.queueReview(
                                      'title',
                                      widget.titleId!,
                                      '',
                                    );
                                    if (_model.queueTitleResult == 'success') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Enviado para revisão.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                      );
                                    } else {
                                      if (_model.queueTitleResult ==
                                          'already_queued') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Já está na fila para revisão.',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Erro ao adicionar à fila.',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          ),
                                        );
                                      }
                                    }

                                    safeSetState(() {});
                                  },
                                ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 60.0,
                                icon: Icon(
                                  Icons.share,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await actions.shareContent(
                                    'title',
                                    widget.titleId!,
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                        centerTitle: false,
                        elevation: 0.0,
                      )
                  ],
                  body: Builder(
                    builder: (context) {
                      return SafeArea(
                        top: false,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Container(
                            width: () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return double.infinity;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return double.infinity;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 640.0;
                              } else {
                                return 640.0;
                              }
                            }(),
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (FFAppState().isSelectionMode)
                                  SafeArea(
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 620),
                                      curve: Curves.easeInOut,
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderRadius: 8.0,
                                                  buttonSize: 60.0,
                                                  icon: Icon(
                                                    Icons.close_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    await actions
                                                        .clearSelection();
                                                  },
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '${FFAppState().selectedIds.length.toString()} sel.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        await actions
                                                            .toggleSelectAllIssues(
                                                          widget.titleId!,
                                                        );
                                                      },
                                                      text: 'Todos',
                                                      icon: Icon(
                                                        Icons.check_sharp,
                                                        size: 30.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsets.all(0.0),
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: 0.5,
                                            thickness: 0.5,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: RefreshIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      onRefresh: () async {
                                        safeSetState(() {
                                          _model.clearTitleCacheCache();
                                          _model.requestCompleted2 = false;
                                        });
                                        safeSetState(() =>
                                            _model.requestCompleter3 = null);
                                        safeSetState(() =>
                                            _model.requestCompleter1 = null);
                                      },
                                      child: SingleChildScrollView(
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (!FFAppState().isSelectionMode)
                                              AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 610),
                                                curve: Curves.easeInOut,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 24.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.4,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent3,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          32.0,
                                                                          32.0,
                                                                          32.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  if (titleDetailPageAppTitleDetailRow
                                                                              ?.preTitle !=
                                                                          null &&
                                                                      titleDetailPageAppTitleDetailRow
                                                                              ?.preTitle !=
                                                                          '')
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        titleDetailPageAppTitleDetailRow
                                                                            ?.preTitle,
                                                                        'Pré Título',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.fraunces(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            lineHeight:
                                                                                1.2,
                                                                          ),
                                                                    ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      titleDetailPageAppTitleDetailRow
                                                                          ?.titleName,
                                                                      'Publicação',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.fraunces(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .fontStyle,
                                                                          lineHeight:
                                                                              1.2,
                                                                        ),
                                                                  ),
                                                                  if (titleDetailPageAppTitleDetailRow
                                                                              ?.titleSubtitle !=
                                                                          null &&
                                                                      titleDetailPageAppTitleDetailRow
                                                                              ?.titleSubtitle !=
                                                                          '')
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        titleDetailPageAppTitleDetailRow
                                                                            ?.titleSubtitle,
                                                                        'Subtítulo',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                            lineHeight:
                                                                                1.2,
                                                                          ),
                                                                    ),
                                                                  if (titleDetailPageAppTitleDetailRow
                                                                              ?.formatLabel !=
                                                                          null &&
                                                                      titleDetailPageAppTitleDetailRow
                                                                              ?.formatLabel !=
                                                                          '')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent3,
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              7.0,
                                                                              3.0,
                                                                              6.0,
                                                                              5.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              titleDetailPageAppTitleDetailRow?.formatLabel,
                                                                              'Etiqueta de formato',
                                                                            ),
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  lineHeight: 1.2,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      if (titleDetailPageAppTitleDetailRow?.series !=
                                                                              null &&
                                                                          titleDetailPageAppTitleDetailRow?.series !=
                                                                              '')
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            titleDetailPageAppTitleDetailRow?.series,
                                                                            'Série',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      if ((titleDetailPageAppTitleDetailRow?.series != null &&
                                                                              titleDetailPageAppTitleDetailRow?.series !=
                                                                                  '') &&
                                                                          (titleDetailPageAppTitleDetailRow?.publicationStatus != null &&
                                                                              titleDetailPageAppTitleDetailRow?.publicationStatus != ''))
                                                                        Text(
                                                                          ' • ',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      if (titleDetailPageAppTitleDetailRow?.publicationStatus !=
                                                                              null &&
                                                                          titleDetailPageAppTitleDetailRow?.publicationStatus !=
                                                                              '')
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            titleDetailPageAppTitleDetailRow?.publicationStatus,
                                                                            'Status',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      if (titleDetailPageAppTitleDetailRow?.publisherName !=
                                                                              null &&
                                                                          titleDetailPageAppTitleDetailRow?.publisherName !=
                                                                              '')
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  PublisherTitlesPageWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'publisherId': serializeParam(
                                                                                      titleDetailPageAppTitleDetailRow?.publisherId,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'publisherName': serializeParam(
                                                                                      titleDetailPageAppTitleDetailRow?.publisherName,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    titleDetailPageAppTitleDetailRow?.publisherName,
                                                                                    'Editora',
                                                                                  ),
                                                                                  textAlign: TextAlign.end,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      if (titleDetailPageAppTitleDetailRow?.licensors !=
                                                                              null &&
                                                                          titleDetailPageAppTitleDetailRow?.licensors !=
                                                                              '')
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final licensorsList = _model.titleLicensors.toList();

                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: List.generate(licensorsList.length, (licensorsListIndex) {
                                                                                        final licensorsListItem = licensorsList[licensorsListIndex];
                                                                                        return Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              ' • ',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                            InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                context.pushNamed(
                                                                                                  LicensorTitlesPageWidget.routeName,
                                                                                                  queryParameters: {
                                                                                                    'licensorId': serializeParam(
                                                                                                      licensorsListItem.licensorId,
                                                                                                      ParamType.int,
                                                                                                    ),
                                                                                                    'licensorName': serializeParam(
                                                                                                      licensorsListItem.licensorName,
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                );
                                                                                              },
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                                ),
                                                                                                child: Text(
                                                                                                  licensorsListItem.licensorName,
                                                                                                  textAlign: TextAlign.end,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      }),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            24.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: custom_widgets
                                                                        .ComicCover(
                                                                      width:
                                                                          200.0,
                                                                      height:
                                                                          300.0,
                                                                      imageUrl:
                                                                          'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${titleDetailPageAppTitleDetailRow?.titleCover}',
                                                                      titleName:
                                                                          titleDetailPageAppTitleDetailRow
                                                                              ?.titleName,
                                                                      titleId:
                                                                          widget
                                                                              .titleId,
                                                                      spineHeight:
                                                                          5.0,
                                                                      alignBottom:
                                                                          false,
                                                                      enableLightbox:
                                                                          true,
                                                                      isAdult:
                                                                          titleDetailPageAppTitleDetailRow
                                                                              ?.isAdult,
                                                                      canSeeAdult: functions.canSeeAdultContent(
                                                                          FFAppState()
                                                                              .currentUserBirthDateString,
                                                                          FFAppState()
                                                                              .adultContentEnabled),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            20.0),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .titleStatusIndicatorModel,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      TitleStatusIndicatorWidget(
                                                                    issueId: '',
                                                                    isLarge:
                                                                        true,
                                                                    titleId: widget
                                                                        .titleId,
                                                                    entityType:
                                                                        'title',
                                                                    onSaved:
                                                                        () async {
                                                                      _model.refreshTitle =
                                                                          await actions
                                                                              .fetchLibraryTitles(
                                                                        currentUserUid,
                                                                      );
                                                                      FFAppState().libraryTitles = _model
                                                                          .refreshTitle!
                                                                          .toList()
                                                                          .cast<
                                                                              LibraryTitleItemStruct>();
                                                                      FFAppState()
                                                                              .needsLibraryRefresh =
                                                                          true;
                                                                      safeSetState(() =>
                                                                          _model.requestCompleter1 =
                                                                              null);
                                                                      await _model
                                                                          .waitForRequestCompleted1();

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      if (false)
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          16.0,
                                                                          24.0,
                                                                          24.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          'Fonte',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await launchURL(
                                                                              titleDetailPageAppTitleDetailRow!.urlGdqTitle!);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(6.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: 'Guia dos Quadrinhos',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Icon(
                                                                                  FFIcons.klinkExternalCircle,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 16.0,
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            StickyHeader(
                                              overlapHeaders: false,
                                              header: Visibility(
                                                visible:
                                                    titleDetailPageAppTitleDetailRow!
                                                            .issueCount! >
                                                        1,
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: FutureBuilder<
                                                      List<
                                                          AppTitleIssueCountsRow>>(
                                                    future: (_model
                                                                .requestCompleter1 ??=
                                                            Completer<
                                                                List<
                                                                    AppTitleIssueCountsRow>>()
                                                              ..complete(
                                                                  AppTitleIssueCountsTable()
                                                                      .querySingleRow(
                                                                queryFn: (q) =>
                                                                    q.eqOrNull(
                                                                  'title_id',
                                                                  widget
                                                                      .titleId,
                                                                ),
                                                              )))
                                                        .future,
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 12.0,
                                                            height: 12.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<AppTitleIssueCountsRow>
                                                          issuesHeaderAppTitleIssueCountsRowList =
                                                          snapshot.data!;

                                                      final issuesHeaderAppTitleIssueCountsRow =
                                                          issuesHeaderAppTitleIssueCountsRowList
                                                                  .isNotEmpty
                                                              ? issuesHeaderAppTitleIssueCountsRowList
                                                                  .first
                                                              : null;

                                                      return Container(
                                                        height: 64.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackgroundTransparent
                                                            ],
                                                            stops: [0.9, 1.0],
                                                            begin:
                                                                AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            end:
                                                                AlignmentDirectional(
                                                                    0, 1.0),
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Divider(
                                                              height: 0.5,
                                                              thickness: 0.5,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        12.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${titleDetailPageAppTitleDetailRow.issueCount?.toString()} edições',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                              ),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (widget
                                                                        .fromLibrary)
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          if (_model
                                                                              .isFiltered!) {
                                                                            _model.isFiltered =
                                                                                false;
                                                                            _model.filterReading =
                                                                                null;
                                                                            _model.filterOwnership =
                                                                                null;
                                                                          } else {
                                                                            _model.isFiltered =
                                                                                true;
                                                                            _model.filterReading =
                                                                                widget.readingStatus;
                                                                            _model.filterOwnership =
                                                                                widget.ownershipStatus;
                                                                          }

                                                                          safeSetState(
                                                                              () {
                                                                            _model.clearTitleCacheCache();
                                                                            _model.requestCompleted2 =
                                                                                false;
                                                                          });
                                                                          await _model
                                                                              .waitForRequestCompleted2();
                                                                          safeSetState(() =>
                                                                              _model.requestCompleter1 = null);
                                                                          await _model
                                                                              .waitForRequestCompleted1();
                                                                        },
                                                                        text:
                                                                            '${() {
                                                                          if (widget.readingStatus ==
                                                                              'read') {
                                                                            return 'Lido';
                                                                          } else if (widget.readingStatus ==
                                                                              'reading') {
                                                                            return 'Lendo';
                                                                          } else if (widget.readingStatus ==
                                                                              'unread') {
                                                                            return 'Não lido';
                                                                          } else if (widget.ownershipStatus ==
                                                                              'owned') {
                                                                            return 'Tenho';
                                                                          } else if (widget.ownershipStatus ==
                                                                              'wanted') {
                                                                            return 'Quero';
                                                                          } else {
                                                                            return '';
                                                                          }
                                                                        }()}: ${() {
                                                                          if (widget.readingStatus ==
                                                                              'read') {
                                                                            return issuesHeaderAppTitleIssueCountsRow?.readCount?.toString();
                                                                          } else if (widget.readingStatus ==
                                                                              'reading') {
                                                                            return issuesHeaderAppTitleIssueCountsRow?.readingCount?.toString();
                                                                          } else if (widget.readingStatus ==
                                                                              'unread') {
                                                                            return issuesHeaderAppTitleIssueCountsRow?.unreadCount?.toString();
                                                                          } else if (widget.ownershipStatus ==
                                                                              'owned') {
                                                                            return issuesHeaderAppTitleIssueCountsRow?.ownedCount?.toString();
                                                                          } else if (widget.ownershipStatus ==
                                                                              'wanted') {
                                                                            return issuesHeaderAppTitleIssueCountsRow?.wantedCount?.toString();
                                                                          } else {
                                                                            return '';
                                                                          }
                                                                        }()}  ',
                                                                        icon:
                                                                            Icon(
                                                                          FFIcons
                                                                              .kfilter,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              2.0,
                                                                              0.0,
                                                                              2.0),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            _model.isFiltered == true
                                                                                ? FlutterFlowTheme.of(context).alternate
                                                                                : FlutterFlowTheme.of(context).primaryBackground,
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              0.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        showLoadingIndicator:
                                                                            false,
                                                                      ),
                                                                  ]
                                                                      .divide(SizedBox(
                                                                          width:
                                                                              24.0))
                                                                      .addToStart(SizedBox(
                                                                          width:
                                                                              16.0))
                                                                      .addToEnd(SizedBox(
                                                                          width:
                                                                              16.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              content: FutureBuilder<
                                                  List<AppIssueWithCoverRow>>(
                                                future: _model
                                                    .titleCache(
                                                  overrideCache:
                                                      !_model.isFiltered!,
                                                  requestFn: () =>
                                                      AppIssueWithCoverTable()
                                                          .queryRows(
                                                    queryFn: (q) => q
                                                        .eqOrNull(
                                                          'title_id',
                                                          widget.titleId,
                                                        )
                                                        .eqOrNull(
                                                          'status_ownership',
                                                          _model
                                                              .filterOwnership,
                                                        )
                                                        .eqOrNull(
                                                          'status_reading',
                                                          _model.filterReading,
                                                        )
                                                        .order('sort_order',
                                                            ascending: true)
                                                        .order('date',
                                                            ascending: true)
                                                        .order('issue_name_key',
                                                            ascending: true)
                                                        .order(
                                                            'issue_subtitle_key',
                                                            ascending: true),
                                                  ),
                                                )
                                                    .then((result) {
                                                  _model.requestCompleted2 =
                                                      true;
                                                  return result;
                                                }),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return ListItemSkeletonLWidget();
                                                  }
                                                  List<AppIssueWithCoverRow>
                                                      listViewBAppIssueWithCoverRowList =
                                                      snapshot.data!;

                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewBAppIssueWithCoverRowList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewBIndex) {
                                                      final listViewBAppIssueWithCoverRow =
                                                          listViewBAppIssueWithCoverRowList[
                                                              listViewBIndex];
                                                      return wrapWithModel(
                                                        model: _model
                                                            .listItemModels
                                                            .getModel(
                                                          listViewBAppIssueWithCoverRow
                                                              .issueId!,
                                                          listViewBIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: ListItemWidget(
                                                          key: Key(
                                                            'Key6ah_${listViewBAppIssueWithCoverRow.issueId!}',
                                                          ),
                                                          issueId:
                                                              listViewBAppIssueWithCoverRow
                                                                  .issueId,
                                                          showTitleInfo: false,
                                                          thumb:
                                                              'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listViewBAppIssueWithCoverRow.thumbLocalPath}',
                                                          issueNumber:
                                                              listViewBAppIssueWithCoverRow
                                                                  .issueNumber,
                                                          issueName:
                                                              listViewBAppIssueWithCoverRow
                                                                  .issueName,
                                                          issueSubtitle:
                                                              listViewBAppIssueWithCoverRow
                                                                  .issueSubtitle,
                                                          issuePages:
                                                              listViewBAppIssueWithCoverRow
                                                                  .pages,
                                                          issueDate:
                                                              listViewBAppIssueWithCoverRow
                                                                  .date,
                                                          entityType: 'issue',
                                                          entityId:
                                                              widget.titleId,
                                                          issueCount: 0,
                                                          isSingleIssue: false,
                                                          singleIssuePages:
                                                              listViewBAppIssueWithCoverRow
                                                                  .pages,
                                                          indexPosition:
                                                              listViewBIndex,
                                                          thumb2:
                                                              'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listViewBAppIssueWithCoverRow.thumbLocalPath}',
                                                          thumb3:
                                                              'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listViewBAppIssueWithCoverRow.thumbLocalPath}',
                                                          showDivider: true,
                                                          selectionEnabled:
                                                              true,
                                                          showStatus: true,
                                                          isAdult:
                                                              listViewBAppIssueWithCoverRow
                                                                  .isAdult,
                                                          canSeeAdult: functions
                                                              .canSeeAdultContent(
                                                                  FFAppState()
                                                                      .currentUserBirthDateString,
                                                                  FFAppState()
                                                                      .adultContentEnabled),
                                                          showIndex: false,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              IssueDetailPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'issueId':
                                                                    serializeParam(
                                                                  listViewBAppIssueWithCoverRow
                                                                      .issueId,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'tittleId':
                                                                    serializeParam(
                                                                  widget
                                                                      .titleId,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'navOriginTitle':
                                                                    serializeParam(
                                                                  true,
                                                                  ParamType
                                                                      .bool,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          onSaved: () async {
                                                            _model.refreshTitle3 =
                                                                await actions
                                                                    .fetchLibraryTitles(
                                                              currentUserUid,
                                                            );
                                                            FFAppState()
                                                                    .libraryTitles =
                                                                _model
                                                                    .refreshTitle3!
                                                                    .toList()
                                                                    .cast<
                                                                        LibraryTitleItemStruct>();
                                                            FFAppState()
                                                                    .needsLibraryRefresh =
                                                                true;
                                                            FFAppState()
                                                                .update(() {});
                                                            safeSetState(() =>
                                                                _model.requestCompleter1 =
                                                                    null);
                                                            await _model
                                                                .waitForRequestCompleted1();

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ));
      },
    );
  }
}
