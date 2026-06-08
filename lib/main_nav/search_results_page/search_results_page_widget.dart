import '/components/items_and_thumbs/list_item/list_item_widget.dart';
import '/components/skeletons/list_item_skeleton_l/list_item_skeleton_l_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_results_page_model.dart';
export 'search_results_page_model.dart';

class SearchResultsPageWidget extends StatefulWidget {
  const SearchResultsPageWidget({
    super.key,
    String? searchQuery,
  }) : this.searchQuery = searchQuery ?? '';

  final String searchQuery;

  static String routeName = 'SearchResultsPage';
  static String routePath = '/searchResults';

  @override
  State<SearchResultsPageWidget> createState() =>
      _SearchResultsPageWidgetState();
}

class _SearchResultsPageWidgetState extends State<SearchResultsPageWidget> {
  late SearchResultsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchResultsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.fetchSearchResults(
        widget.searchQuery,
      );
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
        title: 'Gibifolio - Resultados',
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
              title: Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\"${widget.searchQuery}\"',
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: RefreshIndicator(
                color: FlutterFlowTheme.of(context).primary,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                onRefresh: () async {
                  safeSetState(() {});
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            minHeight: MediaQuery.sizeOf(context).height * 1.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final searchResults =
                                  FFAppState().searchResults.toList();
                              if (searchResults.isEmpty) {
                                return ListItemSkeletonLWidget();
                              }

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: searchResults.length,
                                itemBuilder: (context, searchResultsIndex) {
                                  final searchResultsItem =
                                      searchResults[searchResultsIndex];
                                  return wrapWithModel(
                                    model: _model.listItemModels.getModel(
                                      searchResultsItem.titleId,
                                      searchResultsIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: ListItemWidget(
                                      key: Key(
                                        'Keyz36_${searchResultsItem.titleId}',
                                      ),
                                      issueId: searchResultsItem.singleIssueId,
                                      showTitleInfo: true,
                                      titleName: searchResultsItem.titleName,
                                      titleSubtitle:
                                          searchResultsItem.titleSubtitle,
                                      publisherName:
                                          searchResultsItem.publisherName,
                                      licensors: searchResultsItem.licensors,
                                      entityType: 'title',
                                      entityId: searchResultsItem.titleId,
                                      series: searchResultsItem.series,
                                      publicationStatus:
                                          searchResultsItem.publicationStatus,
                                      issueCount: searchResultsItem.issueCount,
                                      isSingleIssue:
                                          searchResultsItem.singleIssueId ==
                                              '1',
                                      singleIssueId:
                                          searchResultsItem.singleIssueId,
                                      singleIssuePages:
                                          searchResultsItem.singleIssuePages,
                                      indexPosition: searchResultsIndex,
                                      thumb:
                                          'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${searchResultsItem.firstIssueThumb}',
                                      thumb2:
                                          'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${searchResultsItem.secondIssueThumb}',
                                      thumb3:
                                          'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${searchResultsItem.thirdIssueThumb}',
                                      showDivider: true,
                                      selectionEnabled: false,
                                      showStatus: true,
                                      isAdult: searchResultsItem.isAdult,
                                      canSeeAdult: functions.canSeeAdultContent(
                                          FFAppState()
                                              .currentUserBirthDateString,
                                          FFAppState().adultContentEnabled),
                                      onTap: () async {
                                        if ((searchResultsItem.issueCount <
                                                2) &&
                                            (searchResultsItem
                                                        .singleIssueId !=
                                                    '')) {
                                          context.pushNamed(
                                            IssueDetailPageWidget.routeName,
                                            queryParameters: {
                                              'issueId': serializeParam(
                                                searchResultsItem.singleIssueId,
                                                ParamType.String,
                                              ),
                                              'tittleId': serializeParam(
                                                searchResultsItem.titleId,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          context.pushNamed(
                                            TitleDetailPageWidget.routeName,
                                            queryParameters: {
                                              'titleId': serializeParam(
                                                searchResultsItem.titleId,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      },
                                      onSaved: () async {
                                        FFAppState().needsLibraryRefresh =
                                            false;
                                        safeSetState(() {});
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Visibility(
                            visible: (FFAppState().searchResults.length > 0) &&
                                (FFAppState().searchOffset ==
                                    FFAppState().searchResults.length),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await actions.fetchMoreResults(
                                  widget.searchQuery,
                                );
                              },
                              text: 'Carregar mais resultados',
                              icon: Icon(
                                Icons.arrow_downward_sharp,
                                size: 20.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 8.0, 12.0, 8.0),
                                iconPadding: EdgeInsets.all(0.0),
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
