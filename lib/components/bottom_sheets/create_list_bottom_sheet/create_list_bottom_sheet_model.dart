import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_list_bottom_sheet_widget.dart' show CreateListBottomSheetWidget;
import 'package:flutter/material.dart';

class CreateListBottomSheetModel
    extends FlutterFlowModel<CreateListBottomSheetWidget> {
  ///  Local state fields for this component.

  String? listName;

  bool isLoading = false;

  String? description;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ListName widget.
  FocusNode? listNameFocusNode;
  TextEditingController? listNameTextController;
  String? Function(BuildContext, String?)? listNameTextControllerValidator;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ListsRow>? updateExistingList;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ListsRow? createdList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listNameFocusNode?.dispose();
    listNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
