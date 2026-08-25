import '/backend/supabase/supabase.dart';
import '/components/items_and_thumbs/grid_item_list/grid_item_list_widget.dart';
import '/components/items_and_thumbs/list_featured/list_featured_widget.dart';
import '/components/skeletons/grid_item_skeleton/grid_item_skeleton_widget.dart';
import '/components/skeletons/list_featured_loading/list_featured_loading_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lists_page_model.dart';
export 'lists_page_model.dart';

class ListsPageWidget extends StatefulWidget {
  const ListsPageWidget({
    super.key,
    this.filter,
    this.title,
  });

  final String? filter;
  final String? title;

  static String routeName = 'ListsPage';
  static String routePath = '/List';

  @override
  State<ListsPageWidget> createState() => _ListsPageWidgetState();
}

class _ListsPageWidgetState extends State<ListsPageWidget> {
  late ListsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListsPageModel());

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
        title: 'Gibifolio - Listas',
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
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                title: Text(
                  valueOrDefault<String>(
                    widget.title,
                    'Listas de leitura',
                  ),
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.fraunces(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                ),
                actions: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (FFAppState().MyListsGridView)
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 48.0,
                          icon: Icon(
                            FFIcons.klist,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            FFAppState().MyListsGridView = false;
                            safeSetState(() {});
                          },
                        ),
                      if (!FFAppState().MyListsGridView)
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 48.0,
                          icon: Icon(
                            FFIcons.kgridL,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            FFAppState().MyListsGridView = true;
                            safeSetState(() {});
                          },
                        ),
                    ],
                  ),
                ],
                centerTitle: true,
                elevation: 0.0,
              ),
              body: SafeArea(
                top: true,
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                    child: Builder(
                      builder: (context) {
                        if (FFAppState().MyListsGridView == false) {
                          return FutureBuilder<List<AppFeaturedListThumbsRow>>(
                            future: AppFeaturedListThumbsTable().queryRows(
                              queryFn: (q) => q
                                  .eqOrNull(
                                    'labels',
                                    widget.filter,
                                  )
                                  .order('list_name', ascending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return ListFeaturedLoadingWidget();
                              }
                              List<AppFeaturedListThumbsRow>
                                  listAppFeaturedListThumbsRowList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listAppFeaturedListThumbsRowList.length,
                                itemBuilder: (context, listIndex) {
                                  final listAppFeaturedListThumbsRow =
                                      listAppFeaturedListThumbsRowList[
                                          listIndex];
                                  return Container(
                                    height: 140.0,
                                    decoration: BoxDecoration(),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          ListDetailPageWidget.routeName,
                                          queryParameters: {
                                            'listId': serializeParam(
                                              listAppFeaturedListThumbsRow
                                                  .listId,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: wrapWithModel(
                                        model:
                                            _model.listFeaturedModels.getModel(
                                          listAppFeaturedListThumbsRow.listId!,
                                          listIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: ListFeaturedWidget(
                                          key: Key(
                                            'Key35q_${listAppFeaturedListThumbsRow.listId!}',
                                          ),
                                          listTitle:
                                              listAppFeaturedListThumbsRow
                                                  .listName,
                                          listDescription:
                                              listAppFeaturedListThumbsRow
                                                  .description,
                                          thumbUrl1:
                                              'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listAppFeaturedListThumbsRow.thumb1}',
                                          thumbUrl2:
                                              'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listAppFeaturedListThumbsRow.thumb2}',
                                          thumbUrl3:
                                              'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listAppFeaturedListThumbsRow.thumb3}',
                                          listAuthor:
                                              listAppFeaturedListThumbsRow
                                                  .authorSlug,
                                          isAuthorVerified:
                                              listAppFeaturedListThumbsRow
                                                  .authorIsVerified,
                                          isPublic: true,
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
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child:
                                  FutureBuilder<List<AppFeaturedListThumbsRow>>(
                                future: AppFeaturedListThumbsTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'labels',
                                        widget.filter,
                                      )
                                      .order('list_name', ascending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return GridItemSkeletonWidget();
                                  }
                                  List<AppFeaturedListThumbsRow>
                                      gridAppFeaturedListThumbsRowList =
                                      snapshot.data!;

                                  return GridView.builder(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      24.0,
                                    ),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: () {
                                        if (MediaQuery.sizeOf(context).width <
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
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 16.0,
                                      childAspectRatio: 0.65,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        gridAppFeaturedListThumbsRowList.length,
                                    itemBuilder: (context, gridIndex) {
                                      final gridAppFeaturedListThumbsRow =
                                          gridAppFeaturedListThumbsRowList[
                                              gridIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            ListDetailPageWidget.routeName,
                                            queryParameters: {
                                              'listId': serializeParam(
                                                gridAppFeaturedListThumbsRow
                                                    .listId,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model.gridItemListModels
                                              .getModel(
                                            gridAppFeaturedListThumbsRow
                                                .listId!,
                                            gridIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: GridItemListWidget(
                                            key: Key(
                                              'Keyanp_${gridAppFeaturedListThumbsRow.listId!}',
                                            ),
                                            listTitle:
                                                gridAppFeaturedListThumbsRow
                                                    .listName,
                                            listDescription:
                                                gridAppFeaturedListThumbsRow
                                                    .description,
                                            thumbUrl1: gridAppFeaturedListThumbsRow
                                                            .thumb1 !=
                                                        null &&
                                                    gridAppFeaturedListThumbsRow
                                                            .thumb1 !=
                                                        ''
                                                ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${gridAppFeaturedListThumbsRow.thumb1}'
                                                : null,
                                            thumbUrl2: gridAppFeaturedListThumbsRow
                                                            .thumb2 !=
                                                        null &&
                                                    gridAppFeaturedListThumbsRow
                                                            .thumb2 !=
                                                        ''
                                                ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${gridAppFeaturedListThumbsRow.thumb2}'
                                                : null,
                                            thumbUrl3: gridAppFeaturedListThumbsRow
                                                            .thumb3 !=
                                                        null &&
                                                    gridAppFeaturedListThumbsRow
                                                            .thumb3 !=
                                                        ''
                                                ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${gridAppFeaturedListThumbsRow.thumb3}'
                                                : null,
                                            colorBg: 'FFFFFF',
                                            issueCount:
                                                gridAppFeaturedListThumbsRow
                                                    .itemCount
                                                    ?.toString(),
                                            isPublic: true,
                                            isAuthorVerified:
                                                gridAppFeaturedListThumbsRow
                                                    .authorIsVerified,
                                            listAuthor:
                                                gridAppFeaturedListThumbsRow
                                                    .authorSlug,
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
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
