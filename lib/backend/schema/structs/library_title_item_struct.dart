// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LibraryTitleItemStruct extends BaseStruct {
  LibraryTitleItemStruct({
    String? titleId,
    String? titleName,
    String? titleSubtitle,
    String? series,
    String? typeNormalized,
    String? publisherName,
    int? issueCount,
    String? singleIssueId,
    int? singleIssuePages,
    String? singleSavedIssueId,
    bool? hasOwned,
    bool? hasWanted,
    bool? hasReading,
    bool? hasRead,
    String? licensors,
    String? publicationStatus,
    bool? isAdult,
    String? canonicalKey,
    int? ownedCount,
    int? wantedCount,
    int? readingCount,
    int? readCount,
    String? ownedT1,
    String? ownedT2,
    String? ownedT3,
    String? wantedT1,
    String? wantedT2,
    String? wantedT3,
    String? readingT1,
    String? readingT2,
    String? readingT3,
    String? readT1,
    String? readT2,
    String? readT3,
    String? ownedFirstIssueId,
    String? wantedFirstIssueId,
    String? readingFirstIssueId,
    String? readFirstIssueId,
  })  : _titleId = titleId,
        _titleName = titleName,
        _titleSubtitle = titleSubtitle,
        _series = series,
        _typeNormalized = typeNormalized,
        _publisherName = publisherName,
        _issueCount = issueCount,
        _singleIssueId = singleIssueId,
        _singleIssuePages = singleIssuePages,
        _singleSavedIssueId = singleSavedIssueId,
        _hasOwned = hasOwned,
        _hasWanted = hasWanted,
        _hasReading = hasReading,
        _hasRead = hasRead,
        _licensors = licensors,
        _publicationStatus = publicationStatus,
        _isAdult = isAdult,
        _canonicalKey = canonicalKey,
        _ownedCount = ownedCount,
        _wantedCount = wantedCount,
        _readingCount = readingCount,
        _readCount = readCount,
        _ownedT1 = ownedT1,
        _ownedT2 = ownedT2,
        _ownedT3 = ownedT3,
        _wantedT1 = wantedT1,
        _wantedT2 = wantedT2,
        _wantedT3 = wantedT3,
        _readingT1 = readingT1,
        _readingT2 = readingT2,
        _readingT3 = readingT3,
        _readT1 = readT1,
        _readT2 = readT2,
        _readT3 = readT3,
        _ownedFirstIssueId = ownedFirstIssueId,
        _wantedFirstIssueId = wantedFirstIssueId,
        _readingFirstIssueId = readingFirstIssueId,
        _readFirstIssueId = readFirstIssueId;

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

  // "singleSavedIssueId" field.
  String? _singleSavedIssueId;
  String get singleSavedIssueId => _singleSavedIssueId ?? '';
  set singleSavedIssueId(String? val) => _singleSavedIssueId = val;

  bool hasSingleSavedIssueId() => _singleSavedIssueId != null;

  // "hasOwned" field.
  bool? _hasOwned;
  bool get hasOwned => _hasOwned ?? false;
  set hasOwned(bool? val) => _hasOwned = val;

  bool hasHasOwned() => _hasOwned != null;

  // "hasWanted" field.
  bool? _hasWanted;
  bool get hasWanted => _hasWanted ?? false;
  set hasWanted(bool? val) => _hasWanted = val;

  bool hasHasWanted() => _hasWanted != null;

  // "hasReading" field.
  bool? _hasReading;
  bool get hasReading => _hasReading ?? false;
  set hasReading(bool? val) => _hasReading = val;

  bool hasHasReading() => _hasReading != null;

  // "hasRead" field.
  bool? _hasRead;
  bool get hasRead => _hasRead ?? false;
  set hasRead(bool? val) => _hasRead = val;

  bool hasHasRead() => _hasRead != null;

  // "licensors" field.
  String? _licensors;
  String get licensors => _licensors ?? '';
  set licensors(String? val) => _licensors = val;

  bool hasLicensors() => _licensors != null;

  // "publicationStatus" field.
  String? _publicationStatus;
  String get publicationStatus => _publicationStatus ?? '';
  set publicationStatus(String? val) => _publicationStatus = val;

  bool hasPublicationStatus() => _publicationStatus != null;

  // "isAdult" field.
  bool? _isAdult;
  bool get isAdult => _isAdult ?? false;
  set isAdult(bool? val) => _isAdult = val;

  bool hasIsAdult() => _isAdult != null;

  // "canonicalKey" field.
  String? _canonicalKey;
  String get canonicalKey => _canonicalKey ?? '';
  set canonicalKey(String? val) => _canonicalKey = val;

  bool hasCanonicalKey() => _canonicalKey != null;

  // "ownedCount" field.
  int? _ownedCount;
  int get ownedCount => _ownedCount ?? 0;
  set ownedCount(int? val) => _ownedCount = val;

  void incrementOwnedCount(int amount) => ownedCount = ownedCount + amount;

  bool hasOwnedCount() => _ownedCount != null;

  // "wantedCount" field.
  int? _wantedCount;
  int get wantedCount => _wantedCount ?? 0;
  set wantedCount(int? val) => _wantedCount = val;

  void incrementWantedCount(int amount) => wantedCount = wantedCount + amount;

  bool hasWantedCount() => _wantedCount != null;

  // "readingCount" field.
  int? _readingCount;
  int get readingCount => _readingCount ?? 0;
  set readingCount(int? val) => _readingCount = val;

  void incrementReadingCount(int amount) =>
      readingCount = readingCount + amount;

  bool hasReadingCount() => _readingCount != null;

  // "readCount" field.
  int? _readCount;
  int get readCount => _readCount ?? 0;
  set readCount(int? val) => _readCount = val;

  void incrementReadCount(int amount) => readCount = readCount + amount;

  bool hasReadCount() => _readCount != null;

  // "ownedT1" field.
  String? _ownedT1;
  String get ownedT1 => _ownedT1 ?? '';
  set ownedT1(String? val) => _ownedT1 = val;

  bool hasOwnedT1() => _ownedT1 != null;

  // "ownedT2" field.
  String? _ownedT2;
  String get ownedT2 => _ownedT2 ?? '';
  set ownedT2(String? val) => _ownedT2 = val;

  bool hasOwnedT2() => _ownedT2 != null;

  // "ownedT3" field.
  String? _ownedT3;
  String get ownedT3 => _ownedT3 ?? '';
  set ownedT3(String? val) => _ownedT3 = val;

  bool hasOwnedT3() => _ownedT3 != null;

  // "wantedT1" field.
  String? _wantedT1;
  String get wantedT1 => _wantedT1 ?? '';
  set wantedT1(String? val) => _wantedT1 = val;

  bool hasWantedT1() => _wantedT1 != null;

  // "wantedT2" field.
  String? _wantedT2;
  String get wantedT2 => _wantedT2 ?? '';
  set wantedT2(String? val) => _wantedT2 = val;

  bool hasWantedT2() => _wantedT2 != null;

  // "wantedT3" field.
  String? _wantedT3;
  String get wantedT3 => _wantedT3 ?? '';
  set wantedT3(String? val) => _wantedT3 = val;

  bool hasWantedT3() => _wantedT3 != null;

  // "readingT1" field.
  String? _readingT1;
  String get readingT1 => _readingT1 ?? '';
  set readingT1(String? val) => _readingT1 = val;

  bool hasReadingT1() => _readingT1 != null;

  // "readingT2" field.
  String? _readingT2;
  String get readingT2 => _readingT2 ?? '';
  set readingT2(String? val) => _readingT2 = val;

  bool hasReadingT2() => _readingT2 != null;

  // "readingT3" field.
  String? _readingT3;
  String get readingT3 => _readingT3 ?? '';
  set readingT3(String? val) => _readingT3 = val;

  bool hasReadingT3() => _readingT3 != null;

  // "readT1" field.
  String? _readT1;
  String get readT1 => _readT1 ?? '';
  set readT1(String? val) => _readT1 = val;

  bool hasReadT1() => _readT1 != null;

  // "readT2" field.
  String? _readT2;
  String get readT2 => _readT2 ?? '';
  set readT2(String? val) => _readT2 = val;

  bool hasReadT2() => _readT2 != null;

  // "readT3" field.
  String? _readT3;
  String get readT3 => _readT3 ?? '';
  set readT3(String? val) => _readT3 = val;

  bool hasReadT3() => _readT3 != null;

  // "ownedFirstIssueId" field.
  String? _ownedFirstIssueId;
  String get ownedFirstIssueId => _ownedFirstIssueId ?? '';
  set ownedFirstIssueId(String? val) => _ownedFirstIssueId = val;

  bool hasOwnedFirstIssueId() => _ownedFirstIssueId != null;

  // "wantedFirstIssueId" field.
  String? _wantedFirstIssueId;
  String get wantedFirstIssueId => _wantedFirstIssueId ?? '';
  set wantedFirstIssueId(String? val) => _wantedFirstIssueId = val;

  bool hasWantedFirstIssueId() => _wantedFirstIssueId != null;

  // "readingFirstIssueId" field.
  String? _readingFirstIssueId;
  String get readingFirstIssueId => _readingFirstIssueId ?? '';
  set readingFirstIssueId(String? val) => _readingFirstIssueId = val;

  bool hasReadingFirstIssueId() => _readingFirstIssueId != null;

  // "readFirstIssueId" field.
  String? _readFirstIssueId;
  String get readFirstIssueId => _readFirstIssueId ?? '';
  set readFirstIssueId(String? val) => _readFirstIssueId = val;

  bool hasReadFirstIssueId() => _readFirstIssueId != null;

  static LibraryTitleItemStruct fromMap(Map<String, dynamic> data) =>
      LibraryTitleItemStruct(
        titleId: data['titleId'] as String?,
        titleName: data['titleName'] as String?,
        titleSubtitle: data['titleSubtitle'] as String?,
        series: data['series'] as String?,
        typeNormalized: data['typeNormalized'] as String?,
        publisherName: data['publisherName'] as String?,
        issueCount: castToType<int>(data['issueCount']),
        singleIssueId: data['singleIssueId'] as String?,
        singleIssuePages: castToType<int>(data['singleIssuePages']),
        singleSavedIssueId: data['singleSavedIssueId'] as String?,
        hasOwned: data['hasOwned'] as bool?,
        hasWanted: data['hasWanted'] as bool?,
        hasReading: data['hasReading'] as bool?,
        hasRead: data['hasRead'] as bool?,
        licensors: data['licensors'] as String?,
        publicationStatus: data['publicationStatus'] as String?,
        isAdult: data['isAdult'] as bool?,
        canonicalKey: data['canonicalKey'] as String?,
        ownedCount: castToType<int>(data['ownedCount']),
        wantedCount: castToType<int>(data['wantedCount']),
        readingCount: castToType<int>(data['readingCount']),
        readCount: castToType<int>(data['readCount']),
        ownedT1: data['ownedT1'] as String?,
        ownedT2: data['ownedT2'] as String?,
        ownedT3: data['ownedT3'] as String?,
        wantedT1: data['wantedT1'] as String?,
        wantedT2: data['wantedT2'] as String?,
        wantedT3: data['wantedT3'] as String?,
        readingT1: data['readingT1'] as String?,
        readingT2: data['readingT2'] as String?,
        readingT3: data['readingT3'] as String?,
        readT1: data['readT1'] as String?,
        readT2: data['readT2'] as String?,
        readT3: data['readT3'] as String?,
        ownedFirstIssueId: data['ownedFirstIssueId'] as String?,
        wantedFirstIssueId: data['wantedFirstIssueId'] as String?,
        readingFirstIssueId: data['readingFirstIssueId'] as String?,
        readFirstIssueId: data['readFirstIssueId'] as String?,
      );

  static LibraryTitleItemStruct? maybeFromMap(dynamic data) => data is Map
      ? LibraryTitleItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'titleId': _titleId,
        'titleName': _titleName,
        'titleSubtitle': _titleSubtitle,
        'series': _series,
        'typeNormalized': _typeNormalized,
        'publisherName': _publisherName,
        'issueCount': _issueCount,
        'singleIssueId': _singleIssueId,
        'singleIssuePages': _singleIssuePages,
        'singleSavedIssueId': _singleSavedIssueId,
        'hasOwned': _hasOwned,
        'hasWanted': _hasWanted,
        'hasReading': _hasReading,
        'hasRead': _hasRead,
        'licensors': _licensors,
        'publicationStatus': _publicationStatus,
        'isAdult': _isAdult,
        'canonicalKey': _canonicalKey,
        'ownedCount': _ownedCount,
        'wantedCount': _wantedCount,
        'readingCount': _readingCount,
        'readCount': _readCount,
        'ownedT1': _ownedT1,
        'ownedT2': _ownedT2,
        'ownedT3': _ownedT3,
        'wantedT1': _wantedT1,
        'wantedT2': _wantedT2,
        'wantedT3': _wantedT3,
        'readingT1': _readingT1,
        'readingT2': _readingT2,
        'readingT3': _readingT3,
        'readT1': _readT1,
        'readT2': _readT2,
        'readT3': _readT3,
        'ownedFirstIssueId': _ownedFirstIssueId,
        'wantedFirstIssueId': _wantedFirstIssueId,
        'readingFirstIssueId': _readingFirstIssueId,
        'readFirstIssueId': _readFirstIssueId,
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
        'singleSavedIssueId': serializeParam(
          _singleSavedIssueId,
          ParamType.String,
        ),
        'hasOwned': serializeParam(
          _hasOwned,
          ParamType.bool,
        ),
        'hasWanted': serializeParam(
          _hasWanted,
          ParamType.bool,
        ),
        'hasReading': serializeParam(
          _hasReading,
          ParamType.bool,
        ),
        'hasRead': serializeParam(
          _hasRead,
          ParamType.bool,
        ),
        'licensors': serializeParam(
          _licensors,
          ParamType.String,
        ),
        'publicationStatus': serializeParam(
          _publicationStatus,
          ParamType.String,
        ),
        'isAdult': serializeParam(
          _isAdult,
          ParamType.bool,
        ),
        'canonicalKey': serializeParam(
          _canonicalKey,
          ParamType.String,
        ),
        'ownedCount': serializeParam(
          _ownedCount,
          ParamType.int,
        ),
        'wantedCount': serializeParam(
          _wantedCount,
          ParamType.int,
        ),
        'readingCount': serializeParam(
          _readingCount,
          ParamType.int,
        ),
        'readCount': serializeParam(
          _readCount,
          ParamType.int,
        ),
        'ownedT1': serializeParam(
          _ownedT1,
          ParamType.String,
        ),
        'ownedT2': serializeParam(
          _ownedT2,
          ParamType.String,
        ),
        'ownedT3': serializeParam(
          _ownedT3,
          ParamType.String,
        ),
        'wantedT1': serializeParam(
          _wantedT1,
          ParamType.String,
        ),
        'wantedT2': serializeParam(
          _wantedT2,
          ParamType.String,
        ),
        'wantedT3': serializeParam(
          _wantedT3,
          ParamType.String,
        ),
        'readingT1': serializeParam(
          _readingT1,
          ParamType.String,
        ),
        'readingT2': serializeParam(
          _readingT2,
          ParamType.String,
        ),
        'readingT3': serializeParam(
          _readingT3,
          ParamType.String,
        ),
        'readT1': serializeParam(
          _readT1,
          ParamType.String,
        ),
        'readT2': serializeParam(
          _readT2,
          ParamType.String,
        ),
        'readT3': serializeParam(
          _readT3,
          ParamType.String,
        ),
        'ownedFirstIssueId': serializeParam(
          _ownedFirstIssueId,
          ParamType.String,
        ),
        'wantedFirstIssueId': serializeParam(
          _wantedFirstIssueId,
          ParamType.String,
        ),
        'readingFirstIssueId': serializeParam(
          _readingFirstIssueId,
          ParamType.String,
        ),
        'readFirstIssueId': serializeParam(
          _readFirstIssueId,
          ParamType.String,
        ),
      }.withoutNulls;

  static LibraryTitleItemStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LibraryTitleItemStruct(
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
        singleSavedIssueId: deserializeParam(
          data['singleSavedIssueId'],
          ParamType.String,
          false,
        ),
        hasOwned: deserializeParam(
          data['hasOwned'],
          ParamType.bool,
          false,
        ),
        hasWanted: deserializeParam(
          data['hasWanted'],
          ParamType.bool,
          false,
        ),
        hasReading: deserializeParam(
          data['hasReading'],
          ParamType.bool,
          false,
        ),
        hasRead: deserializeParam(
          data['hasRead'],
          ParamType.bool,
          false,
        ),
        licensors: deserializeParam(
          data['licensors'],
          ParamType.String,
          false,
        ),
        publicationStatus: deserializeParam(
          data['publicationStatus'],
          ParamType.String,
          false,
        ),
        isAdult: deserializeParam(
          data['isAdult'],
          ParamType.bool,
          false,
        ),
        canonicalKey: deserializeParam(
          data['canonicalKey'],
          ParamType.String,
          false,
        ),
        ownedCount: deserializeParam(
          data['ownedCount'],
          ParamType.int,
          false,
        ),
        wantedCount: deserializeParam(
          data['wantedCount'],
          ParamType.int,
          false,
        ),
        readingCount: deserializeParam(
          data['readingCount'],
          ParamType.int,
          false,
        ),
        readCount: deserializeParam(
          data['readCount'],
          ParamType.int,
          false,
        ),
        ownedT1: deserializeParam(
          data['ownedT1'],
          ParamType.String,
          false,
        ),
        ownedT2: deserializeParam(
          data['ownedT2'],
          ParamType.String,
          false,
        ),
        ownedT3: deserializeParam(
          data['ownedT3'],
          ParamType.String,
          false,
        ),
        wantedT1: deserializeParam(
          data['wantedT1'],
          ParamType.String,
          false,
        ),
        wantedT2: deserializeParam(
          data['wantedT2'],
          ParamType.String,
          false,
        ),
        wantedT3: deserializeParam(
          data['wantedT3'],
          ParamType.String,
          false,
        ),
        readingT1: deserializeParam(
          data['readingT1'],
          ParamType.String,
          false,
        ),
        readingT2: deserializeParam(
          data['readingT2'],
          ParamType.String,
          false,
        ),
        readingT3: deserializeParam(
          data['readingT3'],
          ParamType.String,
          false,
        ),
        readT1: deserializeParam(
          data['readT1'],
          ParamType.String,
          false,
        ),
        readT2: deserializeParam(
          data['readT2'],
          ParamType.String,
          false,
        ),
        readT3: deserializeParam(
          data['readT3'],
          ParamType.String,
          false,
        ),
        ownedFirstIssueId: deserializeParam(
          data['ownedFirstIssueId'],
          ParamType.String,
          false,
        ),
        wantedFirstIssueId: deserializeParam(
          data['wantedFirstIssueId'],
          ParamType.String,
          false,
        ),
        readingFirstIssueId: deserializeParam(
          data['readingFirstIssueId'],
          ParamType.String,
          false,
        ),
        readFirstIssueId: deserializeParam(
          data['readFirstIssueId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LibraryTitleItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LibraryTitleItemStruct &&
        titleId == other.titleId &&
        titleName == other.titleName &&
        titleSubtitle == other.titleSubtitle &&
        series == other.series &&
        typeNormalized == other.typeNormalized &&
        publisherName == other.publisherName &&
        issueCount == other.issueCount &&
        singleIssueId == other.singleIssueId &&
        singleIssuePages == other.singleIssuePages &&
        singleSavedIssueId == other.singleSavedIssueId &&
        hasOwned == other.hasOwned &&
        hasWanted == other.hasWanted &&
        hasReading == other.hasReading &&
        hasRead == other.hasRead &&
        licensors == other.licensors &&
        publicationStatus == other.publicationStatus &&
        isAdult == other.isAdult &&
        canonicalKey == other.canonicalKey &&
        ownedCount == other.ownedCount &&
        wantedCount == other.wantedCount &&
        readingCount == other.readingCount &&
        readCount == other.readCount &&
        ownedT1 == other.ownedT1 &&
        ownedT2 == other.ownedT2 &&
        ownedT3 == other.ownedT3 &&
        wantedT1 == other.wantedT1 &&
        wantedT2 == other.wantedT2 &&
        wantedT3 == other.wantedT3 &&
        readingT1 == other.readingT1 &&
        readingT2 == other.readingT2 &&
        readingT3 == other.readingT3 &&
        readT1 == other.readT1 &&
        readT2 == other.readT2 &&
        readT3 == other.readT3 &&
        ownedFirstIssueId == other.ownedFirstIssueId &&
        wantedFirstIssueId == other.wantedFirstIssueId &&
        readingFirstIssueId == other.readingFirstIssueId &&
        readFirstIssueId == other.readFirstIssueId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        titleId,
        titleName,
        titleSubtitle,
        series,
        typeNormalized,
        publisherName,
        issueCount,
        singleIssueId,
        singleIssuePages,
        singleSavedIssueId,
        hasOwned,
        hasWanted,
        hasReading,
        hasRead,
        licensors,
        publicationStatus,
        isAdult,
        canonicalKey,
        ownedCount,
        wantedCount,
        readingCount,
        readCount,
        ownedT1,
        ownedT2,
        ownedT3,
        wantedT1,
        wantedT2,
        wantedT3,
        readingT1,
        readingT2,
        readingT3,
        readT1,
        readT2,
        readT3,
        ownedFirstIssueId,
        wantedFirstIssueId,
        readingFirstIssueId,
        readFirstIssueId
      ]);
}

LibraryTitleItemStruct createLibraryTitleItemStruct({
  String? titleId,
  String? titleName,
  String? titleSubtitle,
  String? series,
  String? typeNormalized,
  String? publisherName,
  int? issueCount,
  String? singleIssueId,
  int? singleIssuePages,
  String? singleSavedIssueId,
  bool? hasOwned,
  bool? hasWanted,
  bool? hasReading,
  bool? hasRead,
  String? licensors,
  String? publicationStatus,
  bool? isAdult,
  String? canonicalKey,
  int? ownedCount,
  int? wantedCount,
  int? readingCount,
  int? readCount,
  String? ownedT1,
  String? ownedT2,
  String? ownedT3,
  String? wantedT1,
  String? wantedT2,
  String? wantedT3,
  String? readingT1,
  String? readingT2,
  String? readingT3,
  String? readT1,
  String? readT2,
  String? readT3,
  String? ownedFirstIssueId,
  String? wantedFirstIssueId,
  String? readingFirstIssueId,
  String? readFirstIssueId,
}) =>
    LibraryTitleItemStruct(
      titleId: titleId,
      titleName: titleName,
      titleSubtitle: titleSubtitle,
      series: series,
      typeNormalized: typeNormalized,
      publisherName: publisherName,
      issueCount: issueCount,
      singleIssueId: singleIssueId,
      singleIssuePages: singleIssuePages,
      singleSavedIssueId: singleSavedIssueId,
      hasOwned: hasOwned,
      hasWanted: hasWanted,
      hasReading: hasReading,
      hasRead: hasRead,
      licensors: licensors,
      publicationStatus: publicationStatus,
      isAdult: isAdult,
      canonicalKey: canonicalKey,
      ownedCount: ownedCount,
      wantedCount: wantedCount,
      readingCount: readingCount,
      readCount: readCount,
      ownedT1: ownedT1,
      ownedT2: ownedT2,
      ownedT3: ownedT3,
      wantedT1: wantedT1,
      wantedT2: wantedT2,
      wantedT3: wantedT3,
      readingT1: readingT1,
      readingT2: readingT2,
      readingT3: readingT3,
      readT1: readT1,
      readT2: readT2,
      readT3: readT3,
      ownedFirstIssueId: ownedFirstIssueId,
      wantedFirstIssueId: wantedFirstIssueId,
      readingFirstIssueId: readingFirstIssueId,
      readFirstIssueId: readFirstIssueId,
    );
