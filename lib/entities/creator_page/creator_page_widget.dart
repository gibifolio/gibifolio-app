import '/backend/supabase/supabase.dart';
import '/components/items_and_thumbs/list_item/list_item_widget.dart';
import '/components/skeletons/list_item_skeleton_l/list_item_skeleton_l_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'creator_page_model.dart';
export 'creator_page_model.dart';

class CreatorPageWidget extends StatefulWidget {
  const CreatorPageWidget({
    super.key,
    this.creatorId,
    this.creatorName,
  });

  final String? creatorId;
  final String? creatorName;

  static String routeName = 'CreatorPage';
  static String routePath = '/CreatorPage';

  @override
  State<CreatorPageWidget> createState() => _CreatorPageWidgetState();
}

class _CreatorPageWidgetState extends State<CreatorPageWidget> {
  late CreatorPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatorPageModel());

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
        title: 'Gibifolio - Autor',
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
                        widget.creatorName,
                        'Autor',
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
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FutureBuilder<List<AppCreatorStoriesRow>>(
                        future: AppCreatorStoriesTable().queryRows(
                          queryFn: (q) => q.eqOrNull(
                            'creator_id',
                            widget.creatorId,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Container(
                              width: double.infinity,
                              child: ListItemSkeletonLWidget(),
                            );
                          }
                          List<AppCreatorStoriesRow>
                              listViewAppCreatorStoriesRowList = snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewAppCreatorStoriesRowList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewAppCreatorStoriesRow =
                                  listViewAppCreatorStoriesRowList[
                                      listViewIndex];
                              return wrapWithModel(
                                model: _model.listItemModels.getModel(
                                  listViewAppCreatorStoriesRow.issueId!,
                                  listViewIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  key: Key(
                                    'Keyxzq_${listViewAppCreatorStoriesRow.issueId!}',
                                  ),
                                  issueId: listViewAppCreatorStoriesRow.issueId,
                                  showTitleInfo: true,
                                  issueNumber:
                                      listViewAppCreatorStoriesRow.issueNumber,
                                  issueName:
                                      listViewAppCreatorStoriesRow.issueName,
                                  issueSubtitle: listViewAppCreatorStoriesRow
                                      .issueSubtitle,
                                  titleName:
                                      listViewAppCreatorStoriesRow.titleName,
                                  titleSubtitle: listViewAppCreatorStoriesRow
                                      .titleSubtitle,
                                  publisherName: listViewAppCreatorStoriesRow
                                      .publisherName,
                                  licensors:
                                      listViewAppCreatorStoriesRow.licensors,
                                  entityType: 'issue',
                                  entityId:
                                      listViewAppCreatorStoriesRow.issueId,
                                  series: listViewAppCreatorStoriesRow.series,
                                  issueCount: 0,
                                  isSingleIssue: false,
                                  singleIssuePages:
                                      listViewAppCreatorStoriesRow.issuePages,
                                  indexPosition: null,
                                  thumb:
                                      'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listViewAppCreatorStoriesRow.thumbLocalPath}',
                                  issueDate:
                                      listViewAppCreatorStoriesRow.issueDate,
                                  thumb2: '',
                                  thumb3: '',
                                  showDivider: true,
                                  selectionEnabled: false,
                                  showStatus: true,
                                  isAdult: listViewAppCreatorStoriesRow.isAdult,
                                  canSeeAdult: functions.canSeeAdultContent(
                                      FFAppState().currentUserBirthDateString,
                                      FFAppState().adultContentEnabled),
                                  showIndex: false,
                                  onTap: () async {
                                    context.pushNamed(
                                      IssueDetailPageWidget.routeName,
                                      queryParameters: {
                                        'issueId': serializeParam(
                                          listViewAppCreatorStoriesRow.issueId,
                                          ParamType.String,
                                        ),
                                        'tittleId': serializeParam(
                                          listViewAppCreatorStoriesRow.titleId,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  onSaved: () async {
                                    FFAppState().needsLibraryRefresh = false;
                                    safeSetState(() {});
                                  },
                                ),
                              );
                            },
                          );
                        },
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
