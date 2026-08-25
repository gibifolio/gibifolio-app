import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/components/bottom_sheets/create_list_bottom_sheet/create_list_bottom_sheet_widget.dart';
import '/components/bottom_sheets/my_lists_bottom_sheet/my_lists_bottom_sheet_widget.dart';
import '/components/items_and_thumbs/grid_item_list/grid_item_list_widget.dart';
import '/components/items_and_thumbs/list_featured/list_featured_widget.dart';
import '/components/skeletons/empty_state_following_lists/empty_state_following_lists_widget.dart';
import '/components/skeletons/empty_state_my_lists/empty_state_my_lists_widget.dart';
import '/components/skeletons/user_area_empty_state/user_area_empty_state_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
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

class _MyListsPageWidgetState extends State<MyListsPageWidget>
    with TickerProviderStateMixin {
  late MyListsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyListsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userListsBuffer = await actions.loadUserListsBuffer();
      FFAppState().userListsBuffer =
          _model.userListsBuffer!.toList().cast<UserListItemStruct>();
      await actions.sortUserListsBuffer(
        FFAppState().listSortCriterion,
      );
      if (FFAppState().needsLibraryRefresh) {
        await actions.refreshUserListsBuffer();
      }
      FFAppState().needsLibraryRefresh = false;
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, _) => [
                  if (currentUserUid != '')
                    SliverAppBar(
                      pinned: false,
                      floating: true,
                      snap: true,
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      automaticallyImplyLeading: false,
                      leading: FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 48.0,
                        icon: Icon(
                          Icons.library_add_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
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
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: CreateListBottomSheetWidget(
                                    onListCreated: () async {
                                      context.pushNamed(
                                        ListDetailPageWidget.routeName,
                                        queryParameters: {
                                          'listId': serializeParam(
                                            FFAppState().newlyCreatedListId,
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
                      title: Visibility(
                        visible:
                            (FFAppState().userListsBuffer.isNotEmpty) == true,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (FFAppState().listSortCriterion == 'manual')
                              FFButtonWidget(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: MyListsBottomSheetWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                text: 'Ordem manual',
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 0.0, 8.0, 0.0),
                                  iconAlignment: IconAlignment.end,
                                  iconPadding: EdgeInsets.all(0.0),
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.fraunces(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                            if (FFAppState().listSortCriterion == 'recents')
                              FFButtonWidget(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: MyListsBottomSheetWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                text: 'Recentes\n',
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 0.0, 8.0, 0.0),
                                  iconAlignment: IconAlignment.end,
                                  iconPadding: EdgeInsets.all(0.0),
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.fraunces(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                            if (FFAppState().listSortCriterion ==
                                'alphabetical')
                              FFButtonWidget(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: MyListsBottomSheetWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                text: 'Ordem alfabética',
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 0.0, 8.0, 0.0),
                                  iconAlignment: IconAlignment.end,
                                  iconPadding: EdgeInsets.all(0.0),
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.fraunces(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                          ]
                              .addToStart(SizedBox(width: 12.0))
                              .addToEnd(SizedBox(width: 12.0)),
                        ),
                      ),
                      actions: [
                        Visibility(
                          visible:
                              (FFAppState().userListsBuffer.isNotEmpty) == true,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (FFAppState().MyListsGridView)
                                  FlutterFlowIconButton(
                                    borderRadius: 100.0,
                                    buttonSize: 48.0,
                                    icon: Icon(
                                      Icons.list,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      FFAppState().MyListsGridView = false;
                                      safeSetState(() {});
                                    },
                                  ),
                                if (!FFAppState().MyListsGridView)
                                  FlutterFlowIconButton(
                                    borderRadius: 100.0,
                                    buttonSize: 48.0,
                                    icon: Icon(
                                      Icons.grid_view,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      FFAppState().MyListsGridView = true;
                                      safeSetState(() {});
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
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                      unselectedLabelStyle: FlutterFlowTheme.of(
                                              context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      tabs: [
                                        Tab(
                                          text: 'Todas',
                                        ),
                                        Tab(
                                          text: 'Minhas',
                                        ),
                                        Tab(
                                          text: 'Seguindo',
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [
                                          () async {},
                                          () async {},
                                          () async {}
                                        ][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: [
                                        RefreshIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          onRefresh: () async {
                                            await actions
                                                .refreshUserListsBuffer();
                                          },
                                          child: SingleChildScrollView(
                                            primary: false,
                                            physics:
                                                const AlwaysScrollableScrollPhysics(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if ((FFAppState()
                                                        .userListsBuffer
                                                        .isNotEmpty) ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        if (FFAppState()
                                                                .listSortCriterion ==
                                                            'manual')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                context
                                                                    .pushNamed(
                                                                  MyListsReorderPageWidget
                                                                      .routeName,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    '__transition_info__':
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .bottomToTop,
                                                                    ),
                                                                  },
                                                                );
                                                              },
                                                              text: 'Reordenar',
                                                              icon: Icon(
                                                                FFIcons.ksort,
                                                                size: 16.0,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 40.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                                iconColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          12.0,
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
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              showLoadingIndicator:
                                                                  false,
                                                            ),
                                                          ),
                                                        Spacer(),
                                                      ]
                                                          .addToStart(SizedBox(
                                                              width: 12.0))
                                                          .addToEnd(SizedBox(
                                                              width: 12.0)),
                                                    ),
                                                  ),
                                                if (currentUserUid != '')
                                                  Builder(
                                                    builder: (context) {
                                                      if (FFAppState()
                                                              .MyListsGridView ==
                                                          false) {
                                                        return Builder(
                                                          builder: (context) {
                                                            final userListsList =
                                                                FFAppState()
                                                                    .userListsBuffer
                                                                    .toList();
                                                            if (userListsList
                                                                .isEmpty) {
                                                              return EmptyStateMyListsWidget();
                                                            }

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  userListsList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  userListsListIndex) {
                                                                final userListsListItem =
                                                                    userListsList[
                                                                        userListsListIndex];
                                                                return Container(
                                                                  height: 140.0,
                                                                  decoration:
                                                                      BoxDecoration(),
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
                                                                        ListDetailPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'listId':
                                                                              serializeParam(
                                                                            userListsListItem.listId,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .listFeaturedModels1
                                                                          .getModel(
                                                                        userListsListItem
                                                                            .listId,
                                                                        userListsListIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          ListFeaturedWidget(
                                                                        key:
                                                                            Key(
                                                                          'Keyd0m_${userListsListItem.listId}',
                                                                        ),
                                                                        listTitle:
                                                                            userListsListItem.listName,
                                                                        listDescription:
                                                                            userListsListItem.description,
                                                                        thumbUrl1:
                                                                            'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${userListsListItem.thumb1}',
                                                                        thumbUrl2:
                                                                            'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${userListsListItem.thumb2}',
                                                                        thumbUrl3:
                                                                            'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${userListsListItem.thumb3}',
                                                                        listAuthor:
                                                                            userListsListItem.authorSlug,
                                                                        isAuthorVerified:
                                                                            userListsListItem.authorIsVerified,
                                                                        isPublic:
                                                                            userListsListItem.isFollowed,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final userListsGrid =
                                                                    FFAppState()
                                                                        .userListsBuffer
                                                                        .toList();
                                                                if (userListsGrid
                                                                    .isEmpty) {
                                                                  return EmptyStateMyListsWidget();
                                                                }

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .fromLTRB(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    24.0,
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
                                                                        8.0,
                                                                    mainAxisSpacing:
                                                                        24.0,
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
                                                                      userListsGrid
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          userListsGridIndex) {
                                                                    final userListsGridItem =
                                                                        userListsGrid[
                                                                            userListsGridIndex];
                                                                    return InkWell(
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
                                                                          ListDetailPageWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'listId':
                                                                                serializeParam(
                                                                              userListsGridItem.listId,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .gridItemListModels1
                                                                            .getModel(
                                                                          userListsGridItem
                                                                              .listId,
                                                                          userListsGridIndex,
                                                                        ),
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            GridItemListWidget(
                                                                          key:
                                                                              Key(
                                                                            'Keyfza_${userListsGridItem.listId}',
                                                                          ),
                                                                          listTitle:
                                                                              userListsGridItem.listName,
                                                                          listDescription:
                                                                              userListsGridItem.description,
                                                                          thumbUrl1: userListsGridItem.thumb1 != ''
                                                                              ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${userListsGridItem.thumb1}'
                                                                              : null,
                                                                          thumbUrl2: userListsGridItem.thumb2 != ''
                                                                              ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${userListsGridItem.thumb2}'
                                                                              : null,
                                                                          thumbUrl3: userListsGridItem.thumb3 != ''
                                                                              ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${userListsGridItem.thumb3}'
                                                                              : null,
                                                                          colorBg:
                                                                              'FFFFFF',
                                                                          issueCount:
                                                                              '',
                                                                          isPublic:
                                                                              userListsGridItem.isFollowed,
                                                                          isAuthorVerified:
                                                                              userListsGridItem.authorIsVerified,
                                                                          listAuthor:
                                                                              userListsGridItem.authorSlug,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                        RefreshIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          onRefresh: () async {
                                            await actions
                                                .refreshUserListsBuffer();
                                          },
                                          child: SingleChildScrollView(
                                            primary: false,
                                            physics:
                                                const AlwaysScrollableScrollPhysics(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if ((FFAppState()
                                                        .userListsBuffer
                                                        .isNotEmpty) ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        if (FFAppState()
                                                                .listSortCriterion ==
                                                            'manual')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                context
                                                                    .pushNamed(
                                                                  MyListsReorderPageWidget
                                                                      .routeName,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    '__transition_info__':
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .bottomToTop,
                                                                    ),
                                                                  },
                                                                );
                                                              },
                                                              text: 'Reordenar',
                                                              icon: Icon(
                                                                FFIcons.ksort,
                                                                size: 16.0,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 40.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                                iconColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          12.0,
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
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              showLoadingIndicator:
                                                                  false,
                                                            ),
                                                          ),
                                                        Spacer(),
                                                      ]
                                                          .addToStart(SizedBox(
                                                              width: 12.0))
                                                          .addToEnd(SizedBox(
                                                              width: 12.0)),
                                                    ),
                                                  ),
                                                if (currentUserUid != '')
                                                  Builder(
                                                    builder: (context) {
                                                      if (FFAppState()
                                                              .MyListsGridView ==
                                                          false) {
                                                        return Builder(
                                                          builder: (context) {
                                                            final filterOwnedLists = functions
                                                                .filterOwnedLists(
                                                                    FFAppState()
                                                                        .userListsBuffer
                                                                        .toList())
                                                                .toList();
                                                            if (filterOwnedLists
                                                                .isEmpty) {
                                                              return EmptyStateMyListsWidget();
                                                            }

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  filterOwnedLists
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  filterOwnedListsIndex) {
                                                                final filterOwnedListsItem =
                                                                    filterOwnedLists[
                                                                        filterOwnedListsIndex];
                                                                return Container(
                                                                  height: 140.0,
                                                                  decoration:
                                                                      BoxDecoration(),
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
                                                                        ListDetailPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'listId':
                                                                              serializeParam(
                                                                            filterOwnedListsItem.listId,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .listFeaturedModels2
                                                                          .getModel(
                                                                        filterOwnedListsItem
                                                                            .listId,
                                                                        filterOwnedListsIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          ListFeaturedWidget(
                                                                        key:
                                                                            Key(
                                                                          'Key6a1_${filterOwnedListsItem.listId}',
                                                                        ),
                                                                        listTitle:
                                                                            filterOwnedListsItem.listName,
                                                                        listDescription:
                                                                            filterOwnedListsItem.description,
                                                                        thumbUrl1:
                                                                            'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${filterOwnedListsItem.thumb1}',
                                                                        thumbUrl2:
                                                                            'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${filterOwnedListsItem.thumb2}',
                                                                        thumbUrl3:
                                                                            'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${filterOwnedListsItem.thumb3}',
                                                                        listAuthor:
                                                                            filterOwnedListsItem.authorSlug,
                                                                        isAuthorVerified:
                                                                            filterOwnedListsItem.authorIsVerified,
                                                                        isPublic:
                                                                            false,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final filterOwnedListsGrid = functions
                                                                    .filterOwnedLists(FFAppState()
                                                                        .userListsBuffer
                                                                        .toList())
                                                                    .toList();
                                                                if (filterOwnedListsGrid
                                                                    .isEmpty) {
                                                                  return EmptyStateMyListsWidget();
                                                                }

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .fromLTRB(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    24.0,
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
                                                                        8.0,
                                                                    mainAxisSpacing:
                                                                        24.0,
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
                                                                      filterOwnedListsGrid
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          filterOwnedListsGridIndex) {
                                                                    final filterOwnedListsGridItem =
                                                                        filterOwnedListsGrid[
                                                                            filterOwnedListsGridIndex];
                                                                    return InkWell(
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
                                                                          ListDetailPageWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'listId':
                                                                                serializeParam(
                                                                              filterOwnedListsGridItem.listId,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .gridItemListModels2
                                                                            .getModel(
                                                                          filterOwnedListsGridItem
                                                                              .listId,
                                                                          filterOwnedListsGridIndex,
                                                                        ),
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            GridItemListWidget(
                                                                          key:
                                                                              Key(
                                                                            'Keydkk_${filterOwnedListsGridItem.listId}',
                                                                          ),
                                                                          listTitle:
                                                                              filterOwnedListsGridItem.listName,
                                                                          listDescription:
                                                                              filterOwnedListsGridItem.description,
                                                                          thumbUrl1: filterOwnedListsGridItem.thumb1 != ''
                                                                              ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${filterOwnedListsGridItem.thumb1}'
                                                                              : null,
                                                                          thumbUrl2: filterOwnedListsGridItem.thumb2 != ''
                                                                              ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${filterOwnedListsGridItem.thumb2}'
                                                                              : null,
                                                                          thumbUrl3: filterOwnedListsGridItem.thumb3 != ''
                                                                              ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${filterOwnedListsGridItem.thumb3}'
                                                                              : null,
                                                                          colorBg:
                                                                              'FFFFFF',
                                                                          issueCount:
                                                                              '',
                                                                          isPublic:
                                                                              false,
                                                                          isAuthorVerified:
                                                                              filterOwnedListsGridItem.authorIsVerified,
                                                                          listAuthor:
                                                                              filterOwnedListsGridItem.authorSlug,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                        RefreshIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          onRefresh: () async {
                                            await actions
                                                .refreshUserListsBuffer();
                                          },
                                          child: SingleChildScrollView(
                                            primary: false,
                                            physics:
                                                const AlwaysScrollableScrollPhysics(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if ((FFAppState()
                                                        .userListsBuffer
                                                        .isNotEmpty) ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        if (FFAppState()
                                                                .listSortCriterion ==
                                                            'manual')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                context
                                                                    .pushNamed(
                                                                  MyListsReorderPageWidget
                                                                      .routeName,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    '__transition_info__':
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .bottomToTop,
                                                                    ),
                                                                  },
                                                                );
                                                              },
                                                              text: 'Reordenar',
                                                              icon: Icon(
                                                                FFIcons.ksort,
                                                                size: 16.0,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 40.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                                iconColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          12.0,
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
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              showLoadingIndicator:
                                                                  false,
                                                            ),
                                                          ),
                                                        Spacer(),
                                                      ]
                                                          .addToStart(SizedBox(
                                                              width: 12.0))
                                                          .addToEnd(SizedBox(
                                                              width: 12.0)),
                                                    ),
                                                  ),
                                                if (currentUserUid != '')
                                                  Builder(
                                                    builder: (context) {
                                                      if (FFAppState()
                                                              .MyListsGridView ==
                                                          false) {
                                                        return Builder(
                                                          builder: (context) {
                                                            final filterFollowedLists = functions
                                                                .filterFollowedLists(
                                                                    FFAppState()
                                                                        .userListsBuffer
                                                                        .toList())
                                                                .toList();
                                                            if (filterFollowedLists
                                                                .isEmpty) {
                                                              return EmptyStateFollowingListsWidget();
                                                            }

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  filterFollowedLists
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  filterFollowedListsIndex) {
                                                                final filterFollowedListsItem =
                                                                    filterFollowedLists[
                                                                        filterFollowedListsIndex];
                                                                return Container(
                                                                  height: 140.0,
                                                                  decoration:
                                                                      BoxDecoration(),
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
                                                                        ListDetailPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'listId':
                                                                              serializeParam(
                                                                            filterFollowedListsItem.listId,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .listFeaturedModels3
                                                                          .getModel(
                                                                        filterFollowedListsItem
                                                                            .listId,
                                                                        filterFollowedListsIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          ListFeaturedWidget(
                                                                        key:
                                                                            Key(
                                                                          'Key9ng_${filterFollowedListsItem.listId}',
                                                                        ),
                                                                        listTitle:
                                                                            filterFollowedListsItem.listName,
                                                                        listDescription:
                                                                            filterFollowedListsItem.description,
                                                                        thumbUrl1:
                                                                            'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${filterFollowedListsItem.thumb1}',
                                                                        thumbUrl2:
                                                                            'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${filterFollowedListsItem.thumb2}',
                                                                        thumbUrl3:
                                                                            'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${filterFollowedListsItem.thumb3}',
                                                                        listAuthor:
                                                                            filterFollowedListsItem.authorSlug,
                                                                        isAuthorVerified:
                                                                            filterFollowedListsItem.authorIsVerified,
                                                                        isPublic:
                                                                            filterFollowedListsItem.isFollowed,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final filterFollowedListsGrid = functions
                                                                    .filterFollowedLists(FFAppState()
                                                                        .userListsBuffer
                                                                        .toList())
                                                                    .toList();
                                                                if (filterFollowedListsGrid
                                                                    .isEmpty) {
                                                                  return EmptyStateMyListsWidget();
                                                                }

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .fromLTRB(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    24.0,
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
                                                                        8.0,
                                                                    mainAxisSpacing:
                                                                        24.0,
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
                                                                      filterFollowedListsGrid
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          filterFollowedListsGridIndex) {
                                                                    final filterFollowedListsGridItem =
                                                                        filterFollowedListsGrid[
                                                                            filterFollowedListsGridIndex];
                                                                    return InkWell(
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
                                                                          ListDetailPageWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'listId':
                                                                                serializeParam(
                                                                              filterFollowedListsGridItem.listId,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .gridItemListModels3
                                                                            .getModel(
                                                                          filterFollowedListsGridItem
                                                                              .listId,
                                                                          filterFollowedListsGridIndex,
                                                                        ),
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            GridItemListWidget(
                                                                          key:
                                                                              Key(
                                                                            'Key1i6_${filterFollowedListsGridItem.listId}',
                                                                          ),
                                                                          listTitle:
                                                                              filterFollowedListsGridItem.listName,
                                                                          listDescription:
                                                                              filterFollowedListsGridItem.description,
                                                                          thumbUrl1: filterFollowedListsGridItem.thumb1 != ''
                                                                              ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${filterFollowedListsGridItem.thumb1}'
                                                                              : null,
                                                                          thumbUrl2: filterFollowedListsGridItem.thumb2 != ''
                                                                              ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${filterFollowedListsGridItem.thumb2}'
                                                                              : null,
                                                                          thumbUrl3: filterFollowedListsGridItem.thumb3 != ''
                                                                              ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${filterFollowedListsGridItem.thumb3}'
                                                                              : null,
                                                                          colorBg:
                                                                              'FFFFFF',
                                                                          issueCount:
                                                                              '',
                                                                          isPublic:
                                                                              filterFollowedListsGridItem.isFollowed,
                                                                          isAuthorVerified:
                                                                              filterFollowedListsGridItem.authorIsVerified,
                                                                          listAuthor:
                                                                              filterFollowedListsGridItem.authorName,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                              if (currentUserUid == '')
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: wrapWithModel(
                                    model: _model.userAreaEmptyStateModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: UserAreaEmptyStateWidget(),
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
