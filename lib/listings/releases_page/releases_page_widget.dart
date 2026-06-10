import '/backend/supabase/supabase.dart';
import '/components/items_and_thumbs/grid_item_issue/grid_item_issue_widget.dart';
import '/components/skeletons/grid_item_skeleton/grid_item_skeleton_widget.dart';
import '/components/skeletons/publisher_release_skeleton/publisher_release_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'releases_page_model.dart';
export 'releases_page_model.dart';

class ReleasesPageWidget extends StatefulWidget {
  const ReleasesPageWidget({super.key});

  static String routeName = 'ReleasesPage';
  static String routePath = '/releasesPage';

  @override
  State<ReleasesPageWidget> createState() => _ReleasesPageWidgetState();
}

class _ReleasesPageWidgetState extends State<ReleasesPageWidget> {
  late ReleasesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReleasesPageModel());

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
        title: 'Gibifolio - Lançamentos',
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
              title: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Lançamentos',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.fraunces(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                  ),
                ],
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: FutureBuilder<List<AppReleasesPublishersRow>>(
                future: FFAppState().releasesPublishers(
                  requestFn: () => AppReleasesPublishersTable().queryRows(
                    queryFn: (q) => q.order('issue_count'),
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return PublisherReleaseSkeletonWidget();
                  }
                  List<AppReleasesPublishersRow>
                      listViewAppReleasesPublishersRowList = snapshot.data!;

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewAppReleasesPublishersRowList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewAppReleasesPublishersRow =
                          listViewAppReleasesPublishersRowList[listViewIndex];
                      return Container(
                        width: double.infinity,
                        height: 248.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  PublisherReleasesPageWidget.routeName,
                                  queryParameters: {
                                    'publisherName': serializeParam(
                                      listViewAppReleasesPublishersRow
                                          .publisherName,
                                      ParamType.String,
                                    ),
                                    'publisherId': serializeParam(
                                      listViewAppReleasesPublishersRow
                                          .publisherId,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          listViewAppReleasesPublishersRow
                                              .publisherName,
                                          'Editora',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      if (listViewAppReleasesPublishersRow
                                              .issueCount >
                                          5)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                listViewAppReleasesPublishersRow
                                                    .issueCount
                                                    .toString(),
                                                '#',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.chevron_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FutureBuilder<List<AppReleasesFullRow>>(
                                future: AppReleasesFullTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'publisher_id',
                                        listViewAppReleasesPublishersRow
                                            .publisherId,
                                      )
                                      .order('primary_thumb')
                                      .order('canonical_key', ascending: true),
                                  limit: 5,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: GridItemSkeletonWidget(),
                                    );
                                  }
                                  List<AppReleasesFullRow>
                                      listViewAppReleasesFullRowList =
                                      snapshot.data!;

                                  return ListView.separated(
                                    padding: EdgeInsets.fromLTRB(
                                      16.0,
                                      0,
                                      16.0,
                                      0,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        listViewAppReleasesFullRowList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(width: 16.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewAppReleasesFullRow =
                                          listViewAppReleasesFullRowList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 8.0),
                                        child: Container(
                                          width: 88.0,
                                          decoration: BoxDecoration(),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                IssueDetailPageWidget.routeName,
                                                queryParameters: {
                                                  'issueId': serializeParam(
                                                    listViewAppReleasesFullRow
                                                        .issueId,
                                                    ParamType.String,
                                                  ),
                                                  'tittleId': serializeParam(
                                                    listViewAppReleasesFullRow
                                                        .titleId,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: wrapWithModel(
                                              model: _model.gridItemIssueModels
                                                  .getModel(
                                                listViewAppReleasesFullRow
                                                    .issueId!,
                                                listViewIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: GridItemIssueWidget(
                                                key: Key(
                                                  'Key89i_${listViewAppReleasesFullRow.issueId!}',
                                                ),
                                                issueId:
                                                    listViewAppReleasesFullRow
                                                        .issueId,
                                                showTitleInfo: true,
                                                issueNumber:
                                                    listViewAppReleasesFullRow
                                                        .issueNumber,
                                                titleName:
                                                    listViewAppReleasesFullRow
                                                        .titleName,
                                                titleId:
                                                    listViewAppReleasesFullRow
                                                        .titleId,
                                                thumb:
                                                    'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listViewAppReleasesFullRow.primaryThumb}',
                                                isAdult:
                                                    listViewAppReleasesFullRow
                                                        .isAdult,
                                                canSeeAdult: functions
                                                    .canSeeAdultContent(
                                                        FFAppState()
                                                            .currentUserBirthDateString,
                                                        FFAppState()
                                                            .adultContentEnabled),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Divider(
                              height: 1.0,
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ));
  }
}
