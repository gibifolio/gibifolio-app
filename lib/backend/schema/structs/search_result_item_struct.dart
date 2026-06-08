// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchResultItemStruct extends BaseStruct {
  SearchResultItemStruct({
    String? titleId,
    String? titleName,
    String? titleSubtitle,
    String? series,
    String? typeNormalized,
    String? publisherName,
    String? licensors,
    int? issueCount,
    String? singleIssueId,
    int? singleIssuePages,
    String? publicationStatus,
    String? titleThumb,
    String? firstIssueThumb,
    String? secondIssueThumb,
    String? thirdIssueThumb,
    String? readingAggregate,
    String? ownershipAggregate,
    bool? isAdult,
  })  : _titleId = titleId,
        _titleName = titleName,
        _titleSubtitle = titleSubtitle,
        _series = series,
        _typeNormalized = typeNormalized,
        _publisherName = publisherName,
        _licensors = licensors,
        _issueCount = issueCount,
        _singleIssueId = singleIssueId,
        _singleIssuePages = singleIssuePages,
        _publicationStatus = publicationStatus,
        _titleThumb = titleThumb,
        _firstIssueThumb = firstIssueThumb,
        _secondIssueThumb = secondIssueThumb,
        _thirdIssueThumb = thirdIssueThumb,
        _readingAggregate = readingAggregate,
        _ownershipAggregate = ownershipAggregate,
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

  // "titleSubtitle" field.
  String? _titleSubtitle;
  String get titleSubtitle => _titleSubtitle ?? '';
  set titleSubtitle(String? val) => _titleSubtitle = val;

  bool hasTitleSubtitle() => _titleSubtitle != null;

  // "series" field.
  String? _series;
  String get series => _series ?? '';
  set series(String? val) => _series = val;

  bool hasSeries() => _series != null;

  // "typeNormalized" field.
  String? _typeNormalized;
  String get typeNormalized => _typeNormalized ?? '';
  set typeNormalized(String? val) => _typeNormalized = val;

  bool hasTypeNormalized() => _typeNormalized != null;

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

  // "singleIssuePages" field.
  int? _singleIssuePages;
  int get singleIssuePages => _singleIssuePages ?? 0;
  set singleIssuePages(int? val) => _singleIssuePages = val;

  void incrementSingleIssuePages(int amount) =>
      singleIssuePages = singleIssuePages + amount;

  bool hasSingleIssuePages() => _singleIssuePages != null;

  // "publicationStatus" field.
  String? _publicationStatus;
  String get publicationStatus => _publicationStatus ?? '';
  set publicationStatus(String? val) => _publicationStatus = val;

  bool hasPublicationStatus() => _publicationStatus != null;

  // "titleThumb" field.
  String? _titleThumb;
  String get titleThumb => _titleThumb ?? '';
  set titleThumb(String? val) => _titleThumb = val;

  bool hasTitleThumb() => _titleThumb != null;

  // "firstIssueThumb" field.
  String? _firstIssueThumb;
  String get firstIssueThumb => _firstIssueThumb ?? '';
  set firstIssueThumb(String? val) => _firstIssueThumb = val;

  bool hasFirstIssueThumb() => _firstIssueThumb != null;

  // "secondIssueThumb" field.
  String? _secondIssueThumb;
  String get secondIssueThumb => _secondIssueThumb ?? '';
  set secondIssueThumb(String? val) => _secondIssueThumb = val;

  bool hasSecondIssueThumb() => _secondIssueThumb != null;

  // "thirdIssueThumb" field.
  String? _thirdIssueThumb;
  String get thirdIssueThumb => _thirdIssueThumb ?? '';
  set thirdIssueThumb(String? val) => _thirdIssueThumb = val;

  bool hasThirdIssueThumb() => _thirdIssueThumb != null;

  // "readingAggregate" field.
  String? _readingAggregate;
  String get readingAggregate => _readingAggregate ?? '';
  set readingAggregate(String? val) => _readingAggregate = val;

  bool hasReadingAggregate() => _readingAggregate != null;

  // "ownershipAggregate" field.
  String? _ownershipAggregate;
  String get ownershipAggregate => _ownershipAggregate ?? '';
  set ownershipAggregate(String? val) => _ownershipAggregate = val;

  bool hasOwnershipAggregate() => _ownershipAggregate != null;

  // "isAdult" field.
  bool? _isAdult;
  bool get isAdult => _isAdult ?? false;
  set isAdult(bool? val) => _isAdult = val;

  bool hasIsAdult() => _isAdult != null;

  static SearchResultItemStruct fromMap(Map<String, dynamic> data) =>
      SearchResultItemStruct(
        titleId: data['titleId'] as String?,
        titleName: data['titleName'] as String?,
        titleSubtitle: data['titleSubtitle'] as String?,
        series: data['series'] as String?,
        typeNormalized: data['typeNormalized'] as String?,
        publisherName: data['publisherName'] as String?,
        licensors: data['licensors'] as String?,
        issueCount: castToType<int>(data['issueCount']),
        singleIssueId: data['singleIssueId'] as String?,
        singleIssuePages: castToType<int>(data['singleIssuePages']),
        publicationStatus: data['publicationStatus'] as String?,
        titleThumb: data['titleThumb'] as String?,
        firstIssueThumb: data['firstIssueThumb'] as String?,
        secondIssueThumb: data['secondIssueThumb'] as String?,
        thirdIssueThumb: data['thirdIssueThumb'] as String?,
        readingAggregate: data['readingAggregate'] as String?,
        ownershipAggregate: data['ownershipAggregate'] as String?,
        isAdult: data['isAdult'] as bool?,
      );

  static SearchResultItemStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchResultItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'titleId': _titleId,
        'titleName': _titleName,
        'titleSubtitle': _titleSubtitle,
        'series': _series,
        'typeNormalized': _typeNormalized,
        'publisherName': _publisherName,
        'licensors': _licensors,
        'issueCount': _issueCount,
        'singleIssueId': _singleIssueId,
        'singleIssuePages': _singleIssuePages,
        'publicationStatus': _publicationStatus,
        'titleThumb': _titleThumb,
        'firstIssueThumb': _firstIssueThumb,
        'secondIssueThumb': _secondIssueThumb,
        'thirdIssueThumb': _thirdIssueThumb,
        'readingAggregate': _readingAggregate,
        'ownershipAggregate': _ownershipAggregate,
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
        'titleSubtitle': serializeParam(
          _titleSubtitle,
          ParamType.String,
        ),
        'series': serializeParam(
          _series,
          ParamType.String,
        ),
        'typeNormalized': serializeParam(
          _typeNormalized,
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
        'issueCount': serializeParam(
          _issueCount,
          ParamType.int,
        ),
        'singleIssueId': serializeParam(
          _singleIssueId,
          ParamType.String,
        ),
        'singleIssuePages': serializeParam(
          _singleIssuePages,
          ParamType.int,
        ),
        'publicationStatus': serializeParam(
          _publicationStatus,
          ParamType.String,
        ),
        'titleThumb': serializeParam(
          _titleThumb,
          ParamType.String,
        ),
        'firstIssueThumb': serializeParam(
          _firstIssueThumb,
          ParamType.String,
        ),
        'secondIssueThumb': serializeParam(
          _secondIssueThumb,
          ParamType.String,
        ),
        'thirdIssueThumb': serializeParam(
          _thirdIssueThumb,
          ParamType.String,
        ),
        'readingAggregate': serializeParam(
          _readingAggregate,
          ParamType.String,
        ),
        'ownershipAggregate': serializeParam(
          _ownershipAggregate,
          ParamType.String,
        ),
        'isAdult': serializeParam(
          _isAdult,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SearchResultItemStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SearchResultItemStruct(
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
        titleSubtitle: deserializeParam(
          data['titleSubtitle'],
          ParamType.String,
          false,
        ),
        series: deserializeParam(
          data['series'],
          ParamType.String,
          false,
        ),
        typeNormalized: deserializeParam(
          data['typeNormalized'],
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
        singleIssuePages: deserializeParam(
          data['singleIssuePages'],
          ParamType.int,
          false,
        ),
        publicationStatus: deserializeParam(
          data['publicationStatus'],
          ParamType.String,
          false,
        ),
        titleThumb: deserializeParam(
          data['titleThumb'],
          ParamType.String,
          false,
        ),
        firstIssueThumb: deserializeParam(
          data['firstIssueThumb'],
          ParamType.String,
          false,
        ),
        secondIssueThumb: deserializeParam(
          data['secondIssueThumb'],
          ParamType.String,
          false,
        ),
        thirdIssueThumb: deserializeParam(
          data['thirdIssueThumb'],
          ParamType.String,
          false,
        ),
        readingAggregate: deserializeParam(
          data['readingAggregate'],
          ParamType.String,
          false,
        ),
        ownershipAggregate: deserializeParam(
          data['ownershipAggregate'],
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
  String toString() => 'SearchResultItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchResultItemStruct &&
        titleId == other.titleId &&
        titleName == other.titleName &&
        titleSubtitle == other.titleSubtitle &&
        series == other.series &&
        typeNormalized == other.typeNormalized &&
        publisherName == other.publisherName &&
        licensors == other.licensors &&
        issueCount == other.issueCount &&
        singleIssueId == other.singleIssueId &&
        singleIssuePages == other.singleIssuePages &&
        publicationStatus == other.publicationStatus &&
        titleThumb == other.titleThumb &&
        firstIssueThumb == other.firstIssueThumb &&
        secondIssueThumb == other.secondIssueThumb &&
        thirdIssueThumb == other.thirdIssueThumb &&
        readingAggregate == other.readingAggregate &&
        ownershipAggregate == other.ownershipAggregate &&
        isAdult == other.isAdult;
  }

  @override
  int get hashCode => const ListEquality().hash([
        titleId,
        titleName,
        titleSubtitle,
        series,
        typeNormalized,
        publisherName,
        licensors,
        issueCount,
        singleIssueId,
        singleIssuePages,
        publicationStatus,
        titleThumb,
        firstIssueThumb,
        secondIssueThumb,
        thirdIssueThumb,
        readingAggregate,
        ownershipAggregate,
        isAdult
      ]);
}

SearchResultItemStruct createSearchResultItemStruct({
  String? titleId,
  String? titleName,
  String? titleSubtitle,
  String? series,
  String? typeNormalized,
  String? publisherName,
  String? licensors,
  int? issueCount,
  String? singleIssueId,
  int? singleIssuePages,
  String? publicationStatus,
  String? titleThumb,
  String? firstIssueThumb,
  String? secondIssueThumb,
  String? thirdIssueThumb,
  String? readingAggregate,
  String? ownershipAggregate,
  bool? isAdult,
}) =>
    SearchResultItemStruct(
      titleId: titleId,
      titleName: titleName,
      titleSubtitle: titleSubtitle,
      series: series,
      typeNormalized: typeNormalized,
      publisherName: publisherName,
      licensors: licensors,
      issueCount: issueCount,
      singleIssueId: singleIssueId,
      singleIssuePages: singleIssuePages,
      publicationStatus: publicationStatus,
      titleThumb: titleThumb,
      firstIssueThumb: firstIssueThumb,
      secondIssueThumb: secondIssueThumb,
      thirdIssueThumb: thirdIssueThumb,
      readingAggregate: readingAggregate,
      ownershipAggregate: ownershipAggregate,
      isAdult: isAdult,
    );
