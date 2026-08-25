import '/backend/schema/structs/index.dart';
import '/components/drag_handle_lists/drag_handle_lists_widget.dart';
import '/components/items_and_thumbs/list_featured/list_featured_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_lists_reorder_page_model.dart';
export 'my_lists_reorder_page_model.dart';

class MyListsReorderPageWidget extends StatefulWidget {
  const MyListsReorderPageWidget({super.key});

  static String routeName = 'MyListsReorderPage';
  static String routePath = '/myListsReorderPage';

  @override
  State<MyListsReorderPageWidget> createState() =>
      _MyListsReorderPageWidgetState();
}

class _MyListsReorderPageWidgetState extends State<MyListsReorderPageWidget> {
  late MyListsReorderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyListsReorderPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.sortUserListsBuffer(
        'manual',
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
                  _model.restoreOrder = await actions.loadUserListsBuffer();
                  FFAppState().userListsBuffer =
                      _model.restoreOrder!.toList().cast<UserListItemStruct>();
                  await actions.sortUserListsBuffer(
                    FFAppState().listSortCriterion,
                  );
                  context.safePop();

                  safeSetState(() {});
                },
              ),
              title: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'Arraste para reordenar',
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
                        _model.isSaved = await actions.saveUserListsOrder(
                          functions
                              .extractUserListIds(
                                  FFAppState().userListsBuffer.toList())
                              .toList(),
                        );
                        if (_model.isSaved!) {
                          await actions.refreshUserListsBuffer();
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
                  child: Builder(
                    builder: (context) {
                      final userListsList =
                          FFAppState().userListsBuffer.toList();

                      return ReorderableListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        proxyDecorator: (Widget child, int index,
                                Animation<double> animation) =>
                            Material(color: Colors.transparent, child: child),
                        buildDefaultDragHandles: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: userListsList.length,
                        itemBuilder: (context, userListsListIndex) {
                          final userListsListItem =
                              userListsList[userListsListIndex];
                          return Stack(
                            key: ValueKey("ListView_8hsu21c6" +
                                '_' +
                                userListsListIndex.toString()),
                            children: [
                              Container(
                                width: double.infinity,
                                height: 140.0,
                                decoration: BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model.listFeaturedModels.getModel(
                                    userListsListItem.listId,
                                    userListsListIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: ListFeaturedWidget(
                                    key: Key(
                                      'Keyqgb_${userListsListItem.listId}',
                                    ),
                                    listTitle: userListsListItem.listName,
                                    listDescription:
                                        userListsListItem.description,
                                    thumbUrl1:
                                        'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${userListsListItem.thumb1}',
                                    thumbUrl2:
                                        'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${userListsListItem.thumb2}',
                                    thumbUrl3:
                                        'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/${userListsListItem.thumb3}',
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.grab,
                                    child: ReorderableDragStartListener(
                                      index: userListsListIndex,
                                      child: DragHandleListsWidget(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        onReorder: (int reorderableOldIndex,
                            int reorderableNewIndex) async {
                          await actions.moveListBufferItem(
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
        ));
  }
}
