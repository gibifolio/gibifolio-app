import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_sheets/status_bottom_sheet/status_bottom_sheet_widget.dart';
import '/components/chip/chip_widget.dart';
import '/components/items_and_thumbs/grid_item_title/grid_item_title_widget.dart';
import '/components/skeletons/empty_state_list/empty_state_list_widget.dart';
import '/components/skeletons/grid_item_skeleton_small/grid_item_skeleton_small_widget.dart';
import '/components/skeletons/library_page_content_skeleton/library_page_content_skeleton_widget.dart';
import '/components/skeletons/library_page_skeleton/library_page_skeleton_widget.dart';
import '/components/skeletons/user_area_empty_state/user_area_empty_state_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'library_page_model.dart';
export 'library_page_model.dart';

/// User's library
class LibraryPageWidget extends StatefulWidget {
  const LibraryPageWidget({super.key});

  static String routeName = 'LibraryPage';
  static String routePath = '/libraryPage';

  @override
  State<LibraryPageWidget> createState() => _LibraryPageWidgetState();
}

class _LibraryPageWidgetState extends State<LibraryPageWidget> {
  late LibraryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LibraryPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.getCachedLibrary(
        currentUserUid,
      );
      if (FFAppState().needsLibraryRefresh == true) {
        safeSetState(() {
          FFAppState().clearLibraryOwnedCache();
          _model.requestCompleted2 = false;
        });
        safeSetState(() {
          FFAppState().clearItemCountCache();
          _model.requestCompleted1 = false;
        });
        FFAppState().needsLibraryRefresh = false;
        safeSetState(() {});
      }
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

    return Title(
        title: 'Coleção',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: NestedScrollView(
                floatHeaderSlivers: false,
                headerSliverBuilder: (context, _) => [
                  if (currentUserUid != '')
                    SliverAppBar(
                      pinned: true,
                      floating: false,
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      automaticallyImplyLeading: false,
                      title: Text(
                        'Minha coleção',
                        style: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .override(
                              font: GoogleFonts.fraunces(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .fontStyle,
                            ),
                      ),
                      actions: [
                        Visibility(
                          visible: false,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 48.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  icon: Icon(
                                    FFIcons.ksearch,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
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
                          height: double.infinity,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              FutureBuilder<List<AppLibraryCountsRow>>(
                                future: FFAppState()
                                    .itemCount(
                                  overrideCache:
                                      FFAppState().needsLibraryRefresh,
                                  requestFn: () =>
                                      AppLibraryCountsTable().querySingleRow(
                                    queryFn: (q) => q,
                                  ),
                                )
                                    .then((result) {
                                  _model.requestCompleted1 = true;
                                  return result;
                                }),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return LibraryPageSkeletonWidget();
                                  }
                                  List<AppLibraryCountsRow>
                                      rootColumnAppLibraryCountsRowList =
                                      snapshot.data!;

                                  final rootColumnAppLibraryCountsRow =
                                      rootColumnAppLibraryCountsRowList
                                              .isNotEmpty
                                          ? rootColumnAppLibraryCountsRowList
                                              .first
                                          : null;

                                  return RefreshIndicator(
                                    color: FlutterFlowTheme.of(context).primary,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    onRefresh: () async {
                                      safeSetState(() {
                                        FFAppState().clearItemCountCache();
                                        _model.requestCompleted1 = false;
                                      });
                                      await _model.waitForRequestCompleted1();
                                      safeSetState(() {
                                        FFAppState().clearLibraryOwnedCache();
                                        _model.requestCompleted2 = false;
                                      });
                                      await _model.waitForRequestCompleted2();
                                      safeSetState(() =>
                                          _model.requestCompleter3 = null);
                                      await _model.waitForRequestCompleted3();
                                    },
                                    child: SingleChildScrollView(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (currentUserUid != '')
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Opacity(
                                                            opacity:
                                                                rootColumnAppLibraryCountsRow!
                                                                            .readCount! >
                                                                        0
                                                                    ? 1.0
                                                                    : 0.3,
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                if (rootColumnAppLibraryCountsRow
                                                                        .readCount! >
                                                                    0) {
                                                                  context.pushNamed(
                                                                      StatusReadPageWidget
                                                                          .routeName);
                                                                }
                                                              },
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .chipModel1,
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    ChipWidget(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .done_all,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 18.0,
                                                                  ),
                                                                  label:
                                                                      'Lidos',
                                                                  itemCount:
                                                                      rootColumnAppLibraryCountsRow
                                                                          .readCount,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Opacity(
                                                            opacity:
                                                                rootColumnAppLibraryCountsRow
                                                                            .readingCount! >
                                                                        0
                                                                    ? 1.0
                                                                    : 0.3,
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                if (rootColumnAppLibraryCountsRow
                                                                        .readingCount! >
                                                                    0) {
                                                                  context.pushNamed(
                                                                      StatusReadingPageWidget
                                                                          .routeName);
                                                                }
                                                              },
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .chipModel2,
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    ChipWidget(
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .glasses,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 14.0,
                                                                  ),
                                                                  label:
                                                                      'Lendo',
                                                                  itemCount:
                                                                      rootColumnAppLibraryCountsRow
                                                                          .readingCount,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Opacity(
                                                            opacity:
                                                                rootColumnAppLibraryCountsRow
                                                                            .unreadCount! >
                                                                        0
                                                                    ? 1.0
                                                                    : 0.3,
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                if (rootColumnAppLibraryCountsRow
                                                                        .unreadCount! >
                                                                    0) {
                                                                  context.pushNamed(
                                                                      StatusUnreadPageWidget
                                                                          .routeName);
                                                                }
                                                              },
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .chipModel3,
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    ChipWidget(
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .book,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 16.0,
                                                                  ),
                                                                  label:
                                                                      'Não lidos',
                                                                  itemCount:
                                                                      rootColumnAppLibraryCountsRow
                                                                          .unreadCount,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Opacity(
                                                            opacity:
                                                                rootColumnAppLibraryCountsRow
                                                                            .wantedCount! >
                                                                        0
                                                                    ? 1.0
                                                                    : 0.3,
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                if (rootColumnAppLibraryCountsRow
                                                                        .wantedCount! >
                                                                    0) {
                                                                  context.pushNamed(
                                                                      StatusWantedPageWidget
                                                                          .routeName);
                                                                }
                                                              },
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .chipModel4,
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    ChipWidget(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .auto_awesome,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 18.0,
                                                                  ),
                                                                  label:
                                                                      'Quero',
                                                                  itemCount:
                                                                      rootColumnAppLibraryCountsRow
                                                                          .wantedCount,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                          StickyHeader(
                                            overlapHeaders: false,
                                            header: Visibility(
                                              visible:
                                                  rootColumnAppLibraryCountsRow!
                                                          .ownedCount! >
                                                      0,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  constraints: BoxConstraints(
                                                    minHeight: 56.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.shelves,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 18.0,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            'Tenho ${rootColumnAppLibraryCountsRow.ownedCount?.toString()} itens',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                        if (rootColumnAppLibraryCountsRow
                                                                .ownedCount! >
                                                            10)
                                                          FlutterFlowIconButton(
                                                            borderRadius: 8.0,
                                                            buttonSize: 48.0,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            icon: Icon(
                                                              FFIcons.ksearch,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                  StatusOwnedPageWidget
                                                                      .routeName);
                                                            },
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            content: Visibility(
                                              visible: currentUserUid != '',
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 64.0),
                                                child: FutureBuilder<
                                                    List<AppLibraryOwnedRow>>(
                                                  future: FFAppState()
                                                      .libraryOwned(
                                                    overrideCache: FFAppState()
                                                        .needsLibraryRefresh,
                                                    requestFn: () =>
                                                        AppLibraryOwnedTable()
                                                            .queryRows(
                                                      queryFn: (q) => q.order(
                                                          'canonical_key',
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
                                                      return LibraryPageContentSkeletonWidget();
                                                    }
                                                    List<AppLibraryOwnedRow>
                                                        contentAppLibraryOwnedRowList =
                                                        snapshot.data!;

                                                    return Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final gridVar =
                                                                    contentAppLibraryOwnedRowList
                                                                        .toList();
                                                                if (gridVar
                                                                    .isEmpty) {
                                                                  return Container(
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        EmptyStateListWidget(
                                                                      listType:
                                                                          'à coleção',
                                                                    ),
                                                                  );
                                                                }

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .fromLTRB(
                                                                    0,
                                                                    32.0,
                                                                    0,
                                                                    0,
                                                                  ),
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 3;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 4;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 5;
                                                                      } else {
                                                                        return 5;
                                                                      }
                                                                    }(),
                                                                    crossAxisSpacing:
                                                                        24.0,
                                                                    mainAxisSpacing:
                                                                        32.0,
                                                                    childAspectRatio:
                                                                        0.7,
                                                                  ),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      gridVar
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          gridVarIndex) {
                                                                    final gridVarItem =
                                                                        gridVar[
                                                                            gridVarIndex];
                                                                    return FutureBuilder<
                                                                        List<
                                                                            UserTitleStatusRow>>(
                                                                      future: (_model
                                                                              .requestCompleter3 ??= Completer<List<UserTitleStatusRow>>()
                                                                            ..complete(UserTitleStatusTable().querySingleRow(
                                                                              queryFn: (q) => q
                                                                                  .eqOrNull(
                                                                                    'user_id',
                                                                                    currentUserUid,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'title_id',
                                                                                    gridVarItem.titleId,
                                                                                  ),
                                                                            )))
                                                                          .future,
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Container(
                                                                            width:
                                                                                96.0,
                                                                            height:
                                                                                120.0,
                                                                            child:
                                                                                GridItemSkeletonSmallWidget(),
                                                                          );
                                                                        }
                                                                        List<UserTitleStatusRow>
                                                                            gridItemTitleUserTitleStatusRowList =
                                                                            snapshot.data!;

                                                                        final gridItemTitleUserTitleStatusRow = gridItemTitleUserTitleStatusRowList.isNotEmpty
                                                                            ? gridItemTitleUserTitleStatusRowList.first
                                                                            : null;

                                                                        return InkWell(
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
                                                                            if ((gridVarItem.singleIssueId != null && gridVarItem.singleIssueId != '') &&
                                                                                (gridVarItem.ownedCount == 1)) {
                                                                              context.pushNamed(
                                                                                IssueDetailPageWidget.routeName,
                                                                                queryParameters: {
                                                                                  'issueId': serializeParam(
                                                                                    gridVarItem.singleIssueId,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'tittleId': serializeParam(
                                                                                    gridVarItem.titleId,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'navOriginTitle': serializeParam(
                                                                                    false,
                                                                                    ParamType.bool,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            } else {
                                                                              if ((gridVarItem.firstStatusIssueId != null && gridVarItem.firstStatusIssueId != '') && (gridVarItem.ownedCount == 1)) {
                                                                                context.pushNamed(
                                                                                  IssueDetailPageWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'issueId': serializeParam(
                                                                                      gridVarItem.firstStatusIssueId,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'tittleId': serializeParam(
                                                                                      gridVarItem.titleId,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'navOriginTitle': serializeParam(
                                                                                      false,
                                                                                      ParamType.bool,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              } else {
                                                                                context.pushNamed(
                                                                                  TitleDetailPageWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'titleId': serializeParam(
                                                                                      gridVarItem.titleId,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'fromLibrary': serializeParam(
                                                                                      true,
                                                                                      ParamType.bool,
                                                                                    ),
                                                                                    'ownershipStatus': serializeParam(
                                                                                      'owned',
                                                                                      ParamType.String,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              }
                                                                            }
                                                                          },
                                                                          onLongPress:
                                                                              () async {
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
                                                                                      titleId: gridVarItem.titleId,
                                                                                      entityType: 'title',
                                                                                      initialReading: gridItemTitleUserTitleStatusRow?.statusReading,
                                                                                      initialOwnership: gridItemTitleUserTitleStatusRow?.statusOwnership,
                                                                                      onSaved: () async {
                                                                                        FFAppState().needsLibraryRefresh = false;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.gridItemTitleModels.getModel(
                                                                              gridVarItem.titleId!,
                                                                              gridVarIndex,
                                                                            ),
                                                                            updateCallback: () =>
                                                                                safeSetState(() {}),
                                                                            child:
                                                                                GridItemTitleWidget(
                                                                              key: Key(
                                                                                'Keythw_${gridVarItem.titleId!}',
                                                                              ),
                                                                              showTitleInfo: true,
                                                                              issuePages: 0,
                                                                              titleName: gridVarItem.titleName,
                                                                              titleSubtitle: gridVarItem.titleSubtitle,
                                                                              publisherName: gridVarItem.publisherName,
                                                                              licensors: gridVarItem.licensors,
                                                                              entityType: 'title',
                                                                              entityId: gridVarItem.titleId,
                                                                              series: gridVarItem.series,
                                                                              publicationStatus: gridVarItem.publicationStatus,
                                                                              issueCount: gridVarItem.ownedCount,
                                                                              isSingleIssue: (gridVarItem.singleIssueId != null && gridVarItem.singleIssueId != '') && (gridVarItem.ownedCount == 1),
                                                                              singleIssueId: gridVarItem.singleIssueId,
                                                                              singleIssuePages: 0,
                                                                              indexPosition: null,
                                                                              thumb: gridVarItem.ownedT1 != null && gridVarItem.ownedT1 != '' ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${gridVarItem.ownedT1}' : null,
                                                                              thumb2: gridVarItem.ownedT2 != null && gridVarItem.ownedT2 != '' ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${gridVarItem.ownedT2}' : null,
                                                                              thumb3: gridVarItem.ownedT3 != null && gridVarItem.ownedT3 != '' ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${gridVarItem.ownedT3}' : null,
                                                                              isAdult: gridVarItem.isAdult,
                                                                              canSeelAdult: functions.canSeeAdultContent(FFAppState().currentUserBirthDateString, FFAppState().adultContentEnabled),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (currentUserUid == '')
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .userAreaEmptyStateModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      UserAreaEmptyStateWidget(),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 48.0,
                                  child: custom_widgets.OfflineBanner(
                                    width: double.infinity,
                                    height: 48.0,
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
          ),
        ));
  }
}
