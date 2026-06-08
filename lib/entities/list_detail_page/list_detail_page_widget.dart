import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_sheets/confirmation_bottom_sheet/confirmation_bottom_sheet_widget.dart';
import '/components/bottom_sheets/create_list_bottom_sheet/create_list_bottom_sheet_widget.dart';
import '/components/items_and_thumbs/list_item/list_item_widget.dart';
import '/components/skeletons/empty_state_list/empty_state_list_widget.dart';
import '/components/skeletons/list_header_loading/list_header_loading_widget.dart';
import '/components/skeletons/list_item_skeleton_l/list_item_skeleton_l_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_detail_page_model.dart';
export 'list_detail_page_model.dart';

class ListDetailPageWidget extends StatefulWidget {
  const ListDetailPageWidget({
    super.key,
    required this.listId,
  });

  final String? listId;

  static String routeName = 'ListDetailPage';
  static String routePath = '/listDetailPage';

  @override
  State<ListDetailPageWidget> createState() => _ListDetailPageWidgetState();
}

class _ListDetailPageWidgetState extends State<ListDetailPageWidget> {
  late ListDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListDetailPageModel());

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
        title: 'Gibifolio - Lista',
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
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            await actions.shareContent(
                              'https://app.gibifolio.com.br/listDetailPage?listId=${widget.listId}',
                              'Lista de HQs em Gibifolio',
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder<List<AppListDetailRow>>(
                            future: AppListDetailTable().querySingleRow(
                              queryFn: (q) => q.eqOrNull(
                                'list_id',
                                widget.listId,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return ListHeaderLoadingWidget();
                              }
                              List<AppListDetailRow>
                                  containerAppListDetailRowList =
                                  snapshot.data!;

                              final containerAppListDetailRow =
                                  containerAppListDetailRowList.isNotEmpty
                                      ? containerAppListDetailRowList.first
                                      : null;

                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (containerAppListDetailRow!.itemCount! >
                                        0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16.0),
                                            topRight: Radius.circular(16.0),
                                          ),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16.0),
                                                topRight: Radius.circular(16.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      32.0, 32.0, 32.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    width: 220.0,
                                                    height: 100.0,
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        if (containerAppListDetailRow
                                                                    .thumb1 !=
                                                                null &&
                                                            containerAppListDetailRow
                                                                    .thumb1 !=
                                                                '')
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Transform
                                                                .rotate(
                                                              angle: 2.0 *
                                                                  (math.pi /
                                                                      180),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          24.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: custom_widgets
                                                                      .ComicCover(
                                                                    width: 80.0,
                                                                    height:
                                                                        160.0,
                                                                    imageUrl:
                                                                        'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${containerAppListDetailRow.thumb3}',
                                                                    titleName:
                                                                        '',
                                                                    titleId: '',
                                                                    alignBottom:
                                                                        false,
                                                                    enableLightbox:
                                                                        false,
                                                                    isAdult:
                                                                        containerAppListDetailRow
                                                                            .isAdult3,
                                                                    canSeeAdult: functions.canSeeAdultContent(
                                                                        FFAppState()
                                                                            .currentUserBirthDateString,
                                                                        FFAppState()
                                                                            .adultContentEnabled),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (containerAppListDetailRow
                                                                    .thumb2 !=
                                                                null &&
                                                            containerAppListDetailRow
                                                                    .thumb2 !=
                                                                '')
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            child: Transform
                                                                .rotate(
                                                              angle: 0.0 *
                                                                  (math.pi /
                                                                      180),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: custom_widgets
                                                                      .ComicCover(
                                                                    width: 80.0,
                                                                    height:
                                                                        160.0,
                                                                    imageUrl:
                                                                        'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${containerAppListDetailRow.thumb2}',
                                                                    titleName:
                                                                        '',
                                                                    titleId: '',
                                                                    alignBottom:
                                                                        false,
                                                                    enableLightbox:
                                                                        false,
                                                                    isAdult:
                                                                        containerAppListDetailRow
                                                                            .isAdult2,
                                                                    canSeeAdult: functions.canSeeAdultContent(
                                                                        FFAppState()
                                                                            .currentUserBirthDateString,
                                                                        FFAppState()
                                                                            .adultContentEnabled),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (containerAppListDetailRow
                                                                    .thumb1 !=
                                                                null &&
                                                            containerAppListDetailRow
                                                                    .thumb1 !=
                                                                '')
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Transform
                                                                .rotate(
                                                              angle: 358.0 *
                                                                  (math.pi /
                                                                      180),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        1.0),
                                                                child: custom_widgets
                                                                    .ComicCover(
                                                                  width: 80.0,
                                                                  height: 160.0,
                                                                  imageUrl:
                                                                      'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${containerAppListDetailRow.thumb1}',
                                                                  titleName: '',
                                                                  titleId: '',
                                                                  alignBottom:
                                                                      false,
                                                                  enableLightbox:
                                                                      false,
                                                                  isAdult:
                                                                      containerAppListDetailRow
                                                                          .isAdult1,
                                                                  canSeeAdult: functions.canSeeAdultContent(
                                                                      FFAppState()
                                                                          .currentUserBirthDateString,
                                                                      FFAppState()
                                                                          .adultContentEnabled),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (containerAppListDetailRow.itemCount! >
                                        0)
                                      Divider(
                                        height: 0.5,
                                        thickness: 0.5,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 4.0, 16.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 16.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            containerAppListDetailRow
                                                                .listName,
                                                            'Lista de HQs',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                font: GoogleFonts
                                                                    .fraunces(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                                lineHeight: 1.2,
                                                              ),
                                                        ),
                                                      ),
                                                      if (containerAppListDetailRow
                                                                  .description !=
                                                              null &&
                                                          containerAppListDetailRow
                                                                  .description !=
                                                              '')
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            containerAppListDetailRow
                                                                .description,
                                                            'Descrição da lista',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(height: 4.0)),
                                                  ),
                                                ),
                                              ),
                                              if (containerAppListDetailRow
                                                      .userId ==
                                                  currentUserUid)
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (false)
                                                      FlutterFlowIconButton(
                                                        borderRadius: 8.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons
                                                              .mode_edit_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      CreateListBottomSheetWidget(
                                                                    listId: widget
                                                                        .listId,
                                                                    initialName:
                                                                        containerAppListDetailRow
                                                                            .listName,
                                                                    initialDescription:
                                                                        containerAppListDetailRow
                                                                            .description,
                                                                    onListCreated:
                                                                        () async {},
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                      ),
                                                    if (false)
                                                      FlutterFlowIconButton(
                                                        borderRadius: 8.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons
                                                              .delete_forever_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Excluir  \"${containerAppListDetailRow.listName}\" ?'),
                                                                        content:
                                                                            Text('Essa lista possui ${containerAppListDetailRow.itemCount?.toString()} itens. Essa ação não pode ser desfeita.'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('Cancelar'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('Excluir lista'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            await ListsTable()
                                                                .delete(
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                'list_id',
                                                                widget.listId,
                                                              ),
                                                            );
                                                            FFAppState()
                                                                    .needsLibraryRefresh =
                                                                true;
                                                            FFAppState()
                                                                .update(() {});

                                                            context.goNamed(
                                                                MyListsPageWidget
                                                                    .routeName);
                                                          }
                                                        },
                                                      ),
                                                    FlutterFlowIconButton(
                                                      borderRadius: 8.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        FFIcons.kmoreVertical,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    ConfirmationBottomSheetWidget(
                                                                  showPrimary:
                                                                      true,
                                                                  showSecondary1:
                                                                      true,
                                                                  showSecondary2:
                                                                      true,
                                                                  showDestructive:
                                                                      false,
                                                                  labelDismiss:
                                                                      'Cancelar',
                                                                  labelActionSecondary1:
                                                                      'Editar nome e decrição',
                                                                  labelActionSecondary2:
                                                                      'Excluir lista',
                                                                  dialogTitle:
                                                                      'Opções da lista',
                                                                  iconSecondary1:
                                                                      Icon(
                                                                    Icons
                                                                        .edit_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  iconSecondary2:
                                                                      Icon(
                                                                    Icons
                                                                        .delete_forever_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  labelActionPrimary:
                                                                      'Adicionar itens',
                                                                  iconPrimary:
                                                                      Icon(
                                                                    FFIcons
                                                                        .ksearch,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    size: 24.0,
                                                                  ),
                                                                  clickPrimary:
                                                                      () async {
                                                                    context.pushNamed(
                                                                        SearchPageWidget
                                                                            .routeName);
                                                                  },
                                                                  clickSecondary1:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(context).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                CreateListBottomSheetWidget(
                                                                              listId: widget.listId,
                                                                              initialName: containerAppListDetailRow.listName,
                                                                              initialDescription: containerAppListDetailRow.description,
                                                                              onListCreated: () async {},
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                  clickSecondary2:
                                                                      () async {
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Excluir  \"${containerAppListDetailRow.listName}\" ?'),
                                                                                  content: Text('Essa lista possui ${containerAppListDetailRow.itemCount?.toString()} itens. Essa ação não pode ser desfeita.'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancelar'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Excluir lista'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      await ListsTable()
                                                                          .delete(
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eqOrNull(
                                                                          'list_id',
                                                                          widget
                                                                              .listId,
                                                                        ),
                                                                      );
                                                                      FFAppState()
                                                                              .needsLibraryRefresh =
                                                                          true;
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});

                                                                      context.goNamed(
                                                                          MyListsPageWidget
                                                                              .routeName);
                                                                    }
                                                                  },
                                                                  clickDestructive:
                                                                      () async {},
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (containerAppListDetailRow.itemCount! >
                                        0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                containerAppListDetailRow
                                                    .itemCount
                                                    ?.toString(),
                                                'Número de',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                            ),
                                            Text(
                                              ' itens',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ]
                                              .divide(SizedBox(width: 1.0))
                                              .addToStart(SizedBox(width: 16.0))
                                              .addToEnd(SizedBox(width: 16.0)),
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: FutureBuilder<List<AppListItemsRow>>(
                              future: AppListItemsTable().queryRows(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'list_id',
                                      widget.listId,
                                    )
                                    .order('position', ascending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return ListItemSkeletonLWidget();
                                }
                                List<AppListItemsRow>
                                    listViewAppListItemsRowList =
                                    snapshot.data!;

                                if (listViewAppListItemsRowList.isEmpty) {
                                  return EmptyStateListWidget(
                                    listType: '',
                                  );
                                }

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewAppListItemsRowList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewAppListItemsRow =
                                        listViewAppListItemsRowList[
                                            listViewIndex];
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        wrapWithModel(
                                          model: _model.listItemModels.getModel(
                                            listViewAppListItemsRow.entityId!,
                                            listViewIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ListItemWidget(
                                            key: Key(
                                              'Key27d_${listViewAppListItemsRow.entityId!}',
                                            ),
                                            issueId: listViewAppListItemsRow
                                                .entityId,
                                            showTitleInfo: true,
                                            thumb:
                                                'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listViewAppListItemsRow.thumbLocalPath}',
                                            issueNumber: listViewAppListItemsRow
                                                .issueNumber,
                                            issueName: listViewAppListItemsRow
                                                .issueName,
                                            issueSubtitle:
                                                listViewAppListItemsRow
                                                    .issueSubtitle,
                                            issuePages: listViewAppListItemsRow
                                                .issuePages,
                                            titleName: listViewAppListItemsRow
                                                .titleName,
                                            titleSubtitle:
                                                listViewAppListItemsRow
                                                    .titleSubtitle,
                                            publisherName:
                                                listViewAppListItemsRow
                                                    .publisherName,
                                            licensors: listViewAppListItemsRow
                                                .licensors,
                                            entityType: listViewAppListItemsRow
                                                .entityType,
                                            entityId: listViewAppListItemsRow
                                                .entityId,
                                            series:
                                                listViewAppListItemsRow.series,
                                            publicationStatus:
                                                listViewAppListItemsRow
                                                    .publicationStatus,
                                            issueCount: listViewAppListItemsRow
                                                .issueCount,
                                            isSingleIssue:
                                                listViewAppListItemsRow
                                                            .typeNormalized ==
                                                        'single_issue'
                                                    ? true
                                                    : false,
                                            singleIssueId: listViewAppListItemsRow
                                                            .singleIssueId !=
                                                        null &&
                                                    listViewAppListItemsRow
                                                            .singleIssueId !=
                                                        ''
                                                ? listViewAppListItemsRow
                                                    .singleIssueId
                                                : '',
                                            singleIssuePages:
                                                listViewAppListItemsRow
                                                    .singleIssuePages,
                                            issueDate: listViewAppListItemsRow
                                                .issueDate,
                                            indexPosition:
                                                listViewAppListItemsRow
                                                    .displayOrder,
                                            thumb2:
                                                'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listViewAppListItemsRow.thumb2LocalPath}',
                                            thumb3:
                                                'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listViewAppListItemsRow.thumb3LocalPath}',
                                            showDivider: false,
                                            selectionEnabled: false,
                                            showStatus: true,
                                            isAdult:
                                                listViewAppListItemsRow.isAdult,
                                            canSeeAdult:
                                                functions.canSeeAdultContent(
                                                    FFAppState()
                                                        .currentUserBirthDateString,
                                                    FFAppState()
                                                        .adultContentEnabled),
                                            showIndex: false,
                                            onTap: () async {
                                              if (listViewAppListItemsRow
                                                      .entityType ==
                                                  'issue') {
                                                context.pushNamed(
                                                  IssueDetailPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'issueId': serializeParam(
                                                      listViewAppListItemsRow
                                                          .entityId,
                                                      ParamType.String,
                                                    ),
                                                    'tittleId': serializeParam(
                                                      listViewAppListItemsRow
                                                          .titleId,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                if ((listViewAppListItemsRow
                                                                .singleIssueId !=
                                                            null &&
                                                        listViewAppListItemsRow
                                                                .singleIssueId !=
                                                            '') &&
                                                    (listViewAppListItemsRow
                                                            .issueCount ==
                                                        1)) {
                                                  context.pushNamed(
                                                    IssueDetailPageWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'issueId': serializeParam(
                                                        listViewAppListItemsRow
                                                            .singleIssueId,
                                                        ParamType.String,
                                                      ),
                                                      'tittleId':
                                                          serializeParam(
                                                        listViewAppListItemsRow
                                                            .titleId,
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
                                                        listViewAppListItemsRow
                                                            .titleId,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                }
                                              }
                                            },
                                            onSaved: () async {
                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                        if (listViewAppListItemsRow.notes !=
                                                null &&
                                            listViewAppListItemsRow.notes != '')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 24.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 32.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Divider(
                                                      height: 1.0,
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              listViewAppListItemsRow
                                                                  .notes,
                                                              'Informações',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
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
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
