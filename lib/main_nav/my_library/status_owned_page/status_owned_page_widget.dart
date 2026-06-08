import '/backend/supabase/supabase.dart';
import '/components/items_and_thumbs/list_item/list_item_widget.dart';
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
import 'status_owned_page_model.dart';
export 'status_owned_page_model.dart';

class StatusOwnedPageWidget extends StatefulWidget {
  const StatusOwnedPageWidget({super.key});

  static String routeName = 'StatusOwnedPage';
  static String routePath = '/StatusOwnedPage';

  @override
  State<StatusOwnedPageWidget> createState() => _StatusOwnedPageWidgetState();
}

class _StatusOwnedPageWidgetState extends State<StatusOwnedPageWidget> {
  late StatusOwnedPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusOwnedPageModel());

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
        title: 'Tenho',
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
                          FFAppState().clearCacheStatusOwnedCache();
                          _model.requestCompleted = false;
                        });
                        await _model.waitForRequestCompleted();
                      },
                    ),
                    autofocus: true,
                    enabled: true,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.search,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: false,
                      hintText: 'Buscar em \"tenho\"',
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
                                  FFAppState().clearCacheStatusOwnedCache();
                                  _model.requestCompleted = false;
                                });
                                await _model.waitForRequestCompleted();
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 22,
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
                      FFAppState().clearCacheStatusOwnedCache();
                      _model.requestCompleted = false;
                    });
                    await _model.waitForRequestCompleted();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder<List<AppLibraryOwnedRow>>(
                          future: FFAppState()
                              .cacheStatusOwned(
                            overrideCache: FFAppState().needsLibraryRefresh,
                            requestFn: () => AppLibraryOwnedTable().queryRows(
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
                            List<AppLibraryOwnedRow>
                                titlesListAppLibraryOwnedRowList =
                                snapshot.data!;

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  titlesListAppLibraryOwnedRowList.length,
                              itemBuilder: (context, titlesListIndex) {
                                final titlesListAppLibraryOwnedRow =
                                    titlesListAppLibraryOwnedRowList[
                                        titlesListIndex];
                                return wrapWithModel(
                                  model: _model.listItemModels.getModel(
                                    titlesListAppLibraryOwnedRow.titleId!,
                                    titlesListIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: ListItemWidget(
                                    key: Key(
                                      'Key8l0_${titlesListAppLibraryOwnedRow.titleId!}',
                                    ),
                                    showTitleInfo: true,
                                    titleName:
                                        titlesListAppLibraryOwnedRow.titleName,
                                    titleSubtitle: titlesListAppLibraryOwnedRow
                                        .titleSubtitle,
                                    publisherName: titlesListAppLibraryOwnedRow
                                        .publisherName,
                                    licensors:
                                        titlesListAppLibraryOwnedRow.licensors,
                                    entityType: 'title',
                                    entityId:
                                        titlesListAppLibraryOwnedRow.titleId,
                                    series: titlesListAppLibraryOwnedRow.series,
                                    publicationStatus:
                                        titlesListAppLibraryOwnedRow
                                            .publicationStatus,
                                    issueCount:
                                        titlesListAppLibraryOwnedRow.ownedCount,
                                    isSingleIssue: (titlesListAppLibraryOwnedRow
                                                    .singleIssueId !=
                                                null &&
                                            titlesListAppLibraryOwnedRow
                                                    .singleIssueId !=
                                                '') &&
                                        (titlesListAppLibraryOwnedRow
                                                .issueCount ==
                                            1),
                                    singleIssueId: titlesListAppLibraryOwnedRow
                                        .singleIssueId,
                                    singleIssuePages:
                                        titlesListAppLibraryOwnedRow
                                            .singleIssuePages,
                                    thumb: titlesListAppLibraryOwnedRow
                                                    .ownedT1 !=
                                                null &&
                                            titlesListAppLibraryOwnedRow
                                                    .ownedT1 !=
                                                ''
                                        ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${titlesListAppLibraryOwnedRow.ownedT1}'
                                        : null,
                                    thumb2: titlesListAppLibraryOwnedRow
                                                    .ownedT2 !=
                                                null &&
                                            titlesListAppLibraryOwnedRow
                                                    .ownedT2 !=
                                                ''
                                        ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${titlesListAppLibraryOwnedRow.ownedT2}'
                                        : null,
                                    thumb3: titlesListAppLibraryOwnedRow
                                                    .ownedT3 !=
                                                null &&
                                            titlesListAppLibraryOwnedRow
                                                    .ownedT3 !=
                                                ''
                                        ? 'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${titlesListAppLibraryOwnedRow.ownedT3}'
                                        : null,
                                    showDivider: true,
                                    selectionEnabled: false,
                                    showStatus: true,
                                    isAdult:
                                        titlesListAppLibraryOwnedRow.isAdult,
                                    canSeeAdult: functions.canSeeAdultContent(
                                        FFAppState().currentUserBirthDateString,
                                        FFAppState().adultContentEnabled),
                                    showIndex: false,
                                    onTap: () async {
                                      if ((titlesListAppLibraryOwnedRow
                                                      .singleIssueId !=
                                                  null &&
                                              titlesListAppLibraryOwnedRow
                                                      .singleIssueId !=
                                                  '') &&
                                          (titlesListAppLibraryOwnedRow
                                                  .issueCount ==
                                              1)) {
                                        context.pushNamed(
                                          IssueDetailPageWidget.routeName,
                                          queryParameters: {
                                            'issueId': serializeParam(
                                              titlesListAppLibraryOwnedRow
                                                  .singleIssueId,
                                              ParamType.String,
                                            ),
                                            'tittleId': serializeParam(
                                              titlesListAppLibraryOwnedRow
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
                                        if ((titlesListAppLibraryOwnedRow
                                                        .firstStatusIssueId !=
                                                    null &&
                                                titlesListAppLibraryOwnedRow
                                                        .firstStatusIssueId !=
                                                    '') &&
                                            (titlesListAppLibraryOwnedRow
                                                    .issueCount ==
                                                1)) {
                                          context.pushNamed(
                                            IssueDetailPageWidget.routeName,
                                            queryParameters: {
                                              'issueId': serializeParam(
                                                titlesListAppLibraryOwnedRow
                                                    .firstStatusIssueId,
                                                ParamType.String,
                                              ),
                                              'tittleId': serializeParam(
                                                titlesListAppLibraryOwnedRow
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
                                          context.pushNamed(
                                            TitleDetailPageWidget.routeName,
                                            queryParameters: {
                                              'titleId': serializeParam(
                                                titlesListAppLibraryOwnedRow
                                                    .titleId,
                                                ParamType.String,
                                              ),
                                              'fromLibrary': serializeParam(
                                                true,
                                                ParamType.bool,
                                              ),
                                              'ownershipStatus': serializeParam(
                                                'owned',
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      }
                                    },
                                    onSaved: () async {
                                      FFAppState().needsLibraryRefresh = false;
                                      FFAppState().update(() {});
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
          ),
        ));
  }
}
