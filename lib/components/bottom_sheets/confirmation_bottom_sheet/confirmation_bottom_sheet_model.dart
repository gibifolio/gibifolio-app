import '/flutter_flow/flutter_flow_util.dart';
import 'confirmation_bottom_sheet_widget.dart'
    show ConfirmationBottomSheetWidget;
import 'package:flutter/material.dart';

class ConfirmationBottomSheetModel
    extends FlutterFlowModel<ConfirmationBottomSheetWidget> {
  ///  Local state fields for this component.

  String? selectedReading;

  String? selectedOwnership;

  List<String> itemListIds = [];
  void addToItemListIds(String item) => itemListIds.add(item);
  void removeFromItemListIds(String item) => itemListIds.remove(item);
  void removeAtIndexFromItemListIds(int index) => itemListIds.removeAt(index);
  void insertAtIndexInItemListIds(int index, String item) =>
      itemListIds.insert(index, item);
  void updateItemListIdsAtIndex(int index, Function(String) updateFn) =>
      itemListIds[index] = updateFn(itemListIds[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
