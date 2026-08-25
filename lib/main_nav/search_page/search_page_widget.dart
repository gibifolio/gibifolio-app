import '/components/status/issue_status_indicator/issue_status_indicator_widget.dart';
import '/components/status/title_status_indicator/title_status_indicator_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_page_model.dart';
export 'search_page_model.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({super.key});

  static String routeName = 'SearchPage';
  static String routePath = '/search';

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  late SearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageModel());

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
        title: 'Gibifolio - Busca',
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
                  FFAppState().autocompleteVisible = false;
                  safeSetState(() {});
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
                        if (_model.textController.text != '') {
                          unawaited(
                            () async {
                              await actions.fetchAutocomplete(
                                _model.textController.text,
                              );
                            }(),
                          );
                          FFAppState().autocompleteVisible = true;
                          safeSetState(() {});
                        } else {
                          FFAppState().autocompleteVisible = false;
                          safeSetState(() {});
                        }
                      },
                    ),
                    onFieldSubmitted: (_) async {
                      await actions.addToSearchHistory(
                        _model.textController.text,
                      );

                      context.pushNamed(
                        SearchResultsPageWidget.routeName,
                        queryParameters: {
                          'searchQuery': serializeParam(
                            _model.textController.text,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                    autofocus: true,
                    enabled: true,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.search,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: false,
                      hintText: 'Buscar HQs',
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
                      suffixIcon: _model.textController!.text.isNotEmpty
                          ? InkWell(
                              onTap: () async {
                                _model.textController?.clear();
                                if (_model.textController.text != '') {
                                  unawaited(
                                    () async {
                                      await actions.fetchAutocomplete(
                                        _model.textController.text,
                                      );
                                    }(),
                                  );
                                  FFAppState().autocompleteVisible = true;
                                  safeSetState(() {});
                                } else {
                                  FFAppState().autocompleteVisible = false;
                                  safeSetState(() {});
                                }

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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Expanded(
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
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (FFAppState().autocompleteVisible)
                                Builder(
                                  builder: (context) {
                                    final autoComplete = FFAppState()
                                        .autocompleteResults
                                        .take(8)
                                        .toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: autoComplete.length,
                                      itemBuilder:
                                          (context, autoCompleteIndex) {
                                        final autoCompleteItem =
                                            autoComplete[autoCompleteIndex];
                                        return Container(
                                          width: double.infinity,
                                          constraints: BoxConstraints(
                                            minHeight: 56.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().addToSearchHistory(
                                                  FFAppState()
                                                      .autocompleteResults
                                                      .elementAtOrNull(
                                                          autoCompleteIndex)!
                                                      .titleName);
                                              safeSetState(() {});
                                              if ((FFAppState()
                                                              .autocompleteResults
                                                              .elementAtOrNull(
                                                                  autoCompleteIndex)
                                                              ?.singleIssueId !=
                                                          null &&
                                                      FFAppState()
                                                              .autocompleteResults
                                                              .elementAtOrNull(
                                                                  autoCompleteIndex)
                                                              ?.singleIssueId !=
                                                          '') &&
                                                  (FFAppState()
                                                          .autocompleteResults
                                                          .elementAtOrNull(
                                                              autoCompleteIndex)
                                                          ?.issueCount ==
                                                      1)) {
                                                context.pushNamed(
                                                  IssueDetailPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'issueId': serializeParam(
                                                      FFAppState()
                                                          .autocompleteResults
                                                          .elementAtOrNull(
                                                              autoCompleteIndex)
                                                          ?.singleIssueId,
                                                      ParamType.String,
                                                    ),
                                                    'tittleId': serializeParam(
                                                      FFAppState()
                                                          .autocompleteResults
                                                          .elementAtOrNull(
                                                              autoCompleteIndex)
                                                          ?.titleId,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                context.pushNamed(
                                                  TitleDetailPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'titleId': serializeParam(
                                                      FFAppState()
                                                          .autocompleteResults
                                                          .elementAtOrNull(
                                                              autoCompleteIndex)
                                                          ?.titleId,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        key: ValueKey(
                                                            valueOrDefault<
                                                                String>(
                                                          FFAppState()
                                                              .autocompleteResults
                                                              .elementAtOrNull(
                                                                  autoCompleteIndex)
                                                              ?.titleId,
                                                          'Item sugerido',
                                                        )),
                                                        child: custom_widgets
                                                            .ComicCover(
                                                          width: 40.0,
                                                          height: 56.0,
                                                          imageUrl:
                                                              'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${FFAppState().autocompleteResults.elementAtOrNull(autoCompleteIndex)?.titleThumb}',
                                                          titleName:
                                                              valueOrDefault<
                                                                  String>(
                                                            FFAppState()
                                                                .autocompleteResults
                                                                .elementAtOrNull(
                                                                    autoCompleteIndex)
                                                                ?.titleName,
                                                            'Item sugerido',
                                                          ),
                                                          issueNumber: null,
                                                          titleId:
                                                              valueOrDefault<
                                                                  String>(
                                                            FFAppState()
                                                                .autocompleteResults
                                                                .elementAtOrNull(
                                                                    autoCompleteIndex)
                                                                ?.titleId,
                                                            'Item sugerido',
                                                          ),
                                                          spineHeight: 3.0,
                                                          cornersRight: 2.0,
                                                          cornersLeft: 0.0,
                                                          alignBottom: false,
                                                          enableLightbox: false,
                                                          isAdult: false,
                                                          canSeeAdult: false,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      FFAppState()
                                                                          .autocompleteResults
                                                                          .elementAtOrNull(
                                                                              autoCompleteIndex)
                                                                          ?.titleName,
                                                                      'Item sugerido',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if ((String
                                                                  value) {
                                                                return (value ??
                                                                        '')
                                                                    .isNotEmpty;
                                                              }(FFAppState()
                                                                  .autocompleteResults
                                                                  .elementAtOrNull(
                                                                      autoCompleteIndex)!
                                                                  .titleSubtitle))
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    FFAppState()
                                                                        .autocompleteResults
                                                                        .elementAtOrNull(
                                                                            autoCompleteIndex)
                                                                        ?.titleSubtitle,
                                                                    'Subtítulo',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              Expanded(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if ((String
                                                                        value) {
                                                                      return (value ??
                                                                              '')
                                                                          .isNotEmpty;
                                                                    }(FFAppState()
                                                                        .autocompleteResults
                                                                        .elementAtOrNull(
                                                                            autoCompleteIndex)!
                                                                        .publisherName))
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          FFAppState()
                                                                              .autocompleteResults
                                                                              .elementAtOrNull(autoCompleteIndex)
                                                                              ?.publisherName,
                                                                          'Editora',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                    if (((String
                                                                            value) {
                                                                          return (value ?? '')
                                                                              .isNotEmpty;
                                                                        }(FFAppState()
                                                                            .autocompleteResults
                                                                            .elementAtOrNull(
                                                                                autoCompleteIndex)!
                                                                            .publisherName)) &&
                                                                        ((String
                                                                            value) {
                                                                          return (value ?? '')
                                                                              .isNotEmpty;
                                                                        }(FFAppState()
                                                                            .autocompleteResults
                                                                            .elementAtOrNull(autoCompleteIndex)!
                                                                            .series)))
                                                                      Text(
                                                                        ' • ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                    if ((String
                                                                        value) {
                                                                      return (value ??
                                                                              '')
                                                                          .isNotEmpty;
                                                                    }(FFAppState()
                                                                        .autocompleteResults
                                                                        .elementAtOrNull(
                                                                            autoCompleteIndex)!
                                                                        .series))
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            FFAppState().autocompleteResults.elementAtOrNull(autoCompleteIndex)?.series,
                                                                            'Série',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                              if ((String
                                                                  value) {
                                                                return (int.tryParse(value ??
                                                                            '0') ??
                                                                        0) >
                                                                    1;
                                                              }(FFAppState()
                                                                  .autocompleteResults
                                                                  .elementAtOrNull(
                                                                      autoCompleteIndex)!
                                                                  .issueCount
                                                                  .toString()))
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              4.0,
                                                                              8.0,
                                                                              4.0),
                                                                          child:
                                                                              Text(
                                                                            '${valueOrDefault<String>(
                                                                              FFAppState().autocompleteResults.elementAtOrNull(autoCompleteIndex)?.issueCount.toString(),
                                                                              'Edições',
                                                                            )} edições',
                                                                            maxLines:
                                                                                1,
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                  ),
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                ),
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Container(
                                                          width: 80.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, -1.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              if (valueOrDefault<
                                                                          String>(
                                                                        FFAppState()
                                                                            .autocompleteResults
                                                                            .elementAtOrNull(autoCompleteIndex)
                                                                            ?.singleIssueId,
                                                                        'Item sugerido',
                                                                      ) !=
                                                                      '')
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          -1.0),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .issueStatusIndicatorModels
                                                                        .getModel(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        FFAppState()
                                                                            .autocompleteResults
                                                                            .elementAtOrNull(autoCompleteIndex)
                                                                            ?.singleIssueId,
                                                                        'Item sugerido',
                                                                      ),
                                                                      autoCompleteIndex,
                                                                    ),
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        IssueStatusIndicatorWidget(
                                                                      key: Key(
                                                                        'Keyjnp_${valueOrDefault<String>(
                                                                          FFAppState()
                                                                              .autocompleteResults
                                                                              .elementAtOrNull(autoCompleteIndex)
                                                                              ?.singleIssueId,
                                                                          'Item sugerido',
                                                                        )}',
                                                                      ),
                                                                      issueId:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        FFAppState()
                                                                            .autocompleteResults
                                                                            .elementAtOrNull(autoCompleteIndex)
                                                                            ?.singleIssueId,
                                                                        'Item sugerido',
                                                                      ),
                                                                      isLarge:
                                                                          false,
                                                                      titleId:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        FFAppState()
                                                                            .autocompleteResults
                                                                            .elementAtOrNull(autoCompleteIndex)
                                                                            ?.titleId,
                                                                        'Item sugerido',
                                                                      ),
                                                                      entityType: valueOrDefault<String>(
                                                                                    FFAppState().autocompleteResults.elementAtOrNull(autoCompleteIndex)?.singleIssueId,
                                                                                    'Item sugerido',
                                                                                  ) !=
                                                                                  ''
                                                                          ? 'issue'
                                                                          : 'title',
                                                                      onSaved:
                                                                          () async {
                                                                        FFAppState().needsLibraryRefresh =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              if ((valueOrDefault<
                                                                          String>(
                                                                        FFAppState()
                                                                            .autocompleteResults
                                                                            .elementAtOrNull(autoCompleteIndex)
                                                                            ?.issueCount
                                                                            .toString(),
                                                                        'Item sugerido',
                                                                      ) !=
                                                                      '1') &&
                                                                  (valueOrDefault<
                                                                              String>(
                                                                            FFAppState().autocompleteResults.elementAtOrNull(autoCompleteIndex)?.singleIssueId,
                                                                            'Item sugerido',
                                                                          ) ==
                                                                          ''))
                                                                wrapWithModel(
                                                                  model: _model
                                                                      .titleStatusIndicatorModels
                                                                      .getModel(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      FFAppState()
                                                                          .autocompleteResults
                                                                          .elementAtOrNull(
                                                                              autoCompleteIndex)
                                                                          ?.titleId,
                                                                      'Item sugerido',
                                                                    ),
                                                                    autoCompleteIndex,
                                                                  ),
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      TitleStatusIndicatorWidget(
                                                                    key: Key(
                                                                      'Keyqyv_${valueOrDefault<String>(
                                                                        FFAppState()
                                                                            .autocompleteResults
                                                                            .elementAtOrNull(autoCompleteIndex)
                                                                            ?.titleId,
                                                                        'Item sugerido',
                                                                      )}',
                                                                    ),
                                                                    isLarge:
                                                                        false,
                                                                    titleId:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      FFAppState()
                                                                          .autocompleteResults
                                                                          .elementAtOrNull(
                                                                              autoCompleteIndex)
                                                                          ?.titleId,
                                                                      'Item sugerido',
                                                                    ),
                                                                    entityType: valueOrDefault<String>(
                                                                                  FFAppState().autocompleteResults.elementAtOrNull(autoCompleteIndex)?.singleIssueId,
                                                                                  'Item sugerido',
                                                                                ) !=
                                                                                ''
                                                                        ? 'issue'
                                                                        : 'title',
                                                                    onSaved:
                                                                        () async {
                                                                      FFAppState()
                                                                              .needsLibraryRefresh =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 12.0)),
                                                  ),
                                                ),
                                                Divider(
                                                  height: 1.0,
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              if (!FFAppState().autocompleteVisible)
                                Builder(
                                  builder: (context) {
                                    final searchHistory = FFAppState()
                                        .searchHistory
                                        .take(8)
                                        .toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: searchHistory.length,
                                      itemBuilder:
                                          (context, searchHistoryIndex) {
                                        final searchHistoryItem =
                                            searchHistory[searchHistoryIndex];
                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                SearchResultsPageWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'searchQuery': serializeParam(
                                                    valueOrDefault<String>(
                                                      FFAppState()
                                                          .searchHistory
                                                          .elementAtOrNull(
                                                              searchHistoryIndex),
                                                      'Palestina',
                                                    ),
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 8.0, 16.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            FFAppState()
                                                                .searchHistory
                                                                .elementAtOrNull(
                                                                    searchHistoryIndex),
                                                            'Termo buscado',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderRadius: 8.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons
                                                              .remove_circle_outline,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          FFAppState()
                                                              .removeAtIndexFromSearchHistory(
                                                                  searchHistoryIndex);
                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  height: 1.0,
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ],
                                            ),
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
                ],
              ),
            ),
          ),
        ));
  }
}
