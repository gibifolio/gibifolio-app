import '/components/items_and_thumbs/list_featured/list_featured_widget.dart';
import '/components/items_and_thumbs/list_thumb/list_thumb_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'lists_page_widget.dart' show ListsPageWidget;
import 'package:flutter/material.dart';

class ListsPageModel extends FlutterFlowModel<ListsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for ListFeatured dynamic component.
  late FlutterFlowDynamicModels<ListFeaturedModel> listFeaturedModels;
  // Models for ListThumb dynamic component.
  late FlutterFlowDynamicModels<ListThumbModel> listThumbModels;

  @override
  void initState(BuildContext context) {
    listFeaturedModels = FlutterFlowDynamicModels(() => ListFeaturedModel());
    listThumbModels = FlutterFlowDynamicModels(() => ListThumbModel());
  }

  @override
  void dispose() {
    listFeaturedModels.dispose();
    listThumbModels.dispose();
  }
}
