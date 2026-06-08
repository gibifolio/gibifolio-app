import '/backend/supabase/supabase.dart';
import '/components/items_and_thumbs/grid_item_issue/grid_item_issue_widget.dart';
import '/components/skeletons/grid_item_skeleton/grid_item_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'publisher_releases_page_model.dart';
export 'publisher_releases_page_model.dart';

class PublisherReleasesPageWidget extends StatefulWidget {
  const PublisherReleasesPageWidget({
    super.key,
    this.publisherName,
    this.publisherId,
  });

  final String? publisherName;
  final String? publisherId;

  static String routeName = 'PublisherReleasesPage';
  static String routePath = '/publisherReleasesPage';

  @override
  State<PublisherReleasesPageWidget> createState() =>
      _PublisherReleasesPageWidgetState();
}

class _PublisherReleasesPageWidgetState
    extends State<PublisherReleasesPageWidget> {
  late PublisherReleasesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PublisherReleasesPageModel());

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
                    'Lançamentos ',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(context).bodySmall.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodySmall.fontStyle,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.publisherName,
                      'Editora',
                    ),
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(24.0),
                      child: FutureBuilder<List<AppReleasesFullRow>>(
                        future: AppReleasesFullTable().queryRows(
                          queryFn: (q) => q
                              .eqOrNull(
                                'publisher_id',
                                widget.publisherId,
                              )
                              .order('canonical_key', ascending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return GridItemSkeletonWidget();
                          }
                          List<AppReleasesFullRow>
                              gridViewAppReleasesFullRowList = snapshot.data!;

                          return GridView.builder(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              16.0,
                              0,
                              16.0,
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 24.0,
                              mainAxisSpacing: 40.0,
                              childAspectRatio: 0.65,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewAppReleasesFullRowList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewAppReleasesFullRow =
                                  gridViewAppReleasesFullRowList[gridViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    IssueDetailPageWidget.routeName,
                                    queryParameters: {
                                      'issueId': serializeParam(
                                        gridViewAppReleasesFullRow.issueId,
                                        ParamType.String,
                                      ),
                                      'tittleId': serializeParam(
                                        gridViewAppReleasesFullRow.titleId,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: wrapWithModel(
                                  model: _model.gridItemIssueModels.getModel(
                                    gridViewAppReleasesFullRow.issueId!,
                                    gridViewIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: GridItemIssueWidget(
                                    key: Key(
                                      'Keyo1x_${gridViewAppReleasesFullRow.issueId!}',
                                    ),
                                    issueId: gridViewAppReleasesFullRow.issueId,
                                    showTitleInfo: true,
                                    issueNumber:
                                        gridViewAppReleasesFullRow.issueNumber,
                                    titleName:
                                        gridViewAppReleasesFullRow.titleName,
                                    titleId: gridViewAppReleasesFullRow.titleId,
                                    thumb:
                                        'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${gridViewAppReleasesFullRow.primaryThumb}',
                                    isAdult: gridViewAppReleasesFullRow.isAdult,
                                    canSeeAdult: functions.canSeeAdultContent(
                                        FFAppState().currentUserBirthDateString,
                                        FFAppState().adultContentEnabled),
                                  ),
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
        ));
  }
}
