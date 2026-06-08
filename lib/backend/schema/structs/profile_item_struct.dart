// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileItemStruct extends BaseStruct {
  ProfileItemStruct({
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
    String? thumb1,
    String? thumb2,
    String? thumb3,
    String? ownedFirstIssueId,
    String? wantedFirstIssueId,
    String? readingFirstIssueId,
    String? readFirstIssueId,
    String? itemType,
    String? listId,
    String? listName,
    String? listDescription,
    bool? listIsPublic,
    int? listItemCount,
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
        _thumb1 = thumb1,
        _thumb2 = thumb2,
        _thumb3 = thumb3,
        _ownedFirstIssueId = ownedFirstIssueId,
        _wantedFirstIssueId = wantedFirstIssueId,
        _readingFirstIssueId = readingFirstIssueId,
        _readFirstIssueId = readFirstIssueId,
        _itemType = itemType,
        _listId = listId,
        _listName = listName,
        _listDescription = listDescription,
        _listIsPublic = listIsPublic,
        _listItemCount = listItemCount;

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

  // "thumb1" field.
  String? _thumb1;
  String get thumb1 => _thumb1 ?? '';
  set thumb1(String? val) => _thumb1 = val;

  bool hasThumb1() => _thumb1 != null;

  // "thumb2" field.
  String? _thumb2;
  String get thumb2 => _thumb2 ?? '';
  set thumb2(String? val) => _thumb2 = val;

  bool hasThumb2() => _thumb2 != null;

  // "thumb3" field.
  String? _thumb3;
  String get thumb3 => _thumb3 ?? '';
  set thumb3(String? val) => _thumb3 = val;

  bool hasThumb3() => _thumb3 != null;

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

  // "itemType" field.
  String? _itemType;
  String get itemType => _itemType ?? '';
  set itemType(String? val) => _itemType = val;

  bool hasItemType() => _itemType != null;

  // "listId" field.
  String? _listId;
  String get listId => _listId ?? '';
  set listId(String? val) => _listId = val;

  bool hasListId() => _listId != null;

  // "listName" field.
  String? _listName;
  String get listName => _listName ?? '';
  set listName(String? val) => _listName = val;

  bool hasListName() => _listName != null;

  // "listDescription" field.
  String? _listDescription;
  String get listDescription => _listDescription ?? '';
  set listDescription(String? val) => _listDescription = val;

  bool hasListDescription() => _listDescription != null;

  // "listIsPublic" field.
  bool? _listIsPublic;
  bool get listIsPublic => _listIsPublic ?? false;
  set listIsPublic(bool? val) => _listIsPublic = val;

  bool hasListIsPublic() => _listIsPublic != null;

  // "listItemCount" field.
  int? _listItemCount;
  int get listItemCount => _listItemCount ?? 0;
  set listItemCount(int? val) => _listItemCount = val;

  void incrementListItemCount(int amount) =>
      listItemCount = listItemCount + amount;

  bool hasListItemCount() => _listItemCount != null;

  static ProfileItemStruct fromMap(Map<String, dynamic> data) =>
      ProfileItemStruct(
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
        thumb1: data['thumb1'] as String?,
        thumb2: data['thumb2'] as String?,
        thumb3: data['thumb3'] as String?,
        ownedFirstIssueId: data['ownedFirstIssueId'] as String?,
        wantedFirstIssueId: data['wantedFirstIssueId'] as String?,
        readingFirstIssueId: data['readingFirstIssueId'] as String?,
        readFirstIssueId: data['readFirstIssueId'] as String?,
        itemType: data['itemType'] as String?,
        listId: data['listId'] as String?,
        listName: data['listName'] as String?,
        listDescription: data['listDescription'] as String?,
        listIsPublic: data['listIsPublic'] as bool?,
        listItemCount: castToType<int>(data['listItemCount']),
      );

  static ProfileItemStruct? maybeFromMap(dynamic data) => data is Map
      ? ProfileItemStruct.fromMap(data.cast<String, dynamic>())
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
        'thumb1': _thumb1,
        'thumb2': _thumb2,
        'thumb3': _thumb3,
        'ownedFirstIssueId': _ownedFirstIssueId,
        'wantedFirstIssueId': _wantedFirstIssueId,
        'readingFirstIssueId': _readingFirstIssueId,
        'readFirstIssueId': _readFirstIssueId,
        'itemType': _itemType,
        'listId': _listId,
        'listName': _listName,
        'listDescription': _listDescription,
        'listIsPublic': _listIsPublic,
        'listItemCount': _listItemCount,
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
        'thumb1': serializeParam(
          _thumb1,
          ParamType.String,
        ),
        'thumb2': serializeParam(
          _thumb2,
          ParamType.String,
        ),
        'thumb3': serializeParam(
          _thumb3,
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
        'itemType': serializeParam(
          _itemType,
          ParamType.String,
        ),
        'listId': serializeParam(
          _listId,
          ParamType.String,
        ),
        'listName': serializeParam(
          _listName,
          ParamType.String,
        ),
        'listDescription': serializeParam(
          _listDescription,
          ParamType.String,
        ),
        'listIsPublic': serializeParam(
          _listIsPublic,
          ParamType.bool,
        ),
        'listItemCount': serializeParam(
          _listItemCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProfileItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProfileItemStruct(
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
        thumb1: deserializeParam(
          data['thumb1'],
          ParamType.String,
          false,
        ),
        thumb2: deserializeParam(
          data['thumb2'],
          ParamType.String,
          false,
        ),
        thumb3: deserializeParam(
          data['thumb3'],
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
        itemType: deserializeParam(
          data['itemType'],
          ParamType.String,
          false,
        ),
        listId: deserializeParam(
          data['listId'],
          ParamType.String,
          false,
        ),
        listName: deserializeParam(
          data['listName'],
          ParamType.String,
          false,
        ),
        listDescription: deserializeParam(
          data['listDescription'],
          ParamType.String,
          false,
        ),
        listIsPublic: deserializeParam(
          data['listIsPublic'],
          ParamType.bool,
          false,
        ),
        listItemCount: deserializeParam(
          data['listItemCount'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProfileItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfileItemStruct &&
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
        thumb1 == other.thumb1 &&
        thumb2 == other.thumb2 &&
        thumb3 == other.thumb3 &&
        ownedFirstIssueId == other.ownedFirstIssueId &&
        wantedFirstIssueId == other.wantedFirstIssueId &&
        readingFirstIssueId == other.readingFirstIssueId &&
        readFirstIssueId == other.readFirstIssueId &&
        itemType == other.itemType &&
        listId == other.listId &&
        listName == other.listName &&
        listDescription == other.listDescription &&
        listIsPublic == other.listIsPublic &&
        listItemCount == other.listItemCount;
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
        thumb1,
        thumb2,
        thumb3,
        ownedFirstIssueId,
        wantedFirstIssueId,
        readingFirstIssueId,
        readFirstIssueId,
        itemType,
        listId,
        listName,
        listDescription,
        listIsPublic,
        listItemCount
      ]);
}

ProfileItemStruct createProfileItemStruct({
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
  String? thumb1,
  String? thumb2,
  String? thumb3,
  String? ownedFirstIssueId,
  String? wantedFirstIssueId,
  String? readingFirstIssueId,
  String? readFirstIssueId,
  String? itemType,
  String? listId,
  String? listName,
  String? listDescription,
  bool? listIsPublic,
  int? listItemCount,
}) =>
    ProfileItemStruct(
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
      thumb1: thumb1,
      thumb2: thumb2,
      thumb3: thumb3,
      ownedFirstIssueId: ownedFirstIssueId,
      wantedFirstIssueId: wantedFirstIssueId,
      readingFirstIssueId: readingFirstIssueId,
      readFirstIssueId: readFirstIssueId,
      itemType: itemType,
      listId: listId,
      listName: listName,
      listDescription: listDescription,
      listIsPublic: listIsPublic,
      listItemCount: listItemCount,
    );
