import '/components/search_button_custom/search_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_area_empty_state_widget.dart' show UserAreaEmptyStateWidget;
import 'package:flutter/material.dart';

class UserAreaEmptyStateModel
    extends FlutterFlowModel<UserAreaEmptyStateWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SearchButtonCustom component.
  late SearchButtonCustomModel searchButtonCustomModel;

  @override
  void initState(BuildContext context) {
    searchButtonCustomModel =
        createModel(context, () => SearchButtonCustomModel());
  }

  @override
  void dispose() {
    searchButtonCustomModel.dispose();
  }
}
