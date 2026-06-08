// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AutocompleteItemStruct extends BaseStruct {
  AutocompleteItemStruct({
    String? titleId,
    String? titleName,
    String? typeNormalized,
    String? titleSubtitle,
    String? publisherName,
    String? titleThumb,
    String? series,
    int? issueCount,
    String? singleIssueId,
    bool? isAdult,
  })  : _titleId = titleId,
        _titleName = titleName,
        _typeNormalized = typeNormalized,
        _titleSubtitle = titleSubtitle,
        _publisherName = publisherName,
        _titleThumb = titleThumb,
        _series = series,
        _issueCount = issueCount,
        _singleIssueId = singleIssueId,
        _isAdult = isAdult;

  // "titleId" field.
  String? _titleId;
  String get titleId => _titleId ?? '';
  set titleId(String? val) => _titleId = val;

  bool hasTitleId() => _titleId != null;

  // "titleName" field.
  String? _titleName;
  String get titleName => _titleName ?? '';
  set titleName(String? val) => _titleName = val;

  bool hasTitleName() => _titleName != null;

  // "typeNormalized" field.
  String? _typeNormalized;
  String get typeNormalized => _typeNormalized ?? '';
  set typeNormalized(String? val) => _typeNormalized = val;

  bool hasTypeNormalized() => _typeNormalized != null;

  // "titleSubtitle" field.
  String? _titleSubtitle;
  String get titleSubtitle => _titleSubtitle ?? '';
  set titleSubtitle(String? val) => _titleSubtitle = val;

  bool hasTitleSubtitle() => _titleSubtitle != null;

  // "publisherName" field.
  String? _publisherName;
  String get publisherName => _publisherName ?? '';
  set publisherName(String? val) => _publisherName = val;

  bool hasPublisherName() => _publisherName != null;

  // "titleThumb" field.
  String? _titleThumb;
  String get titleThumb => _titleThumb ?? '';
  set titleThumb(String? val) => _titleThumb = val;

  bool hasTitleThumb() => _titleThumb != null;

  // "series" field.
  String? _series;
  String get series => _series ?? '';
  set series(String? val) => _series = val;

  bool hasSeries() => _series != null;

  // "issueCount" field.
  int? _issueCount;
  int get issueCount => _issueCount ?? 0;
  set issueCount(int? val) => _issueCount = val;

  void incrementIssueCount(int amount) => issueCount = issueCount + amount;

  bool hasIssueCount() => _issueCount != null;

  // "singleIssueId" field.
  String? _singleIssueId;
  String get singleIssueId => _singleIssueId ?? '';
  set singleIssueId(String? val) => _singleIssueId = val;

  bool hasSingleIssueId() => _singleIssueId != null;

  // "isAdult" field.
  bool? _isAdult;
  bool get isAdult => _isAdult ?? false;
  set isAdult(bool? val) => _isAdult = val;

  bool hasIsAdult() => _isAdult != null;

  static AutocompleteItemStruct fromMap(Map<String, dynamic> data) =>
      AutocompleteItemStruct(
        titleId: data['titleId'] as String?,
        titleName: data['titleName'] as String?,
        typeNormalized: data['typeNormalized'] as String?,
        titleSubtitle: data['titleSubtitle'] as String?,
        publisherName: data['publisherName'] as String?,
        titleThumb: data['titleThumb'] as String?,
        series: data['series'] as String?,
        issueCount: castToType<int>(data['issueCount']),
        singleIssueId: data['singleIssueId'] as String?,
        isAdult: data['isAdult'] as bool?,
      );

  static AutocompleteItemStruct? maybeFromMap(dynamic data) => data is Map
      ? AutocompleteItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'titleId': _titleId,
        'titleName': _titleName,
        'typeNormalized': _typeNormalized,
        'titleSubtitle': _titleSubtitle,
        'publisherName': _publisherName,
        'titleThumb': _titleThumb,
        'series': _series,
        'issueCount': _issueCount,
        'singleIssueId': _singleIssueId,
        'isAdult': _isAdult,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'titleId': serializeParam(
          _titleId,
          ParamType.String,
        ),
        'titleName': serializeParam(
          _titleName,
          ParamType.String,
        ),
        'typeNormalized': serializeParam(
          _typeNormalized,
          ParamType.String,
        ),
        'titleSubtitle': serializeParam(
          _titleSubtitle,
          ParamType.String,
        ),
        'publisherName': serializeParam(
          _publisherName,
          ParamType.String,
        ),
        'titleThumb': serializeParam(
          _titleThumb,
          ParamType.String,
        ),
        'series': serializeParam(
          _series,
          ParamType.String,
        ),
        'issueCount': serializeParam(
          _issueCount,
          ParamType.int,
        ),
        'singleIssueId': serializeParam(
          _singleIssueId,
          ParamType.String,
        ),
        'isAdult': serializeParam(
          _isAdult,
          ParamType.bool,
        ),
      }.withoutNulls;

  static AutocompleteItemStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AutocompleteItemStruct(
        titleId: deserializeParam(
          data['titleId'],
          ParamType.String,
          false,
        ),
        titleName: deserializeParam(
          data['titleName'],
          ParamType.String,
          false,
        ),
        typeNormalized: deserializeParam(
          data['typeNormalized'],
          ParamType.String,
          false,
        ),
        titleSubtitle: deserializeParam(
          data['titleSubtitle'],
          ParamType.String,
          false,
        ),
        publisherName: deserializeParam(
          data['publisherName'],
          ParamType.String,
          false,
        ),
        titleThumb: deserializeParam(
          data['titleThumb'],
          ParamType.String,
          false,
        ),
        series: deserializeParam(
          data['series'],
          ParamType.String,
          false,
        ),
        issueCount: deserializeParam(
          data['issueCount'],
          ParamType.int,
          false,
        ),
        singleIssueId: deserializeParam(
          data['singleIssueId'],
          ParamType.String,
          false,
        ),
        isAdult: deserializeParam(
          data['isAdult'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'AutocompleteItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AutocompleteItemStruct &&
        titleId == other.titleId &&
        titleName == other.titleName &&
        typeNormalized == other.typeNormalized &&
        titleSubtitle == other.titleSubtitle &&
        publisherName == other.publisherName &&
        titleThumb == other.titleThumb &&
        series == other.series &&
        issueCount == other.issueCount &&
        singleIssueId == other.singleIssueId &&
        isAdult == other.isAdult;
  }

  @override
  int get hashCode => const ListEquality().hash([
        titleId,
        titleName,
        typeNormalized,
        titleSubtitle,
        publisherName,
        titleThumb,
        series,
        issueCount,
        singleIssueId,
        isAdult
      ]);
}

AutocompleteItemStruct createAutocompleteItemStruct({
  String? titleId,
  String? titleName,
  String? typeNormalized,
  String? titleSubtitle,
  String? publisherName,
  String? titleThumb,
  String? series,
  int? issueCount,
  String? singleIssueId,
  bool? isAdult,
}) =>
    AutocompleteItemStruct(
      titleId: titleId,
      titleName: titleName,
      typeNormalized: typeNormalized,
      titleSubtitle: titleSubtitle,
      publisherName: publisherName,
      titleThumb: titleThumb,
      series: series,
      issueCount: issueCount,
      singleIssueId: singleIssueId,
      isAdult: isAdult,
    );
