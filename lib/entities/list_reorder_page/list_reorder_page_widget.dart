import '/components/drag_handle_items/drag_handle_items_widget.dart';
import '/components/items_and_thumbs/list_item/list_item_widget.dart';
import '/components/skeletons/empty_state_list/empty_state_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_reorder_page_model.dart';
export 'list_reorder_page_model.dart';

class ListReorderPageWidget extends StatefulWidget {
  const ListReorderPageWidget({
    super.key,
    required this.listId,
  });

  final String? listId;

  static String routeName = 'ListReorderPage';
  static String routePath = '/listReorderPage';

  @override
  State<ListReorderPageWidget> createState() => _ListReorderPageWidgetState();
}

class _ListReorderPageWidgetState extends State<ListReorderPageWidget> {
  late ListReorderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListReorderPageModel());

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
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.close,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'Reordenar',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.fraunces(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                ),
              ),
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.check,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        _model.isSaved = await actions.saveListOrder(
                          widget.listId!,
                          FFAppState().listEditBuffer.toList(),
                        );
                        if (_model.isSaved!) {
                          context.safePop();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Erro ao salvar. Tente novamente.',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          );
                        }

                        safeSetState(() {});
                      },
                    ),
                  ],
                ),
              ],
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
                  child: Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Builder(
                      builder: (context) {
                        final listReorder =
                            FFAppState().listEditBuffer.toList();
                        if (listReorder.isEmpty) {
                          return EmptyStateListWidget(
                            listType: '',
                          );
                        }

                        return ReorderableListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          proxyDecorator: (Widget child, int index,
                                  Animation<double> animation) =>
                              Material(color: Colors.transparent, child: child),
                          buildDefaultDragHandles: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listReorder.length,
                          itemBuilder: (context, listReorderIndex) {
                            final listReorderItem =
                                listReorder[listReorderIndex];
                            return Stack(
                              key: ValueKey("ListView_9bd7dy3s" +
                                  '_' +
                                  listReorderIndex.toString()),
                              children: [
                                wrapWithModel(
                                  model: _model.listItemModels.getModel(
                                    listReorderItem.entityId,
                                    listReorderIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: ListItemWidget(
                                    key: Key(
                                      'Keybnt_${listReorderItem.entityId}',
                                    ),
                                    issueId: listReorderItem.entityId,
                                    showTitleInfo: true,
                                    thumb:
                                        'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${listReorderItem.thumbLocalPath}',
                                    issueNumber: listReorderItem.issueNumber,
                                    issueName: listReorderItem.issueName,
                                    issueSubtitle:
                                        listReorderItem.issueSubtitle,
                                    issuePages: listReorderItem.issuePages,
                                    titleName: listReorderItem.titleName,
                                    titleSubtitle:
                                        listReorderItem.titleSubtitle,
                                    publisherName:
                                        listReorderItem.publisherName,
                                    licensors: listReorderItem.licensors,
                                    entityType: listReorderItem.entityType,
                                    entityId: listReorderItem.entityId,
                                    series: listReorderItem.series,
                                    issueCount: listReorderItem.issueCount,
                                    isSingleIssue:
                                        listReorderItem.typeNormalized ==
                                            'single_issue',
                                    singleIssueId:
                                        listReorderItem.typeNormalized ==
                                                'single_issue'
                                            ? listReorderItem.entityId
                                            : '',
                                    singleIssuePages:
                                        listReorderItem.issuePages,
                                    indexPosition: listReorderIndex,
                                    thumb2: '',
                                    thumb3: '',
                                    showDivider: true,
                                    selectionEnabled: false,
                                    showStatus: false,
                                    isAdult: listReorderItem.isAdult,
                                    canSeeAdult: functions.canSeeAdultContent(
                                        FFAppState().currentUserBirthDateString,
                                        FFAppState().adultContentEnabled),
                                    showIndex: true,
                                    preTitle: listReorderItem.preTitle,
                                    formatLabel: listReorderItem.formatLabel,
                                    onTap: () async {},
                                    onSaved: () async {},
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.grab,
                                      child: ReorderableDragStartListener(
                                        index: listReorderIndex,
                                        child: DragHandleItemsWidget(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          onReorder: (int reorderableOldIndex,
                              int reorderableNewIndex) async {
                            await actions.moveBufferItem(
                              reorderableOldIndex,
                              reorderableNewIndex,
                            );

                            safeSetState(() {});
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
