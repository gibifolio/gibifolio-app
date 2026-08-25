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
import 'licensor_titles_page_model.dart';
export 'licensor_titles_page_model.dart';

class LicensorTitlesPageWidget extends StatefulWidget {
  const LicensorTitlesPageWidget({
    super.key,
    this.licensorId,
    this.licensorName,
  });

  final int? licensorId;
  final String? licensorName;

  static String routeName = 'LicensorTitlesPage';
  static String routePath = '/LicensorTitlesPage';

  @override
  State<LicensorTitlesPageWidget> createState() =>
      _LicensorTitlesPageWidgetState();
}

class _LicensorTitlesPageWidgetState extends State<LicensorTitlesPageWidget> {
  late LicensorTitlesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LicensorTitlesPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.fetchLicensorTitles(
        widget.licensorId!,
        0,
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
        title: 'Gibifolio - Editora',
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
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.licensorName,
                        'Licenciadora',
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
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
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
                                minHeight:
                                    MediaQuery.sizeOf(context).height * 1.0,
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
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: ListItemWidget(
                                          key: Key(
                                            'Keya5w_${searchResultsItem.titleId}',
                                          ),
                                          issueId:
                                              searchResultsItem.singleIssueId,
                                          showTitleInfo: true,
                                          titleName:
                                              searchResultsItem.titleName,
                                          titleSubtitle:
                                              searchResultsItem.titleSubtitle,
                                          publisherName:
                                              searchResultsItem.publisherName,
                                          licensors:
                                              searchResultsItem.licensors,
                                          entityType: 'title',
                                          entityId: searchResultsItem.titleId,
                                          series: searchResultsItem.series,
                                          publicationStatus: searchResultsItem
                                              .publicationStatus,
                                          issueCount:
                                              searchResultsItem.issueCount,
                                          isSingleIssue:
                                              searchResultsItem.singleIssueId ==
                                                  '1',
                                          singleIssueId:
                                              searchResultsItem.singleIssueId,
                                          singleIssuePages: searchResultsItem
                                              .singleIssuePages,
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
                                          canSeeAdult:
                                              functions.canSeeAdultContent(
                                                  FFAppState()
                                                      .currentUserBirthDateString,
                                                  FFAppState()
                                                      .adultContentEnabled),
                                          showIndex: false,
                                          preTitle: searchResultsItem.preTitle,
                                          formatLabel:
                                              searchResultsItem.formatLabel,
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
                                                    searchResultsItem
                                                        .singleIssueId,
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
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Visibility(
                              visible:
                                  (FFAppState().searchResults.length > 0) &&
                                      (FFAppState().searchOffset ==
                                          FFAppState().searchResults.length),
                              child: Padding(
                                padding: EdgeInsets.all(24.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await actions.fetchLicensorTitles(
                                      widget.licensorId!,
                                      0,
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
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
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
            ),
          ),
        ));
  }
}
