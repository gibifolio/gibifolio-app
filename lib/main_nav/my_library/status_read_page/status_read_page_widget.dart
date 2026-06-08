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
import 'status_read_page_model.dart';
export 'status_read_page_model.dart';

class StatusReadPageWidget extends StatefulWidget {
  const StatusReadPageWidget({super.key});

  static String routeName = 'StatusReadPage';
  static String routePath = '/StatusReadPage';

  @override
  State<StatusReadPageWidget> createState() => _StatusReadPageWidgetState();
}

class _StatusReadPageWidgetState extends State<StatusReadPageWidget> {
  late StatusReadPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusReadPageModel());

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
        title: 'Lidos',
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
                          FFAppState().clearCacheStatusReadCache();
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
                      hintText: 'Buscar em \"lidos\"',
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
                                  FFAppState().clearCacheStatusReadCache();
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
                      FFAppState().clearCacheStatusReadCache();
                      _model.requestCompleted = false;
                    });
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FutureBuilder<List<AppLibraryReadRow>>(
                            future: FFAppState()
                                .cacheStatusRead(
                              overrideCache: FFAppState().needsLibraryRefresh,
                              requestFn: () => AppLibraryReadTable().queryRows(
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
                              List<AppLibraryReadRow>
                                  titlesListAppLibraryReadRowList =
                                  snapshot.data!;

                              if (titlesListAppLibraryReadRowList.isEmpty) {
                                return ListFeaturedEmptyBWidget(
                                  textMessage:
                                      'Itens marcados como \"lido\" aparecerão aqui.',
                                );
                              }

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    titlesListAppLibraryReadRowList.length,
                                itemBuilder: (context, titlesListIndex) {
                                  final titlesListAppLibraryReadRow =
                                      titlesListAppLibraryReadRowList[
                                          titlesListIndex];
                                  return wrapWithModel(
                                    model: _model.listItemModels.getModel(
                                      titlesListAppLibraryReadRow.titleId!,
                                      titlesListIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: ListItemWidget(
                                      key: Key(
                                        'Keyfqq_${titlesListAppLibraryReadRow.titleId!}',
                                      ),
                                      showTitleInfo: true,
                                      titleName:
                                          titlesListAppLibraryReadRow.titleName,
                                      titleSubtitle: titlesListAppLibraryReadRow
                                          .titleSubtitle,
                                      publisherName: titlesListAppLibraryReadRow
                                          .publisherName,
                                      licensors:
                                          titlesListAppLibraryReadRow.licensors,
                                      entityType: 'title',
                                      entityId:
                                          titlesListAppLibraryReadRow.titleId,
                                      series:
                                          titlesListAppLibraryReadRow.series,
                                      publicationStatus:
                                          titlesListAppLibraryReadRow
                                              .publicationStatus,
                                      issueCount:
                                          titlesListAppLibraryReadRow.readCount,
                                      isSingleIssue:
                                          (titlesListAppLibraryReadRow
                                                          .singleIssueId !=
                                                      null &&
                                                  titlesListAppLibraryReadRow
                                                          .singleIssueId !=
                                                      '') &&
                                              (titlesListAppLibraryReadRow
                                                      .issueCount ==
                                                  1),
                                      singleIssueId: titlesListAppLibraryReadRow
                                          .singleIssueId,
                                      singleIssuePages:
                                          titlesListAppLibraryReadRow
                                              .singleIssuePages,
                                      thumb: titlesListAppLibraryReadRow
                                                      .readT1 !=
                                                  null &&
                                              titlesListAppLibraryReadRow
                                                      .readT1 !=
                                                  ''
                                          ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${titlesListAppLibraryReadRow.readT1}'
                                          : null,
                                      thumb2: titlesListAppLibraryReadRow
                                                      .readT2 !=
                                                  null &&
                                              titlesListAppLibraryReadRow
                                                      .readT2 !=
                                                  ''
                                          ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${titlesListAppLibraryReadRow.readT2}'
                                          : null,
                                      thumb3: titlesListAppLibraryReadRow
                                                      .readT3 !=
                                                  null &&
                                              titlesListAppLibraryReadRow
                                                      .readT3 !=
                                                  ''
                                          ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${titlesListAppLibraryReadRow.readT3}'
                                          : null,
                                      showDivider: true,
                                      selectionEnabled: false,
                                      showStatus: true,
                                      isAdult:
                                          titlesListAppLibraryReadRow.isAdult,
                                      canSeeAdult: functions.canSeeAdultContent(
                                          FFAppState()
                                              .currentUserBirthDateString,
                                          FFAppState().adultContentEnabled),
                                      showIndex: false,
                                      onTap: () async {
                                        if ((titlesListAppLibraryReadRow
                                                        .singleIssueId !=
                                                    null &&
                                                titlesListAppLibraryReadRow
                                                        .singleIssueId !=
                                                    '') &&
                                            (titlesListAppLibraryReadRow
                                                    .readCount ==
                                                1)) {
                                          context.pushNamed(
                                            IssueDetailPageWidget.routeName,
                                            queryParameters: {
                                              'issueId': serializeParam(
                                                titlesListAppLibraryReadRow
                                                    .singleIssueId,
                                                ParamType.String,
                                              ),
                                              'tittleId': serializeParam(
                                                titlesListAppLibraryReadRow
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
                                          if ((titlesListAppLibraryReadRow
                                                          .firstStatusIssueId !=
                                                      null &&
                                                  titlesListAppLibraryReadRow
                                                          .firstStatusIssueId !=
                                                      '') &&
                                              (titlesListAppLibraryReadRow
                                                      .readCount ==
                                                  1)) {
                                            context.pushNamed(
                                              IssueDetailPageWidget.routeName,
                                              queryParameters: {
                                                'issueId': serializeParam(
                                                  titlesListAppLibraryReadRow
                                                      .firstStatusIssueId,
                                                  ParamType.String,
                                                ),
                                                'tittleId': serializeParam(
                                                  titlesListAppLibraryReadRow
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
                                                  titlesListAppLibraryReadRow
                                                      .titleId,
                                                  ParamType.String,
                                                ),
                                                'fromLibrary': serializeParam(
                                                  true,
                                                  ParamType.bool,
                                                ),
                                                'readingStatus': serializeParam(
                                                  'read',
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
                                              .clearCacheStatusReadCache();
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
