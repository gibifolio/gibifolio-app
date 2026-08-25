// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListEditItemStruct extends BaseStruct {
  ListEditItemStruct({
    String? entityType,
    String? entityId,
    String? thumbLocalPath,
    String? preTitle,
    String? titleName,
    String? titleSubtitle,
    String? publisherName,
    String? licensors,
    String? issueNumber,
    String? issueName,
    String? issueSubtitle,
    String? formatLabel,
    bool? isAdult,
    int? issueCount,
    String? series,
    int? issuePages,
    String? typeNormalized,
  })  : _entityType = entityType,
        _entityId = entityId,
        _thumbLocalPath = thumbLocalPath,
        _preTitle = preTitle,
        _titleName = titleName,
        _titleSubtitle = titleSubtitle,
        _publisherName = publisherName,
        _licensors = licensors,
        _issueNumber = issueNumber,
        _issueName = issueName,
        _issueSubtitle = issueSubtitle,
        _formatLabel = formatLabel,
        _isAdult = isAdult,
        _issueCount = issueCount,
        _series = series,
        _issuePages = issuePages,
        _typeNormalized = typeNormalized;

  // "entityType" field.
  String? _entityType;
  String get entityType => _entityType ?? '';
  set entityType(String? val) => _entityType = val;

  bool hasEntityType() => _entityType != null;

  // "entityId" field.
  String? _entityId;
  String get entityId => _entityId ?? '';
  set entityId(String? val) => _entityId = val;

  bool hasEntityId() => _entityId != null;

  // "thumbLocalPath" field.
  String? _thumbLocalPath;
  String get thumbLocalPath => _thumbLocalPath ?? '';
  set thumbLocalPath(String? val) => _thumbLocalPath = val;

  bool hasThumbLocalPath() => _thumbLocalPath != null;

  // "preTitle" field.
  String? _preTitle;
  String get preTitle => _preTitle ?? '';
  set preTitle(String? val) => _preTitle = val;

  bool hasPreTitle() => _preTitle != null;

  // "titleName" field.
  String? _titleName;
  String get titleName => _titleName ?? '';
  set titleName(String? val) => _titleName = val;

  bool hasTitleName() => _titleName != null;

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

  // "licensors" field.
  String? _licensors;
  String get licensors => _licensors ?? '';
  set licensors(String? val) => _licensors = val;

  bool hasLicensors() => _licensors != null;

  // "issueNumber" field.
  String? _issueNumber;
  String get issueNumber => _issueNumber ?? '';
  set issueNumber(String? val) => _issueNumber = val;

  bool hasIssueNumber() => _issueNumber != null;

  // "issueName" field.
  String? _issueName;
  String get issueName => _issueName ?? '';
  set issueName(String? val) => _issueName = val;

  bool hasIssueName() => _issueName != null;

  // "issueSubtitle" field.
  String? _issueSubtitle;
  String get issueSubtitle => _issueSubtitle ?? '';
  set issueSubtitle(String? val) => _issueSubtitle = val;

  bool hasIssueSubtitle() => _issueSubtitle != null;

  // "formatLabel" field.
  String? _formatLabel;
  String get formatLabel => _formatLabel ?? '';
  set formatLabel(String? val) => _formatLabel = val;

  bool hasFormatLabel() => _formatLabel != null;

  // "isAdult" field.
  bool? _isAdult;
  bool get isAdult => _isAdult ?? false;
  set isAdult(bool? val) => _isAdult = val;

  bool hasIsAdult() => _isAdult != null;

  // "issueCount" field.
  int? _issueCount;
  int get issueCount => _issueCount ?? 0;
  set issueCount(int? val) => _issueCount = val;

  void incrementIssueCount(int amount) => issueCount = issueCount + amount;

  bool hasIssueCount() => _issueCount != null;

  // "series" field.
  String? _series;
  String get series => _series ?? '';
  set series(String? val) => _series = val;

  bool hasSeries() => _series != null;

  // "issuePages" field.
  int? _issuePages;
  int get issuePages => _issuePages ?? 0;
  set issuePages(int? val) => _issuePages = val;

  void incrementIssuePages(int amount) => issuePages = issuePages + amount;

  bool hasIssuePages() => _issuePages != null;

  // "typeNormalized" field.
  String? _typeNormalized;
  String get typeNormalized => _typeNormalized ?? '';
  set typeNormalized(String? val) => _typeNormalized = val;

  bool hasTypeNormalized() => _typeNormalized != null;

  static ListEditItemStruct fromMap(Map<String, dynamic> data) =>
      ListEditItemStruct(
        entityType: data['entityType'] as String?,
        entityId: data['entityId'] as String?,
        thumbLocalPath: data['thumbLocalPath'] as String?,
        preTitle: data['preTitle'] as String?,
        titleName: data['titleName'] as String?,
        titleSubtitle: data['titleSubtitle'] as String?,
        publisherName: data['publisherName'] as String?,
        licensors: data['licensors'] as String?,
        issueNumber: data['issueNumber'] as String?,
        issueName: data['issueName'] as String?,
        issueSubtitle: data['issueSubtitle'] as String?,
        formatLabel: data['formatLabel'] as String?,
        isAdult: data['isAdult'] as bool?,
        issueCount: castToType<int>(data['issueCount']),
        series: data['series'] as String?,
        issuePages: castToType<int>(data['issuePages']),
        typeNormalized: data['typeNormalized'] as String?,
      );

  static ListEditItemStruct? maybeFromMap(dynamic data) => data is Map
      ? ListEditItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'entityType': _entityType,
        'entityId': _entityId,
        'thumbLocalPath': _thumbLocalPath,
        'preTitle': _preTitle,
        'titleName': _titleName,
        'titleSubtitle': _titleSubtitle,
        'publisherName': _publisherName,
        'licensors': _licensors,
        'issueNumber': _issueNumber,
        'issueName': _issueName,
        'issueSubtitle': _issueSubtitle,
        'formatLabel': _formatLabel,
        'isAdult': _isAdult,
        'issueCount': _issueCount,
        'series': _series,
        'issuePages': _issuePages,
        'typeNormalized': _typeNormalized,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'entityType': serializeParam(
          _entityType,
          ParamType.String,
        ),
        'entityId': serializeParam(
          _entityId,
          ParamType.String,
        ),
        'thumbLocalPath': serializeParam(
          _thumbLocalPath,
          ParamType.String,
        ),
        'preTitle': serializeParam(
          _preTitle,
          ParamType.String,
        ),
        'titleName': serializeParam(
          _titleName,
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
        'licensors': serializeParam(
          _licensors,
          ParamType.String,
        ),
        'issueNumber': serializeParam(
          _issueNumber,
          ParamType.String,
        ),
        'issueName': serializeParam(
          _issueName,
          ParamType.String,
        ),
        'issueSubtitle': serializeParam(
          _issueSubtitle,
          ParamType.String,
        ),
        'formatLabel': serializeParam(
          _formatLabel,
          ParamType.String,
        ),
        'isAdult': serializeParam(
          _isAdult,
          ParamType.bool,
        ),
        'issueCount': serializeParam(
          _issueCount,
          ParamType.int,
        ),
        'series': serializeParam(
          _series,
          ParamType.String,
        ),
        'issuePages': serializeParam(
          _issuePages,
          ParamType.int,
        ),
        'typeNormalized': serializeParam(
          _typeNormalized,
          ParamType.String,
        ),
      }.withoutNulls;

  static ListEditItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ListEditItemStruct(
        entityType: deserializeParam(
          data['entityType'],
          ParamType.String,
          false,
        ),
        entityId: deserializeParam(
          data['entityId'],
          ParamType.String,
          false,
        ),
        thumbLocalPath: deserializeParam(
          data['thumbLocalPath'],
          ParamType.String,
          false,
        ),
        preTitle: deserializeParam(
          data['preTitle'],
          ParamType.String,
          false,
        ),
        titleName: deserializeParam(
          data['titleName'],
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
        licensors: deserializeParam(
          data['licensors'],
          ParamType.String,
          false,
        ),
        issueNumber: deserializeParam(
          data['issueNumber'],
          ParamType.String,
          false,
        ),
        issueName: deserializeParam(
          data['issueName'],
          ParamType.String,
          false,
        ),
        issueSubtitle: deserializeParam(
          data['issueSubtitle'],
          ParamType.String,
          false,
        ),
        formatLabel: deserializeParam(
          data['formatLabel'],
          ParamType.String,
          false,
        ),
        isAdult: deserializeParam(
          data['isAdult'],
          ParamType.bool,
          false,
        ),
        issueCount: deserializeParam(
          data['issueCount'],
          ParamType.int,
          false,
        ),
        series: deserializeParam(
          data['series'],
          ParamType.String,
          false,
        ),
        issuePages: deserializeParam(
          data['issuePages'],
          ParamType.int,
          false,
        ),
        typeNormalized: deserializeParam(
          data['typeNormalized'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ListEditItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ListEditItemStruct &&
        entityType == other.entityType &&
        entityId == other.entityId &&
        thumbLocalPath == other.thumbLocalPath &&
        preTitle == other.preTitle &&
        titleName == other.titleName &&
        titleSubtitle == other.titleSubtitle &&
        publisherName == other.publisherName &&
        licensors == other.licensors &&
        issueNumber == other.issueNumber &&
        issueName == other.issueName &&
        issueSubtitle == other.issueSubtitle &&
        formatLabel == other.formatLabel &&
        isAdult == other.isAdult &&
        issueCount == other.issueCount &&
        series == other.series &&
        issuePages == other.issuePages &&
        typeNormalized == other.typeNormalized;
  }

  @override
  int get hashCode => const ListEquality().hash([
        entityType,
        entityId,
        thumbLocalPath,
        preTitle,
        titleName,
        titleSubtitle,
        publisherName,
        licensors,
        issueNumber,
        issueName,
        issueSubtitle,
        formatLabel,
        isAdult,
        issueCount,
        series,
        issuePages,
        typeNormalized
      ]);
}

ListEditItemStruct createListEditItemStruct({
  String? entityType,
  String? entityId,
  String? thumbLocalPath,
  String? preTitle,
  String? titleName,
  String? titleSubtitle,
  String? publisherName,
  String? licensors,
  String? issueNumber,
  String? issueName,
  String? issueSubtitle,
  String? formatLabel,
  bool? isAdult,
  int? issueCount,
  String? series,
  int? issuePages,
  String? typeNormalized,
}) =>
    ListEditItemStruct(
      entityType: entityType,
      entityId: entityId,
      thumbLocalPath: thumbLocalPath,
      preTitle: preTitle,
      titleName: titleName,
      titleSubtitle: titleSubtitle,
      publisherName: publisherName,
      licensors: licensors,
      issueNumber: issueNumber,
      issueName: issueName,
      issueSubtitle: issueSubtitle,
      formatLabel: formatLabel,
      isAdult: isAdult,
      issueCount: issueCount,
      series: series,
      issuePages: issuePages,
      typeNormalized: typeNormalized,
    );
