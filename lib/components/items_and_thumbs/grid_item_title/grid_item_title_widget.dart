import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'grid_item_title_model.dart';
export 'grid_item_title_model.dart';

class GridItemTitleWidget extends StatefulWidget {
  const GridItemTitleWidget({
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
    this.thumb2,
    this.thumb3,
    bool? isAdult,
    bool? canSeelAdult,
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
        this.thumb = thumb ?? '',
        this.isAdult = isAdult ?? false,
        this.canSeelAdult = canSeelAdult ?? false;

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
  final String? thumb2;
  final String? thumb3;
  final bool isAdult;
  final bool canSeelAdult;

  @override
  State<GridItemTitleWidget> createState() => _GridItemTitleWidgetState();
}

class _GridItemTitleWidgetState extends State<GridItemTitleWidget> {
  late GridItemTitleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GridItemTitleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      constraints: BoxConstraints(
        maxWidth: 120.0,
      ),
      decoration: BoxDecoration(),
      alignment: AlignmentDirectional(-1.0, 1.0),
      child: Align(
        alignment: AlignmentDirectional(-1.0, 1.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional(-1.0, 1.0),
            children: [
              if ((widget.thumb3 != null && widget.thumb3 != '') &&
                  (widget.entityType == 'title'))
                Align(
                  alignment: AlignmentDirectional(-1.0, 1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Transform.rotate(
                      angle: 6.0 * (math.pi / 180),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: custom_widgets.ComicCover(
                          width: valueOrDefault<double>(
                            widget.thumb3 != null && widget.thumb3 != ''
                                ? double.infinity
                                : 96.0,
                            96.0,
                          ),
                          height: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 120.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 140.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 120.0;
                            } else {
                              return 100.0;
                            }
                          }(),
                          imageUrl:
                              widget.thumb3 != null && widget.thumb3 != ''
                                  ? widget.thumb3
                                  : 'null',
                          titleName: widget.titleName,
                          issueNumber: widget.issueNumber,
                          titleId: widget.entityId,
                          spineHeight: 3.0,
                          cornersRight: 3.0,
                          cornersLeft: 0.0,
                          shadowX: 2.0,
                          alignBottom: true,
                          enableLightbox: false,
                          isAdult: widget.isAdult,
                          canSeeAdult: widget.canSeelAdult,
                        ),
                      ),
                    ),
                  ),
                ),
              if ((widget.thumb2 != null && widget.thumb2 != '') &&
                  (widget.entityType == 'title'))
                Align(
                  alignment: AlignmentDirectional(-1.0, 1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 6.0),
                    child: Transform.rotate(
                      angle: 3.0 * (math.pi / 180),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 4.0, 0.0),
                          child: custom_widgets.ComicCover(
                            width: valueOrDefault<double>(
                              widget.thumb2 != null && widget.thumb2 != ''
                                  ? double.infinity
                                  : 96.0,
                              96.0,
                            ),
                            height: 120.0,
                            imageUrl:
                                widget.thumb2 != null && widget.thumb2 != ''
                                    ? widget.thumb2
                                    : 'null',
                            titleName: widget.titleName,
                            issueNumber: widget.issueNumber,
                            titleId: widget.entityId,
                            spineHeight: 3.0,
                            cornersRight: 3.0,
                            cornersLeft: 0.0,
                            shadowX: 2.0,
                            alignBottom: true,
                            enableLightbox: false,
                            isAdult: widget.isAdult,
                            canSeeAdult: widget.canSeelAdult,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Align(
                alignment: AlignmentDirectional(-1.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Transform.rotate(
                    angle: 0.0 * (math.pi / 180),
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: custom_widgets.ComicCover(
                          width: valueOrDefault<double>(
                            widget.thumb != ''
                                ? double.infinity
                                : 96.0,
                            96.0,
                          ),
                          height: 120.0,
                          imageUrl: widget.thumb,
                          titleName: widget.titleName,
                          issueNumber: widget.issueNumber,
                          titleId: widget.entityId,
                          spineHeight: 3.0,
                          cornersRight: 3.0,
                          cornersLeft: 0.0,
                          shadowX: 2.0,
                          alignBottom: true,
                          enableLightbox: false,
                          isAdult: widget.isAdult,
                          canSeeAdult: widget.canSeelAdult,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
