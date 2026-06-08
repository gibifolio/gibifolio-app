import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_sheets/create_list_bottom_sheet/create_list_bottom_sheet_widget.dart';
import '/components/items_and_thumbs/list_featured/list_featured_widget.dart';
import '/components/items_and_thumbs/list_thumb/list_thumb_widget.dart';
import '/components/skeletons/empty_state_my_lists/empty_state_my_lists_widget.dart';
import '/components/skeletons/my_lists_page_skeleton/my_lists_page_skeleton_widget.dart';
import '/components/skeletons/user_area_empty_state/user_area_empty_state_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_lists_page_model.dart';
export 'my_lists_page_model.dart';

class MyListsPageWidget extends StatefulWidget {
  const MyListsPageWidget({super.key});

  static String routeName = 'MyListsPage';
  static String routePath = '/myLists';

  @override
  State<MyListsPageWidget> createState() => _MyListsPageWidgetState();
}

class _MyListsPageWidgetState extends State<MyListsPageWidget> {
  late MyListsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyListsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().needsLibraryRefresh) {
        safeSetState(() {
          FFAppState().clearMyListsCacheCache();
          _model.requestCompleted = false;
        });
        await _model.waitForRequestCompleted();
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

    return FutureBuilder<List<AppUserCustomListsRow>>(
      future: FFAppState()
          .myListsCache(
        overrideCache: FFAppState().needsLibraryRefresh,
        requestFn: () => AppUserCustomListsTable().queryRows(
          queryFn: (q) => q.order('updated_at'),
        ),
      )
          .then((result) {
        _model.requestCompleted = true;
        return result;
      }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: MyListsPageSkeletonWidget(),
          );
        }
        List<AppUserCustomListsRow> myListsPageAppUserCustomListsRowList =
            snapshot.data!;

        return Title(
            title: 'Minhas listas',
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
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  body: NestedScrollView(
                    floatHeaderSlivers: false,
                    headerSliverBuilder: (context, _) => [
                      if ((currentUserUid != '') &&
                          (myListsPageAppUserCustomListsRowList.isNotEmpty))
                        SliverAppBar(
                          pinned: true,
                          floating: false,
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          automaticallyImplyLeading: false,
                          title: Text(
                            'Minhas listas',
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 48.0,
                                    icon: Icon(
                                      Icons.library_add_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
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
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  CreateListBottomSheetWidget(
                                                onListCreated: () async {
                                                  context.pushNamed(
                                                    ListDetailPageWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'listId': serializeParam(
                                                        FFAppState()
                                                            .newlyCreatedListId,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                  if (!FFAppState().MyListsGridView)
                                    FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 48.0,
                                      icon: Icon(
                                        FFIcons.kgridL,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        FFAppState().MyListsGridView = true;
                                        safeSetState(() {});
                                      },
                                    ),
                                  if (FFAppState().MyListsGridView)
                                    FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 48.0,
                                      icon: Icon(
                                        FFIcons.klist,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        FFAppState().MyListsGridView = false;
                                        safeSetState(() {});
                                      },
                                    ),
                                ],
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
                          child: RefreshIndicator(
                            color: FlutterFlowTheme.of(context).primary,
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            onRefresh: () async {
                              safeSetState(() {
                                FFAppState().clearMyListsCacheCache();
                                _model.requestCompleted = false;
                              });
                            },
                            child: SingleChildScrollView(
                              primary: false,
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (currentUserUid != '')
                                    Builder(
                                      builder: (context) {
                                        if (FFAppState().MyListsGridView ==
                                            false) {
                                          return Builder(
                                            builder: (context) {
                                              final conditionalBuilderVar =
                                                  myListsPageAppUserCustomListsRowList
                                                      .toList();
                                              if (conditionalBuilderVar
                                                  .isEmpty) {
                                                return EmptyStateMyListsWidget();
                                              }

                                              return RefreshIndicator(
                                                key: Key(
                                                    'RefreshIndicator_2k1k701u'),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                onRefresh: () async {
                                                  safeSetState(() {
                                                    FFAppState()
                                                        .clearMyListsCacheCache();
                                                    _model.requestCompleted =
                                                        false;
                                                  });
                                                },
                                                child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      conditionalBuilderVar
                                                          .length,
                                                  itemBuilder: (context,
                                                      conditionalBuilderVarIndex) {
                                                    final conditionalBuilderVarItem =
                                                        conditionalBuilderVar[
                                                            conditionalBuilderVarIndex];
                                                    return Container(
                                                      height: 140.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            ListDetailPageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'listId':
                                                                  serializeParam(
                                                                conditionalBuilderVarItem
                                                                    .listId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .listFeaturedModels
                                                              .getModel(
                                                            conditionalBuilderVarItem
                                                                .listId!,
                                                            conditionalBuilderVarIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              ListFeaturedWidget(
                                                            key: Key(
                                                              'Keyuz9_${conditionalBuilderVarItem.listId!}',
                                                            ),
                                                            listTitle:
                                                                conditionalBuilderVarItem
                                                                    .listName,
                                                            listDescription:
                                                                conditionalBuilderVarItem
                                                                    .description,
                                                            thumbUrl1:
                                                                'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${conditionalBuilderVarItem.thumb1}',
                                                            thumbUrl2:
                                                                'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${conditionalBuilderVarItem.thumb2}',
                                                            thumbUrl3:
                                                                'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${conditionalBuilderVarItem.thumb3}',
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          return Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final myListsPageVar =
                                                      myListsPageAppUserCustomListsRowList
                                                          .toList();
                                                  if (myListsPageVar.isEmpty) {
                                                    return EmptyStateMyListsWidget();
                                                  }

                                                  return GridView.builder(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      0,
                                                      0,
                                                      24.0,
                                                    ),
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: () {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            kBreakpointSmall) {
                                                          return 3;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return 4;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return 6;
                                                        } else {
                                                          return 10;
                                                        }
                                                      }(),
                                                      crossAxisSpacing: 8.0,
                                                      mainAxisSpacing: 16.0,
                                                      childAspectRatio: 0.8,
                                                    ),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        myListsPageVar.length,
                                                    itemBuilder: (context,
                                                        myListsPageVarIndex) {
                                                      final myListsPageVarItem =
                                                          myListsPageVar[
                                                              myListsPageVarIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            ListDetailPageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'listId':
                                                                  serializeParam(
                                                                myListsPageVarItem
                                                                    .listId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .listThumbModels
                                                              .getModel(
                                                            myListsPageVarItem
                                                                .listId!,
                                                            myListsPageVarIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              ListThumbWidget(
                                                            key: Key(
                                                              'Keyunp_${myListsPageVarItem.listId!}',
                                                            ),
                                                            listTitle:
                                                                myListsPageVarItem
                                                                    .listName,
                                                            listDescription:
                                                                myListsPageVarItem
                                                                    .description,
                                                            thumbUrl1: myListsPageVarItem
                                                                            .thumb1 !=
                                                                        null &&
                                                                    myListsPageVarItem
                                                                            .thumb1 !=
                                                                        ''
                                                                ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${myListsPageVarItem.thumb1}'
                                                                : null,
                                                            thumbUrl2: myListsPageVarItem
                                                                            .thumb2 !=
                                                                        null &&
                                                                    myListsPageVarItem
                                                                            .thumb2 !=
                                                                        ''
                                                                ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${myListsPageVarItem.thumb2}'
                                                                : null,
                                                            thumbUrl3: myListsPageVarItem
                                                                            .thumb3 !=
                                                                        null &&
                                                                    myListsPageVarItem
                                                                            .thumb3 !=
                                                                        ''
                                                                ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${myListsPageVarItem.thumb3}'
                                                                : null,
                                                            colorBg: 'FFFFFF',
                                                            issueCount:
                                                                myListsPageVarItem
                                                                    .itemCount
                                                                    ?.toString(),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  if (currentUserUid == '')
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: wrapWithModel(
                                          model: _model.userAreaEmptyStateModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: UserAreaEmptyStateWidget(),
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
      },
    );
  }
}
