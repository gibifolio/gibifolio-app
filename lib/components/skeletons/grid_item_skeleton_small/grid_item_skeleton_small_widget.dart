import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'grid_item_skeleton_small_model.dart';
export 'grid_item_skeleton_small_model.dart';

class GridItemSkeletonSmallWidget extends StatefulWidget {
  const GridItemSkeletonSmallWidget({
    super.key,
    String? issueId,
    bool? showTitleInfo,
    String? issueNumber,
    String? issueName,
    String? issueSubtitle,
    this.issuePages,
    String? titleName,
    String? titleSubtitle,
    String? publisherName,
    String? licensors,
    this.issueDate,
    String? entityType,
    String? entityId,
    String? series,
    String? publicationStatus,
    this.issueCount,
    bool? isSingleIssue,
    String? singleIssueId,
    this.singleIssuePages,
    this.indexPosition,
    String? thumb,
  })  : this.issueId = issueId ?? '',
        this.showTitleInfo = showTitleInfo ?? false,
        this.issueNumber = issueNumber ?? '',
        this.issueName = issueName ?? '',
        this.issueSubtitle = issueSubtitle ?? '',
        this.titleName = titleName ?? '',
        this.titleSubtitle = titleSubtitle ?? '',
        this.publisherName = publisherName ?? '',
        this.licensors = licensors ?? '',
        this.entityType = entityType ?? '',
        this.entityId = entityId ?? '',
        this.series = series ?? '',
        this.publicationStatus = publicationStatus ?? '',
        this.isSingleIssue = isSingleIssue ?? false,
        this.singleIssueId = singleIssueId ?? '',
        this.thumb = thumb ?? '';

  final String issueId;
  final bool showTitleInfo;
  final String issueNumber;
  final String issueName;
  final String issueSubtitle;
  final int? issuePages;
  final String titleName;
  final String titleSubtitle;
  final String publisherName;
  final String licensors;
  final DateTime? issueDate;
  final String entityType;
  final String entityId;
  final String series;
  final String publicationStatus;
  final int? issueCount;
  final bool isSingleIssue;
  final String singleIssueId;
  final int? singleIssuePages;
  final int? indexPosition;
  final String thumb;

  @override
  State<GridItemSkeletonSmallWidget> createState() =>
      _GridItemSkeletonSmallWidgetState();
}

class _GridItemSkeletonSmallWidgetState
    extends State<GridItemSkeletonSmallWidget> {
  late GridItemSkeletonSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GridItemSkeletonSmallModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.4,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
        child: wrapWithModel(
          model: _model.textSkeletonModel,
          updateCallback: () => safeSetState(() {}),
          child: TextSkeletonWidget(
            width: 80.0,
            height: 108.0,
          ),
        ),
      ),
    );
  }
}
