import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/items_and_thumbs/card_featured_list_color/card_featured_list_color_widget.dart';
import '/components/search_button_custom/search_button_custom_widget.dart';
import '/components/skeletons/discover_page_skeleton/discover_page_skeleton_widget.dart';
import '/components/skeletons/featured_list_color_skeleton/featured_list_color_skeleton_widget.dart';
import '/components/skeletons/grid_item_skeleton_b/grid_item_skeleton_b_widget.dart';
import '/components/skeletons/list_featured_empty_b/list_featured_empty_b_widget.dart';
import '/components/skeletons/suggestions_skeleton/suggestions_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'discover_page_model.dart';
export 'discover_page_model.dart';

class DiscoverPageWidget extends StatefulWidget {
  const DiscoverPageWidget({super.key});

  static String routeName = 'DiscoverPage';
  static String routePath = '/Home';

  @override
  State<DiscoverPageWidget> createState() => _DiscoverPageWidgetState();
}

class _DiscoverPageWidgetState extends State<DiscoverPageWidget> {
  late DiscoverPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiscoverPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn) {
        _model.isAdminUser = await actions.checkAdminEmail();
        FFAppState().isAdminUser = _model.isAdminUser!;
        safeSetState(() {});
        _model.currentUser = await UsersTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'user_id',
            currentUserUid,
          ),
        );
        if (_model.currentUser?.firstOrNull?.termsAcceptedAt == null) {
          context.goNamed(
            OnboardingPageWidget.routeName,
            extra: <String, dynamic>{
              '__transition_info__': TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.bottomToTop,
              ),
            },
          );
        } else {
          _model.hasReadingResult = await actions.checkHasReadingIssues();
          FFAppState().hasReadingIssues = _model.hasReadingResult!;
          FFAppState().currentUserBirthDateString = dateTimeFormat(
            "yyyy-MM-dd",
            _model.currentUser!.firstOrNull!.birthDate!,
            locale: FFLocalizations.of(context).languageCode,
          );
          FFAppState().adultContentEnabled =
              _model.currentUser!.firstOrNull!.adultContentEnabled!;
          safeSetState(() {});
        }
      }
      _model.discoverBrandsResult = await actions.fetchDiscoverBrands();
      FFAppState().discoverBrands =
          _model.discoverBrandsResult!.toList().cast<dynamic>();
      safeSetState(() {});
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
        title: 'Gibifolio - Início',
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
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, _) => [
                  SliverAppBar(
                    pinned: false,
                    floating: true,
                    snap: false,
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    automaticallyImplyLeading: false,
                    title: Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Text(
                        'Gibifolio',
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
                    ),
                    actions: [
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (false)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    currentUserEmail,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          FFAppState().isAdminUser
                                              ? 'Admin'
                                              : '',
                                          'Admin',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 12.0,
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'v1.0.5',
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
                                                fontSize: 12.0,
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
                                    ],
                                  ),
                                ],
                              ),
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                FFIcons.kmoreVertical,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              onPressed: () async {
                                if (currentUserUid != '') {
                                  context.pushNamed(
                                    SettingsWidget.routeName,
                                    extra: <String, dynamic>{
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.bottomToTop,
                                      ),
                                    },
                                  );
                                } else {
                                  context.pushNamed(
                                    LoginPageWidget.routeName,
                                    extra: <String, dynamic>{
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.bottomToTop,
                                      ),
                                    },
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(80.0),
                      child: Container(
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(SearchPageWidget.routeName);
                          },
                          child: wrapWithModel(
                            model: _model.searchButtonCustomModel,
                            updateCallback: () => safeSetState(() {}),
                            child: SearchButtonCustomWidget(
                              label: 'Buscar HQs',
                              icon: Icon(
                                FFIcons.ksearch,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    centerTitle: false,
                    elevation: 0.0,
                  )
                ],
                body: Builder(
                  builder: (context) {
                    return SafeArea(
                      top: false,
                      child: FutureBuilder<List<AppReadingSuggestionsCountRow>>(
                        future: FFAppState()
                            .unreadCount(
                          requestFn: () =>
                              AppReadingSuggestionsCountTable().querySingleRow(
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
                            return DiscoverPageSkeletonWidget();
                          }
                          List<AppReadingSuggestionsCountRow>
                              columnAppReadingSuggestionsCountRowList =
                              snapshot.data!;

                          final columnAppReadingSuggestionsCountRow =
                              columnAppReadingSuggestionsCountRowList.isNotEmpty
                                  ? columnAppReadingSuggestionsCountRowList
                                      .first
                                  : null;

                          return RefreshIndicator(
                            color: FlutterFlowTheme.of(context).primary,
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            onRefresh: () async {
                              safeSetState(() {
                                FFAppState().clearUnreadCountCache();
                                _model.requestCompleted1 = false;
                              });
                              safeSetState(() {
                                FFAppState().clearSuggestionsCacheCache();
                                _model.requestCompleted5 = false;
                              });
                              safeSetState(() {
                                FFAppState().clearRecentReleasesCache2Cache();
                                _model.requestCompleted7 = false;
                              });
                              safeSetState(() {
                                FFAppState().clearReadingIssuesCacheCache();
                                _model.requestCompleted8 = false;
                              });
                              safeSetState(() {
                                FFAppState().clearListsGenreCacheCache();
                                _model.requestCompleted6 = false;
                              });
                              safeSetState(() {
                                FFAppState().clearListAuthorsCacheCache();
                                _model.requestCompleted2 = false;
                              });
                              safeSetState(() {
                                FFAppState().clearListHeroesCacheCache();
                                _model.requestCompleted3 = false;
                              });
                              safeSetState(() {
                                FFAppState().clearListIntroCacheCache();
                                _model.requestCompleted4 = false;
                              });
                            },
                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (columnAppReadingSuggestionsCountRow!
                                          .total! >
                                      4)
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 300.0,
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(16.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      40.0,
                                                                      40.0,
                                                                      40.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Text(
                                                                  'Sugestões de leitura',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .fraunces(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Text(
                                                                  'Itens não lidos em sua coleção',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 440.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      AppReadingSuggestionsRow>>(
                                                                future: FFAppState()
                                                                    .suggestionsCache(
                                                                  requestFn: () =>
                                                                      AppReadingSuggestionsTable()
                                                                          .queryRows(
                                                                    queryFn:
                                                                        (q) =>
                                                                            q,
                                                                    limit: 3,
                                                                  ),
                                                                )
                                                                    .then((result) {
                                                                  _model.requestCompleted5 =
                                                                      true;
                                                                  return result;
                                                                }),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              40.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        child:
                                                                            SuggestionsSkeletonWidget(),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<AppReadingSuggestionsRow>
                                                                      suggestionsAppReadingSuggestionsRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  if (suggestionsAppReadingSuggestionsRowList
                                                                      .isEmpty) {
                                                                    return ListFeaturedEmptyBWidget(
                                                                      textMessage:
                                                                          'HQs não lidas aparecerão aqui.',
                                                                    );
                                                                  }

                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: List.generate(
                                                                            suggestionsAppReadingSuggestionsRowList.length,
                                                                            (suggestionsIndex) {
                                                                      final suggestionsAppReadingSuggestionsRow =
                                                                          suggestionsAppReadingSuggestionsRowList[
                                                                              suggestionsIndex];
                                                                      return Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              16.0,
                                                                              0.0,
                                                                              16.0),
                                                                          child:
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
                                                                              context.pushNamed(
                                                                                IssueDetailPageWidget.routeName,
                                                                                queryParameters: {
                                                                                  'issueId': serializeParam(
                                                                                    suggestionsAppReadingSuggestionsRow.issueId,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'tittleId': serializeParam(
                                                                                    suggestionsAppReadingSuggestionsRow.titleId,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            child:
                                                                                custom_widgets.ComicCover(
                                                                              width: () {
                                                                                if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                  return 92.0;
                                                                                } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                  return 96.0;
                                                                                } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                  return 96.0;
                                                                                } else {
                                                                                  return 96.0;
                                                                                }
                                                                              }(),
                                                                              height: 112.0,
                                                                              imageUrl: 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${suggestionsAppReadingSuggestionsRow.thumbLocalPath}',
                                                                              titleName: suggestionsAppReadingSuggestionsRow.titleName,
                                                                              issueNumber: suggestionsAppReadingSuggestionsRow.issueNumber,
                                                                              titleId: suggestionsAppReadingSuggestionsRow.titleId,
                                                                              spineHeight: 4.0,
                                                                              alignBottom: false,
                                                                              enableLightbox: false,
                                                                              isAdult: suggestionsAppReadingSuggestionsRow.isAdult,
                                                                              canSeeAdult: functions.canSeeAdultContent(FFAppState().currentUserBirthDateString, FFAppState().adultContentEnabled),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    })
                                                                        .divide(SizedBox(
                                                                            width:
                                                                                16.0))
                                                                        .addToStart(SizedBox(
                                                                            width:
                                                                                36.0))
                                                                        .addToEnd(SizedBox(
                                                                            width:
                                                                                36.0)),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().hasReadingIssues)
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(),
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 0.0),
                                                  child: Text(
                                                    'Você está lendo',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 192.0,
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(16.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Container(
                                                      height: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 1.0),
                                                        child: FutureBuilder<
                                                            List<
                                                                AppIssueWithUserStatusRow>>(
                                                          future: FFAppState()
                                                              .readingIssuesCache(
                                                            requestFn: () =>
                                                                AppIssueWithUserStatusTable()
                                                                    .queryRows(
                                                              queryFn: (q) => q
                                                                  .eqOrNull(
                                                                    'status_reading',
                                                                    'reading',
                                                                  )
                                                                  .eqOrNull(
                                                                    'user_id',
                                                                    currentUserUid,
                                                                  )
                                                                  .order(
                                                                      'status_updated_at'),
                                                            ),
                                                          )
                                                              .then((result) {
                                                            _model.requestCompleted8 =
                                                                true;
                                                            return result;
                                                          }),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            40.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  child:
                                                                      GridItemSkeletonBWidget(),
                                                                ),
                                                              );
                                                            }
                                                            List<AppIssueWithUserStatusRow>
                                                                readingAppIssueWithUserStatusRowList =
                                                                snapshot.data!;

                                                            return SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: List.generate(
                                                                        readingAppIssueWithUserStatusRowList
                                                                            .length,
                                                                        (readingIndex) {
                                                                  final readingAppIssueWithUserStatusRow =
                                                                      readingAppIssueWithUserStatusRowList[
                                                                          readingIndex];
                                                                  return Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          16.0),
                                                                      child:
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
                                                                          context
                                                                              .pushNamed(
                                                                            IssueDetailPageWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'issueId': serializeParam(
                                                                                readingAppIssueWithUserStatusRow.issueId,
                                                                                ParamType.String,
                                                                              ),
                                                                              'tittleId': serializeParam(
                                                                                readingAppIssueWithUserStatusRow.titleId,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child: custom_widgets
                                                                            .ComicCover(
                                                                          width:
                                                                              80.0,
                                                                          height:
                                                                              120.0,
                                                                          imageUrl:
                                                                              'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${readingAppIssueWithUserStatusRow.primaryThumb}',
                                                                          titleName:
                                                                              '',
                                                                          issueNumber:
                                                                              readingAppIssueWithUserStatusRow.issueNumber,
                                                                          titleId:
                                                                              readingAppIssueWithUserStatusRow.titleId,
                                                                          spineHeight:
                                                                              4.0,
                                                                          alignBottom:
                                                                              false,
                                                                          enableLightbox:
                                                                              false,
                                                                          isAdult:
                                                                              readingAppIssueWithUserStatusRow.isAdult,
                                                                          canSeeAdult: functions.canSeeAdultContent(
                                                                              FFAppState().currentUserBirthDateString,
                                                                              FFAppState().adultContentEnabled),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                })
                                                                    .divide(SizedBox(
                                                                        width:
                                                                            16.0))
                                                                    .addToStart(
                                                                        SizedBox(
                                                                            width:
                                                                                36.0))
                                                                    .addToEnd(
                                                                        SizedBox(
                                                                            width:
                                                                                36.0)),
                                                              ),
                                                            );
                                                          },
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
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                  ReleasesPageWidget.routeName);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Text(
                                                            'Lançamentos',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              'Mais',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .chevron_right_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 192.0,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                16.0,
                                                                16.0,
                                                                16.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Container(
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: FutureBuilder<
                                                          List<
                                                              RecentReleasesCacheRow>>(
                                                        future: FFAppState()
                                                            .recentReleasesCache2(
                                                          overrideCache:
                                                              FFAppState()
                                                                  .needsLibraryRefresh,
                                                          requestFn: () =>
                                                              RecentReleasesCacheTable()
                                                                  .queryRows(
                                                            queryFn: (q) => q,
                                                          ),
                                                        )
                                                            .then((result) {
                                                          _model.requestCompleted7 =
                                                              true;
                                                          return result;
                                                        }),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          40.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                child:
                                                                    GridItemSkeletonBWidget(),
                                                              ),
                                                            );
                                                          }
                                                          List<RecentReleasesCacheRow>
                                                              releasesRecentReleasesCacheRowList =
                                                              snapshot.data!;

                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: List.generate(
                                                                      releasesRecentReleasesCacheRowList
                                                                          .length,
                                                                      (releasesIndex) {
                                                                final releasesRecentReleasesCacheRow =
                                                                    releasesRecentReleasesCacheRowList[
                                                                        releasesIndex];
                                                                return Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            16.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          IssueDetailPageWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'issueId':
                                                                                serializeParam(
                                                                              releasesRecentReleasesCacheRow.issueId,
                                                                              ParamType.String,
                                                                            ),
                                                                            'tittleId':
                                                                                serializeParam(
                                                                              releasesRecentReleasesCacheRow.titleId,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child: custom_widgets
                                                                          .ComicCover(
                                                                        width:
                                                                            80.0,
                                                                        height:
                                                                            120.0,
                                                                        imageUrl:
                                                                            'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${releasesRecentReleasesCacheRow.primaryThumb}',
                                                                        titleName:
                                                                            '',
                                                                        issueNumber:
                                                                            releasesRecentReleasesCacheRow.issueNumber,
                                                                        titleId:
                                                                            releasesRecentReleasesCacheRow.titleId,
                                                                        spineHeight:
                                                                            4.0,
                                                                        alignBottom:
                                                                            false,
                                                                        enableLightbox:
                                                                            false,
                                                                        isAdult:
                                                                            releasesRecentReleasesCacheRow.isAdult,
                                                                        canSeeAdult: functions.canSeeAdultContent(
                                                                            FFAppState().currentUserBirthDateString,
                                                                            FFAppState().adultContentEnabled),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              })
                                                                  .divide(SizedBox(
                                                                      width:
                                                                          16.0))
                                                                  .addToStart(
                                                                      SizedBox(
                                                                          width:
                                                                              36.0))
                                                                  .addToEnd(
                                                                      SizedBox(
                                                                          width:
                                                                              36.0)),
                                                            ),
                                                          );
                                                        },
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
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                AllBrandsPageWidget.routeName);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Text(
                                                          'Editoras em destaque',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            'Mais',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .chevron_right_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 20.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: 136.0,
                                          decoration: BoxDecoration(),
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 16.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final brands = FFAppState()
                                                      .discoverBrands
                                                      .toList();

                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: List.generate(
                                                              brands.length,
                                                              (brandsIndex) {
                                                        final brandsItem =
                                                            brands[brandsIndex];
                                                        return Container(
                                                          width: 72.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  if (functions
                                                                          .getBrandType(
                                                                              brandsItem) ==
                                                                      'publisher') {
                                                                    context
                                                                        .pushNamed(
                                                                      PublisherTitlesPageWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'publisherId':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            brandsItem,
                                                                            r'''$.id''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'publisherName':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            brandsItem,
                                                                            r'''$.name''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  } else {
                                                                    context
                                                                        .pushNamed(
                                                                      LicensorTitlesPageWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'licensorId':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            brandsItem,
                                                                            r'''$.id''',
                                                                          ),
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                        'licensorName':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            brandsItem,
                                                                            r'''$.name''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  }
                                                                },
                                                                child: ClipOval(
                                                                  child:
                                                                      Container(
                                                                    width: 64.0,
                                                                    height:
                                                                        64.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child: Hero(
                                                                      tag:
                                                                          'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/logos/${getJsonField(
                                                                        brandsItem,
                                                                        r'''$.logo_path''',
                                                                      ).toString()}',
                                                                      transitionOnUserGestures:
                                                                          true,
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(1000.0),
                                                                        child: Image
                                                                            .network(
                                                                          'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/logos/${getJsonField(
                                                                            brandsItem,
                                                                            r'''$.logo_path''',
                                                                          ).toString()}',
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              double.infinity,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                getJsonField(
                                                                  brandsItem,
                                                                  r'''$.name''',
                                                                ).toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                        );
                                                      })
                                                          .divide(SizedBox(
                                                              width: 8.0))
                                                          .addToStart(SizedBox(
                                                              width: 16.0))
                                                          .addToEnd(SizedBox(
                                                              width: 16.0)),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              ListsPageWidget.routeName,
                                              queryParameters: {
                                                'filter': serializeParam(
                                                  'gênero',
                                                  ParamType.String,
                                                ),
                                                'title': serializeParam(
                                                  'Descubra',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Text(
                                                          'Descubra',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            'Mais',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .chevron_right_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 20.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: 220.0,
                                          decoration: BoxDecoration(),
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: FutureBuilder<
                                                List<AppDiscoverFeedRow>>(
                                              future: FFAppState()
                                                  .listsGenreCache(
                                                requestFn: () =>
                                                    AppDiscoverFeedTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'labels',
                                                    'gênero',
                                                  ),
                                                  limit: 5,
                                                ),
                                              )
                                                  .then((result) {
                                                _model.requestCompleted6 = true;
                                                return result;
                                              }),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return FeaturedListColorSkeletonWidget();
                                                }
                                                List<AppDiscoverFeedRow>
                                                    rowAppDiscoverFeedRowList =
                                                    snapshot.data!;

                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        rowAppDiscoverFeedRowList
                                                            .length,
                                                        (rowIndex) {
                                                      final rowAppDiscoverFeedRow =
                                                          rowAppDiscoverFeedRowList[
                                                              rowIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              ListDetailPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'listId':
                                                                    serializeParam(
                                                                  rowAppDiscoverFeedRow
                                                                      .listId,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .cardFeaturedListColorModels1
                                                                .getModel(
                                                              rowAppDiscoverFeedRow
                                                                  .listId!,
                                                              rowIndex,
                                                            ),
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                CardFeaturedListColorWidget(
                                                              key: Key(
                                                                'Key06m_${rowAppDiscoverFeedRow.listId!}',
                                                              ),
                                                              listName:
                                                                  rowAppDiscoverFeedRow
                                                                      .listName!,
                                                              thumb1:
                                                                  rowAppDiscoverFeedRow
                                                                      .thumb1!,
                                                              thumb2:
                                                                  rowAppDiscoverFeedRow
                                                                      .thumb2!,
                                                              thumb3:
                                                                  rowAppDiscoverFeedRow
                                                                      .thumb3!,
                                                              bgColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }).addToEnd(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              ListsPageWidget.routeName,
                                              queryParameters: {
                                                'filter': serializeParam(
                                                  'autor',
                                                  ParamType.String,
                                                ),
                                                'title': serializeParam(
                                                  'Autores em destaque',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Text(
                                                          'Autores em destaque',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            'Mais',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .chevron_right_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 20.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: 220.0,
                                          decoration: BoxDecoration(),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: FutureBuilder<
                                                List<AppDiscoverFeedRow>>(
                                              future: FFAppState()
                                                  .listAuthorsCache(
                                                requestFn: () =>
                                                    AppDiscoverFeedTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'labels',
                                                    'autor',
                                                  ),
                                                  limit: 5,
                                                ),
                                              )
                                                  .then((result) {
                                                _model.requestCompleted2 = true;
                                                return result;
                                              }),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return FeaturedListColorSkeletonWidget();
                                                }
                                                List<AppDiscoverFeedRow>
                                                    rowAppDiscoverFeedRowList =
                                                    snapshot.data!;

                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        rowAppDiscoverFeedRowList
                                                            .length,
                                                        (rowIndex) {
                                                      final rowAppDiscoverFeedRow =
                                                          rowAppDiscoverFeedRowList[
                                                              rowIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              ListDetailPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'listId':
                                                                    serializeParam(
                                                                  rowAppDiscoverFeedRow
                                                                      .listId,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .cardFeaturedListColorModels2
                                                                .getModel(
                                                              rowAppDiscoverFeedRow
                                                                  .listId!,
                                                              rowIndex,
                                                            ),
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                CardFeaturedListColorWidget(
                                                              key: Key(
                                                                'Key1p0_${rowAppDiscoverFeedRow.listId!}',
                                                              ),
                                                              listName:
                                                                  rowAppDiscoverFeedRow
                                                                      .listName!,
                                                              thumb1:
                                                                  rowAppDiscoverFeedRow
                                                                      .thumb1!,
                                                              thumb2:
                                                                  rowAppDiscoverFeedRow
                                                                      .thumb2!,
                                                              thumb3:
                                                                  rowAppDiscoverFeedRow
                                                                      .thumb3!,
                                                              bgColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }).addToEnd(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              ListsPageWidget.routeName,
                                              queryParameters: {
                                                'filter': serializeParam(
                                                  'super-heróis',
                                                  ParamType.String,
                                                ),
                                                'title': serializeParam(
                                                  'Super-Heróis',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Text(
                                                          'Coletâneas de super-heróis',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            'Mais',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .chevron_right_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 20.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: 220.0,
                                          decoration: BoxDecoration(),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: FutureBuilder<
                                                List<AppDiscoverFeedRow>>(
                                              future: FFAppState()
                                                  .listHeroesCache(
                                                requestFn: () =>
                                                    AppDiscoverFeedTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'labels',
                                                    'super-heróis',
                                                  ),
                                                  limit: 5,
                                                ),
                                              )
                                                  .then((result) {
                                                _model.requestCompleted3 = true;
                                                return result;
                                              }),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return FeaturedListColorSkeletonWidget();
                                                }
                                                List<AppDiscoverFeedRow>
                                                    rowAppDiscoverFeedRowList =
                                                    snapshot.data!;

                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        rowAppDiscoverFeedRowList
                                                            .length,
                                                        (rowIndex) {
                                                      final rowAppDiscoverFeedRow =
                                                          rowAppDiscoverFeedRowList[
                                                              rowIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              ListDetailPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'listId':
                                                                    serializeParam(
                                                                  rowAppDiscoverFeedRow
                                                                      .listId,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .cardFeaturedListColorModels3
                                                                .getModel(
                                                              rowAppDiscoverFeedRow
                                                                  .listId!,
                                                              rowIndex,
                                                            ),
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                CardFeaturedListColorWidget(
                                                              key: Key(
                                                                'Keypmx_${rowAppDiscoverFeedRow.listId!}',
                                                              ),
                                                              listName:
                                                                  rowAppDiscoverFeedRow
                                                                      .listName!,
                                                              thumb1:
                                                                  rowAppDiscoverFeedRow
                                                                      .thumb1!,
                                                              thumb2:
                                                                  rowAppDiscoverFeedRow
                                                                      .thumb2!,
                                                              thumb3:
                                                                  rowAppDiscoverFeedRow
                                                                      .thumb3!,
                                                              bgColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }).addToEnd(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 48.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                ListsPageWidget.routeName,
                                                queryParameters: {
                                                  'filter': serializeParam(
                                                    'intro',
                                                    ParamType.String,
                                                  ),
                                                  'title': serializeParam(
                                                    'Para conhecer personagens',
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Text(
                                                            'Para conhecer personagens',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              'Mais',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .chevron_right_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 220.0,
                                              decoration: BoxDecoration(),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: FutureBuilder<
                                                    List<AppDiscoverFeedRow>>(
                                                  future: FFAppState()
                                                      .listIntroCache(
                                                    requestFn: () =>
                                                        AppDiscoverFeedTable()
                                                            .queryRows(
                                                      queryFn: (q) =>
                                                          q.eqOrNull(
                                                        'labels',
                                                        'intro',
                                                      ),
                                                      limit: 5,
                                                    ),
                                                  )
                                                      .then((result) {
                                                    _model.requestCompleted4 =
                                                        true;
                                                    return result;
                                                  }),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return FeaturedListColorSkeletonWidget();
                                                    }
                                                    List<AppDiscoverFeedRow>
                                                        rowAppDiscoverFeedRowList =
                                                        snapshot.data!;

                                                    return SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: List.generate(
                                                            rowAppDiscoverFeedRowList
                                                                .length,
                                                            (rowIndex) {
                                                          final rowAppDiscoverFeedRow =
                                                              rowAppDiscoverFeedRowList[
                                                                  rowIndex];
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
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
                                                                context
                                                                    .pushNamed(
                                                                  ListDetailPageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'listId':
                                                                        serializeParam(
                                                                      rowAppDiscoverFeedRow
                                                                          .listId,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .cardFeaturedListColorModels4
                                                                    .getModel(
                                                                  rowAppDiscoverFeedRow
                                                                      .listId!,
                                                                  rowIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    CardFeaturedListColorWidget(
                                                                  key: Key(
                                                                    'Key7hl_${rowAppDiscoverFeedRow.listId!}',
                                                                  ),
                                                                  listName:
                                                                      rowAppDiscoverFeedRow
                                                                          .listName!,
                                                                  thumb1:
                                                                      rowAppDiscoverFeedRow
                                                                          .thumb1!,
                                                                  thumb2:
                                                                      rowAppDiscoverFeedRow
                                                                          .thumb2!,
                                                                  thumb3:
                                                                      rowAppDiscoverFeedRow
                                                                          .thumb3!,
                                                                  bgColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }).addToEnd(SizedBox(
                                                            width: 16.0)),
                                                      ),
                                                    );
                                                  },
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
                          );
                        },
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
