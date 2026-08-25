import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_brands_page_model.dart';
export 'all_brands_page_model.dart';

class AllBrandsPageWidget extends StatefulWidget {
  const AllBrandsPageWidget({super.key});

  static String routeName = 'AllBrandsPage';
  static String routePath = '/AllBrandsPage';

  @override
  State<AllBrandsPageWidget> createState() => _AllBrandsPageWidgetState();
}

class _AllBrandsPageWidgetState extends State<AllBrandsPageWidget> {
  late AllBrandsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllBrandsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.fetchAllBrands(
        null,
        0,
      );

      safeSetState(() {});
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
        title: 'Gibifolio - Editoras',
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
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 300),
                          () async {
                            unawaited(
                              () async {
                                await actions.fetchAllBrands(
                                  _model.textController.text,
                                  0,
                                );
                              }(),
                            );
                          },
                        ),
                        autofocus: false,
                        enabled: true,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.search,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: false,
                          hintText: 'Buscar editoras',
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
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          hoverColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          prefixIcon: Icon(
                            FFIcons.ksearch,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          suffixIcon: _model.textController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.textController?.clear();
                                    unawaited(
                                      () async {
                                        await actions.fetchAllBrands(
                                          _model.textController.text,
                                          0,
                                        );
                                      }(),
                                    );
                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
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
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                        textAlign: TextAlign.start,
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        enableInteractiveSelection: true,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                        inputFormatters: [
                          if (!isAndroid && !isiOS)
                            TextInputFormatter.withFunction(
                                (oldValue, newValue) {
                              return TextEditingValue(
                                selection: newValue.selection,
                                text: newValue.text.toCapitalization(
                                    TextCapitalization.sentences),
                              );
                            }),
                        ],
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
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            final allBrands = FFAppState().allBrands.toList();

                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(allBrands.length,
                                  (allBrandsIndex) {
                                final allBrandsItem = allBrands[allBrandsIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (functions.getBrandType(getJsonField(
                                          allBrandsItem,
                                          r'''$''',
                                        )) ==
                                        'publisher') {
                                      context.pushNamed(
                                        PublisherTitlesPageWidget.routeName,
                                        queryParameters: {
                                          'publisherId': serializeParam(
                                            getJsonField(
                                              allBrandsItem,
                                              r'''$.id''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'publisherName': serializeParam(
                                            getJsonField(
                                              allBrandsItem,
                                              r'''$.name''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      context.pushNamed(
                                        LicensorTitlesPageWidget.routeName,
                                        queryParameters: {
                                          'licensorId': serializeParam(
                                            getJsonField(
                                              allBrandsItem,
                                              r'''$.id''',
                                            ),
                                            ParamType.int,
                                          ),
                                          'licensorName': serializeParam(
                                            getJsonField(
                                              allBrandsItem,
                                              r'''$.name''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipOval(
                                                child: Container(
                                                  width: 56.0,
                                                  height: 56.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Visibility(
                                                    visible: getJsonField(
                                                          allBrandsItem,
                                                          r'''$.logo_path''',
                                                        ) !=
                                                        null,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                      child: Image.network(
                                                        'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/logos/${getJsonField(
                                                          allBrandsItem,
                                                          r'''$.logo_path''',
                                                        ).toString()}',
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  getJsonField(
                                                    allBrandsItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  allBrandsItem,
                                                  r'''$.title_count''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyLarge
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ].divide(SizedBox(width: 18.0)),
                                          ),
                                        ),
                                        Divider(
                                          height: 1.0,
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                        if (FFAppState().allBrandsHasMore)
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await actions.fetchAllBrands(
                                    _model.searchQuery,
                                    FFAppState().allBrandsOffset,
                                  );

                                  safeSetState(() {});
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
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
        ));
  }
}
