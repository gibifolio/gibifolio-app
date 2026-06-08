import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/items_and_thumbs/list_item/list_item_widget.dart';
import '/components/skeletons/issue_skeleton/issue_skeleton_widget.dart';
import '/components/skeletons/list_item_skeleton_s/list_item_skeleton_s_widget.dart';
import '/components/status/issue_status_indicator/issue_status_indicator_widget.dart';
import '/components/story_card/story_card_widget.dart';
import '/components/story_card_skeleton/story_card_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'issue_detail_page_model.dart';
export 'issue_detail_page_model.dart';

class IssueDetailPageWidget extends StatefulWidget {
  const IssueDetailPageWidget({
    super.key,
    required this.issueId,
    required this.tittleId,
    bool? navOriginTitle,
  }) : this.navOriginTitle = navOriginTitle ?? false;

  final String? issueId;
  final String? tittleId;
  final bool navOriginTitle;

  static String routeName = 'IssueDetailPage';
  static String routePath = '/issueDetailPage';

  @override
  State<IssueDetailPageWidget> createState() => _IssueDetailPageWidgetState();
}

class _IssueDetailPageWidgetState extends State<IssueDetailPageWidget> {
  late IssueDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IssueDetailPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.titleLicensorsList = await actions.fetchTitleLicensors(
        widget.tittleId!,
      );
      _model.titleLicensors =
          _model.titleLicensorsList!.toList().cast<LicensorItemStruct>();
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

    return FutureBuilder<List<AppIssueDetailRow>>(
      future: AppIssueDetailTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'issue_id',
          widget.issueId,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: IssueSkeletonWidget(),
          );
        }
        List<AppIssueDetailRow> issueDetailPageAppIssueDetailRowList =
            snapshot.data!;

        final issueDetailPageAppIssueDetailRow =
            issueDetailPageAppIssueDetailRowList.isNotEmpty
                ? issueDetailPageAppIssueDetailRowList.first
                : null;

        return Title(
            title: 'Gibifolio - Edição',
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
                body: NestedScrollView(
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (context, _) => [
                    SliverAppBar(
                      pinned: false,
                      floating: true,
                      snap: false,
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
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
                      actions: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                Icons.share,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await actions.shareContent(
                                  'https://app.gibifolio.com.br/issueDetailPage?issueId=${widget.issueId}&tittleId=${widget.tittleId}',
                                  issueDetailPageAppIssueDetailRow!.issueName!,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                      centerTitle: false,
                      elevation: 0.0,
                    )
                  ],
                  body: Builder(
                    builder: (context) {
                      return SafeArea(
                        top: false,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 56.0, 24.0, 32.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.25,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (false)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: custom_widgets.ComicCover(
                                          width: 200.0,
                                          height: 280.0,
                                          imageUrl:
                                              'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${issueDetailPageAppIssueDetailRow?.coverLocalPath}',
                                          titleName:
                                              issueDetailPageAppIssueDetailRow
                                                  ?.titleName,
                                          issueNumber:
                                              issueDetailPageAppIssueDetailRow
                                                  ?.issueNumber,
                                          titleId: widget.tittleId,
                                          spineHeight: 5.0,
                                          alignBottom: false,
                                          enableLightbox: true,
                                          isAdult:
                                              issueDetailPageAppIssueDetailRow
                                                  ?.isAdult,
                                          canSeeAdult:
                                              functions.canSeeAdultContent(
                                                  FFAppState()
                                                      .currentUserBirthDateString,
                                                  FFAppState()
                                                      .adultContentEnabled),
                                        ),
                                      ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child:
                                          FutureBuilder<List<IssueVariantsRow>>(
                                        future: IssueVariantsTable().queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'issue_id',
                                                widget.issueId,
                                              )
                                              .order('edition',
                                                  ascending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(160.0),
                                                child: SizedBox(
                                                  width: 12.0,
                                                  height: 12.0,
                                                  child: SpinKitThreeBounce(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 12.0,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<IssueVariantsRow>
                                              variantsIssueVariantsRowList =
                                              snapshot.data!;

                                          return Container(
                                            decoration: BoxDecoration(),
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final variantsVar =
                                                        variantsIssueVariantsRowList
                                                            .toList();

                                                    return SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: List.generate(
                                                                variantsVar
                                                                    .length,
                                                                (variantsVarIndex) {
                                                          final variantsVarItem =
                                                              variantsVar[
                                                                  variantsVarIndex];
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          24.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child: custom_widgets
                                                                          .ComicCover(
                                                                        width:
                                                                            180.0,
                                                                        height:
                                                                            260.0,
                                                                        imageUrl:
                                                                            'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${variantsVarItem.coverLocalPath}',
                                                                        spineHeight:
                                                                            5.0,
                                                                        alignBottom:
                                                                            true,
                                                                        enableLightbox:
                                                                            true,
                                                                        isAdult:
                                                                            issueDetailPageAppIssueDetailRow?.isAdult,
                                                                        canSeeAdult: functions.canSeeAdultContent(
                                                                            FFAppState().currentUserBirthDateString,
                                                                            FFAppState().adultContentEnabled),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if ((valueOrDefault<
                                                                                  String>(
                                                                                variantsVarItem.variantLabel,
                                                                                'Variante',
                                                                              ) !=
                                                                              '') ||
                                                                      (valueOrDefault<
                                                                                  String>(
                                                                                variantsVarItem.edition,
                                                                                'Edição',
                                                                              ) !=
                                                                              '') ||
                                                                      (variantsVarItem.format ==
                                                                              null ||
                                                                          variantsVarItem.format ==
                                                                              '') ||
                                                                      (variantsVarItem
                                                                              .releaseDate ==
                                                                          null))
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            32.0,
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              200.0,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Wrap(
                                                                            spacing:
                                                                                4.0,
                                                                            runSpacing:
                                                                                0.0,
                                                                            alignment:
                                                                                WrapAlignment.center,
                                                                            crossAxisAlignment:
                                                                                WrapCrossAlignment.start,
                                                                            direction:
                                                                                Axis.horizontal,
                                                                            runAlignment:
                                                                                WrapAlignment.start,
                                                                            verticalDirection:
                                                                                VerticalDirection.down,
                                                                            clipBehavior:
                                                                                Clip.none,
                                                                            children: [
                                                                              if (variantsVarItem.variantLabel != null && variantsVarItem.variantLabel != '')
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                            variantsVarItem.variantLabel,
                                                                                            'Variante',
                                                                                          ) ==
                                                                                          'STD'
                                                                                      ? ''
                                                                                      : valueOrDefault<String>(
                                                                                          variantsVarItem.variantLabel,
                                                                                          'Variante',
                                                                                        ),
                                                                                  textAlign: TextAlign.center,
                                                                                  maxLines: 4,
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        font: GoogleFonts.fraunces(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 11.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        lineHeight: 1.2,
                                                                                      ),
                                                                                ),
                                                                              if (variantsVarItem.edition != null && variantsVarItem.edition != '')
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    variantsVarItem.edition,
                                                                                    'Edição',
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  maxLines: 4,
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        font: GoogleFonts.fraunces(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 11.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        lineHeight: 1.2,
                                                                                      ),
                                                                                ),
                                                                              if (variantsVarItem.releaseDate != null)
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    dateTimeFormat(
                                                                                      "yMMM",
                                                                                      variantsVarItem.releaseDate,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    'Data',
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  maxLines: 4,
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        font: GoogleFonts.fraunces(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 11.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        lineHeight: 1.2,
                                                                                      ),
                                                                                ),
                                                                              if (variantsVarItem.format != null && variantsVarItem.format != '')
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    variantsVarItem.format,
                                                                                    'Formato',
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  maxLines: 4,
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        font: GoogleFonts.fraunces(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 11.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        lineHeight: 1.2,
                                                                                      ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          );
                                                        })
                                                            .divide(SizedBox(
                                                                width: 24.0))
                                                            .addToStart(
                                                                SizedBox(
                                                                    width:
                                                                        80.0))
                                                            .addToEnd(SizedBox(
                                                                width: 80.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                if (false)
                                  FutureBuilder<List<IssueVariantsRow>>(
                                    future: IssueVariantsTable().queryRows(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'issue_id',
                                            widget.issueId,
                                          )
                                          .order('edition', ascending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 12.0,
                                            height: 12.0,
                                            child: SpinKitThreeBounce(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 12.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<IssueVariantsRow>
                                          variantsIssueVariantsRowList =
                                          snapshot.data!;

                                      return Container(
                                        decoration: BoxDecoration(),
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 32.0, 0.0, 24.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final variantsVar =
                                                          variantsIssueVariantsRowList
                                                              .toList();

                                                      return SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: List.generate(
                                                                  variantsVar
                                                                      .length,
                                                                  (variantsVarIndex) {
                                                            final variantsVarItem =
                                                                variantsVar[
                                                                    variantsVarIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Container(
                                                                height: 92.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        -1.0),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child: custom_widgets
                                                                            .ComicCover(
                                                                          width:
                                                                              56.0,
                                                                          height:
                                                                              72.0,
                                                                          imageUrl:
                                                                              'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${variantsVarItem.coverLocalPath}',
                                                                          spineHeight:
                                                                              3.0,
                                                                          cornersRight:
                                                                              2.0,
                                                                          cornersLeft:
                                                                              0.0,
                                                                          alignBottom:
                                                                              false,
                                                                          enableLightbox:
                                                                              true,
                                                                          isAdult:
                                                                              false,
                                                                          canSeeAdult:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                100.0,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Wrap(
                                                                            spacing:
                                                                                4.0,
                                                                            runSpacing:
                                                                                0.0,
                                                                            alignment:
                                                                                WrapAlignment.start,
                                                                            crossAxisAlignment:
                                                                                WrapCrossAlignment.start,
                                                                            direction:
                                                                                Axis.horizontal,
                                                                            runAlignment:
                                                                                WrapAlignment.start,
                                                                            verticalDirection:
                                                                                VerticalDirection.down,
                                                                            clipBehavior:
                                                                                Clip.none,
                                                                            children: [
                                                                              if (variantsVarItem.variantLabel != null && variantsVarItem.variantLabel != '')
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                            variantsVarItem.variantLabel,
                                                                                            'Variante',
                                                                                          ) ==
                                                                                          'STD'
                                                                                      ? ''
                                                                                      : valueOrDefault<String>(
                                                                                          variantsVarItem.variantLabel,
                                                                                          'Variante',
                                                                                        ),
                                                                                  textAlign: TextAlign.start,
                                                                                  maxLines: 4,
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        ),
                                                                                        fontSize: 11.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        lineHeight: 1.2,
                                                                                      ),
                                                                                ),
                                                                              if (variantsVarItem.edition != null && variantsVarItem.edition != '')
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    variantsVarItem.edition,
                                                                                    'Edição',
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  maxLines: 4,
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        ),
                                                                                        fontSize: 11.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        lineHeight: 1.2,
                                                                                      ),
                                                                                ),
                                                                              if (variantsVarItem.format != null && variantsVarItem.format != '')
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    variantsVarItem.format,
                                                                                    'Formato',
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  maxLines: 4,
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        ),
                                                                                        fontSize: 11.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                        lineHeight: 1.2,
                                                                                      ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          })
                                                              .divide(SizedBox(
                                                                  width: 16.0))
                                                              .addToStart(
                                                                  SizedBox(
                                                                      width:
                                                                          24.0))
                                                              .addToEnd(SizedBox(
                                                                  width: 24.0)),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              height: 1.0,
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Text(
                                            '${'${issueDetailPageAppIssueDetailRow?.titleName}'}${(issueDetailPageAppIssueDetailRow?.titleName != null && issueDetailPageAppIssueDetailRow?.titleName != '') && (issueDetailPageAppIssueDetailRow?.titleSubtitle != null && issueDetailPageAppIssueDetailRow?.titleSubtitle != '') ? ' – ' : ''}${issueDetailPageAppIssueDetailRow?.titleSubtitle != null && issueDetailPageAppIssueDetailRow?.titleSubtitle != '' ? '${issueDetailPageAppIssueDetailRow?.titleSubtitle} ' : ''}${issueDetailPageAppIssueDetailRow?.issueNumber != null && issueDetailPageAppIssueDetailRow?.issueNumber != '' ? ' #${issueDetailPageAppIssueDetailRow?.issueNumber}' : ''}',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.fraunces(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                  lineHeight: 1.2,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model
                                                .issueStatusIndicatorModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: IssueStatusIndicatorWidget(
                                              issueId: widget.issueId!,
                                              isLarge: true,
                                              titleId: widget.tittleId,
                                              entityType: 'issue',
                                              isSingleIssue: false,
                                              onSaved: () async {
                                                _model.refreshIssue =
                                                    await actions
                                                        .fetchLibraryTitles(
                                                  currentUserUid,
                                                );
                                                FFAppState().libraryTitles = _model
                                                    .refreshIssue!
                                                    .toList()
                                                    .cast<
                                                        LibraryTitleItemStruct>();
                                                FFAppState()
                                                    .needsLibraryRefresh = true;
                                                FFAppState().update(() {});

                                                safeSetState(() {});
                                              },
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if ((issueDetailPageAppIssueDetailRow
                                                            ?.issueName !=
                                                        null &&
                                                    issueDetailPageAppIssueDetailRow
                                                            ?.issueName !=
                                                        '') &&
                                                (issueDetailPageAppIssueDetailRow
                                                            ?.issueSubtitle ==
                                                        null ||
                                                    issueDetailPageAppIssueDetailRow
                                                            ?.issueSubtitle ==
                                                        ''))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    issueDetailPageAppIssueDetailRow
                                                        ?.issueName,
                                                    'Título',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .fraunces(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                        lineHeight: 1.2,
                                                      ),
                                                ),
                                              ),
                                            if ((issueDetailPageAppIssueDetailRow
                                                            ?.issueName !=
                                                        null &&
                                                    issueDetailPageAppIssueDetailRow
                                                            ?.issueName !=
                                                        '') &&
                                                (issueDetailPageAppIssueDetailRow
                                                            ?.issueSubtitle !=
                                                        null &&
                                                    issueDetailPageAppIssueDetailRow
                                                            ?.issueSubtitle !=
                                                        ''))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: Text(
                                                  '${issueDetailPageAppIssueDetailRow?.issueName}: ${issueDetailPageAppIssueDetailRow?.issueSubtitle}',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .fraunces(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                        lineHeight: 1.2,
                                                      ),
                                                ),
                                              ),
                                            if ((issueDetailPageAppIssueDetailRow
                                                            ?.issueSubtitle !=
                                                        null &&
                                                    issueDetailPageAppIssueDetailRow
                                                            ?.issueSubtitle !=
                                                        '') &&
                                                (issueDetailPageAppIssueDetailRow
                                                            ?.issueName ==
                                                        null ||
                                                    issueDetailPageAppIssueDetailRow
                                                            ?.issueName ==
                                                        ''))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    issueDetailPageAppIssueDetailRow
                                                        ?.issueSubtitle,
                                                    'Subtítulo',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .fraunces(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                        lineHeight: 1.2,
                                                      ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (issueDetailPageAppIssueDetailRow
                                                          ?.pages !=
                                                      null)
                                                    Text(
                                                      '${issueDetailPageAppIssueDetailRow?.pages?.toString()} pgs',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  if ((issueDetailPageAppIssueDetailRow
                                                              ?.pages !=
                                                          null) &&
                                                      (issueDetailPageAppIssueDetailRow
                                                              ?.date !=
                                                          null))
                                                    Text(
                                                      ' • ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  if (issueDetailPageAppIssueDetailRow
                                                          ?.date !=
                                                      null)
                                                    Text(
                                                      dateTimeFormat(
                                                        "yMMM",
                                                        issueDetailPageAppIssueDetailRow!
                                                            .date!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            if (false)
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  if ((issueDetailPageAppIssueDetailRow
                                                              ?.pages !=
                                                          null) &&
                                                      (issueDetailPageAppIssueDetailRow
                                                              ?.date !=
                                                          null))
                                                    Text(
                                                      ' • ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      issueDetailPageAppIssueDetailRow
                                                          ?.genreName,
                                                      'Gênero',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                ],
                                              ),
                                            if (issueDetailPageAppIssueDetailRow
                                                        ?.publisherName !=
                                                    null &&
                                                issueDetailPageAppIssueDetailRow
                                                        ?.publisherName !=
                                                    '')
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    if (false)
                                                      Text(
                                                        ' • ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          PublisherTitlesPageWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'publisherId':
                                                                serializeParam(
                                                              issueDetailPageAppIssueDetailRow
                                                                  ?.publisherId,
                                                              ParamType.String,
                                                            ),
                                                            'publisherName':
                                                                serializeParam(
                                                              issueDetailPageAppIssueDetailRow
                                                                  ?.publisherName,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            issueDetailPageAppIssueDetailRow
                                                                ?.publisherName,
                                                            'Editora',
                                                          ),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (issueDetailPageAppIssueDetailRow
                                                                ?.licensors !=
                                                            null &&
                                                        issueDetailPageAppIssueDetailRow
                                                                ?.licensors !=
                                                            '')
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if ((issueDetailPageAppIssueDetailRow
                                                                      ?.pages !=
                                                                  null) &&
                                                              (issueDetailPageAppIssueDetailRow
                                                                      ?.date !=
                                                                  null))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Text(
                                                                ' • ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final licensorsList = _model
                                                                      .titleLicensors
                                                                      .toList();

                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        licensorsList
                                                                            .length,
                                                                        (licensorsListIndex) {
                                                                      final licensorsListItem =
                                                                          licensorsList[
                                                                              licensorsListIndex];
                                                                      return Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              LicensorTitlesPageWidget.routeName,
                                                                              queryParameters: {
                                                                                'licensorId': serializeParam(
                                                                                  licensorsListItem.licensorId,
                                                                                  ParamType.int,
                                                                                ),
                                                                                'licensorName': serializeParam(
                                                                                  licensorsListItem.licensorName,
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            licensorsListItem.licensorName,
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                          ].divide(SizedBox(height: 2.0)),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ),
                                FutureBuilder<List<AppIssueStoriesRow>>(
                                  future: AppIssueStoriesTable().queryRows(
                                    queryFn: (q) => q
                                        .eqOrNull(
                                          'issue_id',
                                          widget.issueId,
                                        )
                                        .order('seq_in_issue', ascending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return StoryCardSkeletonWidget();
                                    }
                                    List<AppIssueStoriesRow>
                                        storiescreditsAppIssueStoriesRowList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final storiescreditsVar =
                                                  storiescreditsAppIssueStoriesRowList
                                                      .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    storiescreditsVar.length,
                                                itemBuilder: (context,
                                                    storiescreditsVarIndex) {
                                                  final storiescreditsVarItem =
                                                      storiescreditsVar[
                                                          storiescreditsVarIndex];
                                                  return wrapWithModel(
                                                    model: _model
                                                        .storyCardModels
                                                        .getModel(
                                                      storiescreditsVarItem
                                                          .storyId!,
                                                      storiescreditsVarIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: StoryCardWidget(
                                                      key: Key(
                                                        'Keyqc8_${storiescreditsVarItem.storyId!}',
                                                      ),
                                                      storyId:
                                                          storiescreditsVarItem
                                                              .storyId,
                                                      title: storiescreditsVarItem
                                                                      .storyTitle !=
                                                                  null &&
                                                              storiescreditsVarItem
                                                                      .storyTitle !=
                                                                  ''
                                                          ? storiescreditsVarItem
                                                              .storyTitle
                                                          : null,
                                                      number:
                                                          storiescreditsVarItem
                                                              .seqInIssue,
                                                      titleOriginal: storiescreditsVarItem
                                                                      .originalTitle !=
                                                                  null &&
                                                              storiescreditsVarItem
                                                                      .originalTitle !=
                                                                  ''
                                                          ? storiescreditsVarItem
                                                              .originalTitle
                                                          : null,
                                                      synopsis: storiescreditsVarItem
                                                                      .synopsis !=
                                                                  null &&
                                                              storiescreditsVarItem
                                                                      .synopsis !=
                                                                  ''
                                                          ? storiescreditsVarItem
                                                              .synopsis
                                                          : null,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 20.0, 24.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Fonte',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await launchURL(
                                                    issueDetailPageAppIssueDetailRow!
                                                        .urlGdqIssue!);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(6.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  'Guia dos Quadrinhos',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        FFIcons
                                                            .klinkExternalCircle,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 16.0,
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 4.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Visibility(
                                                visible: FFAppState()
                                                        .isAdminUser &&
                                                    (issueDetailPageAppIssueDetailRow
                                                                ?.urlGdqIssue !=
                                                            null &&
                                                        issueDetailPageAppIssueDetailRow
                                                                ?.urlGdqIssue !=
                                                            ''),
                                                child: FlutterFlowIconButton(
                                                  borderRadius: 8.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.restore,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    _model.scrapeResult =
                                                        await actions
                                                            .queueScrape(
                                                      'issue',
                                                      widget.issueId!,
                                                      issueDetailPageAppIssueDetailRow!
                                                          .urlGdqIssue!,
                                                    );
                                                    if (_model.scrapeResult ==
                                                        'success') {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Adicionado à fila de raspagem.',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                        ),
                                                      );
                                                    } else {
                                                      if (_model.scrapeResult ==
                                                          'already_queued') {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Já está na fila.',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                          ),
                                                        );
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Erro ao adicionar à fila',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                          ),
                                                        );
                                                      }
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (!issueDetailPageAppIssueDetailRow!
                                        .isSingleIssue! &&
                                    !widget.navOriginTitle)
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 12.0, 20.0, 12.0),
                                          child: Text(
                                            'Este item é parte de',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 16.0),
                                        child: FutureBuilder<
                                            List<AppTitleDetailRow>>(
                                          future: AppTitleDetailTable()
                                              .querySingleRow(
                                            queryFn: (q) => q.eqOrNull(
                                              'title_id',
                                              widget.tittleId,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Container(
                                                height: 136.0,
                                                child:
                                                    ListItemSkeletonSWidget(),
                                              );
                                            }
                                            List<AppTitleDetailRow>
                                                listItemAppTitleDetailRowList =
                                                snapshot.data!;

                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final listItemAppTitleDetailRow =
                                                listItemAppTitleDetailRowList
                                                        .isNotEmpty
                                                    ? listItemAppTitleDetailRowList
                                                        .first
                                                    : null;

                                            return wrapWithModel(
                                              model: _model.listItemModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: ListItemWidget(
                                                showTitleInfo: true,
                                                titleName:
                                                    listItemAppTitleDetailRow
                                                        ?.titleName,
                                                titleSubtitle:
                                                    listItemAppTitleDetailRow
                                                        ?.titleSubtitle,
                                                publisherName:
                                                    listItemAppTitleDetailRow
                                                        ?.publisherName,
                                                licensors:
                                                    listItemAppTitleDetailRow
                                                        ?.licensors,
                                                entityType: 'title',
                                                entityId: widget.tittleId,
                                                series:
                                                    listItemAppTitleDetailRow
                                                        ?.series,
                                                publicationStatus:
                                                    listItemAppTitleDetailRow
                                                        ?.publicationStatus,
                                                issueCount:
                                                    listItemAppTitleDetailRow
                                                        ?.issueCount,
                                                isSingleIssue: false,
                                                indexPosition: null,
                                                thumb:
                                                    'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listItemAppTitleDetailRow?.titleThumb}',
                                                thumb2:
                                                    'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listItemAppTitleDetailRow?.secondIssueThumb}',
                                                thumb3:
                                                    'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listItemAppTitleDetailRow?.thirdIssueThumb}',
                                                showDivider: false,
                                                selectionEnabled: false,
                                                showStatus: false,
                                                isAdult:
                                                    listItemAppTitleDetailRow
                                                        ?.isAdult,
                                                canSeeAdult: functions
                                                    .canSeeAdultContent(
                                                        FFAppState()
                                                            .currentUserBirthDateString,
                                                        FFAppState()
                                                            .adultContentEnabled),
                                                showIndex: false,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    TitleDetailPageWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'titleId': serializeParam(
                                                        widget.tittleId,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                onSaved: () async {},
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ));
      },
    );
  }
}
