import '/backend/supabase/supabase.dart';
import '/components/items_and_thumbs/list_item/list_item_widget.dart';
import '/components/skeletons/list_featured_empty_b/list_featured_empty_b_widget.dart';
import '/components/skeletons/list_item_skeleton_l/list_item_skeleton_l_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'status_wanted_page_model.dart';
export 'status_wanted_page_model.dart';

class StatusWantedPageWidget extends StatefulWidget {
  const StatusWantedPageWidget({super.key});

  static String routeName = 'StatusWantedPage';
  static String routePath = '/StatusWantedPage';

  @override
  State<StatusWantedPageWidget> createState() => _StatusWantedPageWidgetState();
}

class _StatusWantedPageWidgetState extends State<StatusWantedPageWidget> {
  late StatusWantedPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusWantedPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().needsLibraryRefresh) {
        FFAppState().needsLibraryRefresh = false;
        FFAppState().update(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        title: 'Quero',
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
                  _model.searchQuery = '%';
                  context.safePop();
                },
              ),
              title: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(),
                ),
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      Duration(milliseconds: 300),
                      () async {
                        _model.searchQuery = _model.textController.text;
                        safeSetState(() {
                          FFAppState().clearCacheWantedReadCache();
                          _model.requestCompleted = false;
                        });
                        await _model.waitForRequestCompleted();
                      },
                    ),
                    autofocus: false,
                    enabled: true,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.search,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: false,
                      hintText: 'Buscar em \"quero\"',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelLarge.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .fontStyle,
                              ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                      hoverColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      prefixIcon: Icon(
                        FFIcons.ksearch,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      suffixIcon: _model.textController!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.textController?.clear();
                                _model.searchQuery = _model.textController.text;
                                safeSetState(() {
                                  FFAppState().clearCacheWantedReadCache();
                                  _model.requestCompleted = false;
                                });
                                await _model.waitForRequestCompleted();
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            )
                          : null,
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                    textAlign: TextAlign.start,
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    enableInteractiveSelection: true,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                    inputFormatters: [
                      if (!isAndroid && !isiOS)
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          return TextEditingValue(
                            selection: newValue.selection,
                            text: newValue.text
                                .toCapitalization(TextCapitalization.sentences),
                          );
                        }),
                    ],
                  ),
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
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(),
                child: RefreshIndicator(
                  color: FlutterFlowTheme.of(context).primary,
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  onRefresh: () async {
                    safeSetState(() {
                      FFAppState().clearCacheWantedReadCache();
                      _model.requestCompleted = false;
                    });
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FutureBuilder<List<AppLibraryWantedRow>>(
                            future: FFAppState()
                                .cacheWantedRead(
                              overrideCache: FFAppState().needsLibraryRefresh,
                              requestFn: () =>
                                  AppLibraryWantedTable().queryRows(
                                queryFn: (q) => q
                                    .like(
                                      'search_combined',
                                      '%${_model.searchQuery}%',
                                    )
                                    .order('canonical_key', ascending: true)
                                    .order('publisher_name', ascending: true)
                                    .order('series', ascending: true),
                              ),
                            )
                                .then((result) {
                              _model.requestCompleted = true;
                              return result;
                            }),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return ListItemSkeletonLWidget();
                              }
                              List<AppLibraryWantedRow>
                                  titlesListAppLibraryWantedRowList =
                                  snapshot.data!;

                              if (titlesListAppLibraryWantedRowList.isEmpty) {
                                return ListFeaturedEmptyBWidget(
                                  textMessage:
                                      'Itens marcados como \"quero\" aparecerão aqui.',
                                );
                              }

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    titlesListAppLibraryWantedRowList.length,
                                itemBuilder: (context, titlesListIndex) {
                                  final titlesListAppLibraryWantedRow =
                                      titlesListAppLibraryWantedRowList[
                                          titlesListIndex];
                                  return wrapWithModel(
                                    model: _model.listItemModels.getModel(
                                      titlesListAppLibraryWantedRow.titleId!,
                                      titlesListIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: ListItemWidget(
                                      key: Key(
                                        'Keyzlg_${titlesListAppLibraryWantedRow.titleId!}',
                                      ),
                                      showTitleInfo: true,
                                      titleName: titlesListAppLibraryWantedRow
                                          .titleName,
                                      titleSubtitle:
                                          titlesListAppLibraryWantedRow
                                              .titleSubtitle,
                                      publisherName:
                                          titlesListAppLibraryWantedRow
                                              .publisherName,
                                      licensors: titlesListAppLibraryWantedRow
                                          .licensors,
                                      entityType: 'title',
                                      entityId:
                                          titlesListAppLibraryWantedRow.titleId,
                                      series:
                                          titlesListAppLibraryWantedRow.series,
                                      publicationStatus:
                                          titlesListAppLibraryWantedRow
                                              .publicationStatus,
                                      issueCount: titlesListAppLibraryWantedRow
                                          .wantedCount,
                                      isSingleIssue:
                                          (titlesListAppLibraryWantedRow
                                                          .singleIssueId !=
                                                      null &&
                                                  titlesListAppLibraryWantedRow
                                                          .singleIssueId !=
                                                      '') &&
                                              (titlesListAppLibraryWantedRow
                                                      .issueCount !=
                                                  null),
                                      singleIssueId:
                                          titlesListAppLibraryWantedRow
                                              .singleIssueId,
                                      singleIssuePages:
                                          titlesListAppLibraryWantedRow
                                              .singleIssuePages,
                                      thumb: titlesListAppLibraryWantedRow
                                                      .wantedT1 !=
                                                  null &&
                                              titlesListAppLibraryWantedRow
                                                      .wantedT1 !=
                                                  ''
                                          ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${titlesListAppLibraryWantedRow.wantedT1}'
                                          : null,
                                      thumb2: titlesListAppLibraryWantedRow
                                                      .wantedT2 !=
                                                  null &&
                                              titlesListAppLibraryWantedRow
                                                      .wantedT2 !=
                                                  ''
                                          ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${titlesListAppLibraryWantedRow.wantedT2}'
                                          : null,
                                      thumb3: titlesListAppLibraryWantedRow
                                                      .wantedT3 !=
                                                  null &&
                                              titlesListAppLibraryWantedRow
                                                      .wantedT3 !=
                                                  ''
                                          ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${titlesListAppLibraryWantedRow.wantedT3}'
                                          : null,
                                      showDivider: true,
                                      selectionEnabled: false,
                                      showStatus: true,
                                      isAdult:
                                          titlesListAppLibraryWantedRow.isAdult,
                                      canSeeAdult: functions.canSeeAdultContent(
                                          FFAppState()
                                              .currentUserBirthDateString,
                                          FFAppState().adultContentEnabled),
                                      showIndex: false,
                                      onTap: () async {
                                        if ((titlesListAppLibraryWantedRow
                                                        .singleIssueId !=
                                                    null &&
                                                titlesListAppLibraryWantedRow
                                                        .singleIssueId !=
                                                    '') &&
                                            (titlesListAppLibraryWantedRow
                                                    .issueCount ==
                                                1)) {
                                          context.pushNamed(
                                            IssueDetailPageWidget.routeName,
                                            queryParameters: {
                                              'issueId': serializeParam(
                                                titlesListAppLibraryWantedRow
                                                    .singleIssueId,
                                                ParamType.String,
                                              ),
                                              'tittleId': serializeParam(
                                                titlesListAppLibraryWantedRow
                                                    .titleId,
                                                ParamType.String,
                                              ),
                                              'navOriginTitle': serializeParam(
                                                false,
                                                ParamType.bool,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          if ((titlesListAppLibraryWantedRow
                                                          .firstStatusIssueId !=
                                                      null &&
                                                  titlesListAppLibraryWantedRow
                                                          .firstStatusIssueId !=
                                                      '') &&
                                              (titlesListAppLibraryWantedRow
                                                      .wantedCount ==
                                                  1)) {
                                            context.pushNamed(
                                              IssueDetailPageWidget.routeName,
                                              queryParameters: {
                                                'issueId': serializeParam(
                                                  titlesListAppLibraryWantedRow
                                                      .firstStatusIssueId,
                                                  ParamType.String,
                                                ),
                                                'tittleId': serializeParam(
                                                  titlesListAppLibraryWantedRow
                                                      .titleId,
                                                  ParamType.String,
                                                ),
                                                'navOriginTitle':
                                                    serializeParam(
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
                                                  titlesListAppLibraryWantedRow
                                                      .titleId,
                                                  ParamType.String,
                                                ),
                                                'fromLibrary': serializeParam(
                                                  true,
                                                  ParamType.bool,
                                                ),
                                                'ownershipStatus':
                                                    serializeParam(
                                                  'wanted',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        }
                                      },
                                      onSaved: () async {
                                        safeSetState(() {
                                          FFAppState()
                                              .clearCacheWantedReadCache();
                                          _model.requestCompleted = false;
                                        });
                                        FFAppState().needsLibraryRefresh =
                                            false;
                                        FFAppState().update(() {});
                                      },
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
            ),
          ),
        ));
  }
}
