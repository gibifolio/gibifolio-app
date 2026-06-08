import '/backend/schema/structs/index.dart';
import '/components/items_and_thumbs/list_item/list_item_widget.dart';
import '/components/status/issue_status_indicator/issue_status_indicator_widget.dart';
import '/components/story_card/story_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'issue_detail_page_widget.dart' show IssueDetailPageWidget;
import 'package:flutter/material.dart';

class IssueDetailPageModel extends FlutterFlowModel<IssueDetailPageWidget> {
  ///  Local state fields for this page.

  List<LicensorItemStruct> titleLicensors = [];
  void addToTitleLicensors(LicensorItemStruct item) => titleLicensors.add(item);
  void removeFromTitleLicensors(LicensorItemStruct item) =>
      titleLicensors.remove(item);
  void removeAtIndexFromTitleLicensors(int index) =>
      titleLicensors.removeAt(index);
  void insertAtIndexInTitleLicensors(int index, LicensorItemStruct item) =>
      titleLicensors.insert(index, item);
  void updateTitleLicensorsAtIndex(
          int index, Function(LicensorItemStruct) updateFn) =>
      titleLicensors[index] = updateFn(titleLicensors[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - fetchTitleLicensors] action in IssueDetailPage widget.
  List<LicensorItemStruct>? titleLicensorsList;
  // Model for IssueStatusIndicator component.
  late IssueStatusIndicatorModel issueStatusIndicatorModel;
  // Stores action output result for [Custom Action - fetchLibraryTitles] action in IssueStatusIndicator widget.
  List<LibraryTitleItemStruct>? refreshIssue;
  // Models for StoryCard dynamic component.
  late FlutterFlowDynamicModels<StoryCardModel> storyCardModels;
  // Stores action output result for [Custom Action - queueScrape] action in scrape widget.
  String? scrapeResult;
  // Model for ListItem component.
  late ListItemModel listItemModel;

  @override
  void initState(BuildContext context) {
    issueStatusIndicatorModel =
        createModel(context, () => IssueStatusIndicatorModel());
    storyCardModels = FlutterFlowDynamicModels(() => StoryCardModel());
    listItemModel = createModel(context, () => ListItemModel());
  }

  @override
  void dispose() {
    issueStatusIndicatorModel.dispose();
    storyCardModels.dispose();
    listItemModel.dispose();
  }
}
