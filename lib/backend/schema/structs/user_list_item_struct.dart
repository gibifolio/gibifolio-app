// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserListItemStruct extends BaseStruct {
  UserListItemStruct({
    String? listId,
    String? listName,
    String? description,
    int? itemCount,
    String? thumb1,
    String? thumb2,
    String? thumb3,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? sortPosition,
    bool? isOwner,
    bool? isFollowed,
    bool? isFeatured,
    bool? isGhost,
    String? authorSlug,
    String? authorName,
    String? authorAvatar,
    String? ownerId,
    DateTime? followedAt,
    bool? authorIsVerified,
  })  : _listId = listId,
        _listName = listName,
        _description = description,
        _itemCount = itemCount,
        _thumb1 = thumb1,
        _thumb2 = thumb2,
        _thumb3 = thumb3,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _sortPosition = sortPosition,
        _isOwner = isOwner,
        _isFollowed = isFollowed,
        _isFeatured = isFeatured,
        _isGhost = isGhost,
        _authorSlug = authorSlug,
        _authorName = authorName,
        _authorAvatar = authorAvatar,
        _ownerId = ownerId,
        _followedAt = followedAt,
        _authorIsVerified = authorIsVerified;

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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "itemCount" field.
  int? _itemCount;
  int get itemCount => _itemCount ?? 0;
  set itemCount(int? val) => _itemCount = val;

  void incrementItemCount(int amount) => itemCount = itemCount + amount;

  bool hasItemCount() => _itemCount != null;

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

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "sortPosition" field.
  int? _sortPosition;
  int get sortPosition => _sortPosition ?? 0;
  set sortPosition(int? val) => _sortPosition = val;

  void incrementSortPosition(int amount) =>
      sortPosition = sortPosition + amount;

  bool hasSortPosition() => _sortPosition != null;

  // "isOwner" field.
  bool? _isOwner;
  bool get isOwner => _isOwner ?? false;
  set isOwner(bool? val) => _isOwner = val;

  bool hasIsOwner() => _isOwner != null;

  // "isFollowed" field.
  bool? _isFollowed;
  bool get isFollowed => _isFollowed ?? false;
  set isFollowed(bool? val) => _isFollowed = val;

  bool hasIsFollowed() => _isFollowed != null;

  // "isFeatured" field.
  bool? _isFeatured;
  bool get isFeatured => _isFeatured ?? false;
  set isFeatured(bool? val) => _isFeatured = val;

  bool hasIsFeatured() => _isFeatured != null;

  // "isGhost" field.
  bool? _isGhost;
  bool get isGhost => _isGhost ?? false;
  set isGhost(bool? val) => _isGhost = val;

  bool hasIsGhost() => _isGhost != null;

  // "authorSlug" field.
  String? _authorSlug;
  String get authorSlug => _authorSlug ?? '';
  set authorSlug(String? val) => _authorSlug = val;

  bool hasAuthorSlug() => _authorSlug != null;

  // "authorName" field.
  String? _authorName;
  String get authorName => _authorName ?? '';
  set authorName(String? val) => _authorName = val;

  bool hasAuthorName() => _authorName != null;

  // "authorAvatar" field.
  String? _authorAvatar;
  String get authorAvatar => _authorAvatar ?? '';
  set authorAvatar(String? val) => _authorAvatar = val;

  bool hasAuthorAvatar() => _authorAvatar != null;

  // "ownerId" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  // "followedAt" field.
  DateTime? _followedAt;
  DateTime? get followedAt => _followedAt;
  set followedAt(DateTime? val) => _followedAt = val;

  bool hasFollowedAt() => _followedAt != null;

  // "authorIsVerified" field.
  bool? _authorIsVerified;
  bool get authorIsVerified => _authorIsVerified ?? false;
  set authorIsVerified(bool? val) => _authorIsVerified = val;

  bool hasAuthorIsVerified() => _authorIsVerified != null;

  static UserListItemStruct fromMap(Map<String, dynamic> data) =>
      UserListItemStruct(
        listId: data['listId'] as String?,
        listName: data['listName'] as String?,
        description: data['description'] as String?,
        itemCount: castToType<int>(data['itemCount']),
        thumb1: data['thumb1'] as String?,
        thumb2: data['thumb2'] as String?,
        thumb3: data['thumb3'] as String?,
        createdAt: data['createdAt'] as DateTime?,
        updatedAt: data['updatedAt'] as DateTime?,
        sortPosition: castToType<int>(data['sortPosition']),
        isOwner: data['isOwner'] as bool?,
        isFollowed: data['isFollowed'] as bool?,
        isFeatured: data['isFeatured'] as bool?,
        isGhost: data['isGhost'] as bool?,
        authorSlug: data['authorSlug'] as String?,
        authorName: data['authorName'] as String?,
        authorAvatar: data['authorAvatar'] as String?,
        ownerId: data['ownerId'] as String?,
        followedAt: data['followedAt'] as DateTime?,
        authorIsVerified: data['authorIsVerified'] as bool?,
      );

  static UserListItemStruct? maybeFromMap(dynamic data) => data is Map
      ? UserListItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'listId': _listId,
        'listName': _listName,
        'description': _description,
        'itemCount': _itemCount,
        'thumb1': _thumb1,
        'thumb2': _thumb2,
        'thumb3': _thumb3,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt,
        'sortPosition': _sortPosition,
        'isOwner': _isOwner,
        'isFollowed': _isFollowed,
        'isFeatured': _isFeatured,
        'isGhost': _isGhost,
        'authorSlug': _authorSlug,
        'authorName': _authorName,
        'authorAvatar': _authorAvatar,
        'ownerId': _ownerId,
        'followedAt': _followedAt,
        'authorIsVerified': _authorIsVerified,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'listId': serializeParam(
          _listId,
          ParamType.String,
        ),
        'listName': serializeParam(
          _listName,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'itemCount': serializeParam(
          _itemCount,
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
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updatedAt': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'sortPosition': serializeParam(
          _sortPosition,
          ParamType.int,
        ),
        'isOwner': serializeParam(
          _isOwner,
          ParamType.bool,
        ),
        'isFollowed': serializeParam(
          _isFollowed,
          ParamType.bool,
        ),
        'isFeatured': serializeParam(
          _isFeatured,
          ParamType.bool,
        ),
        'isGhost': serializeParam(
          _isGhost,
          ParamType.bool,
        ),
        'authorSlug': serializeParam(
          _authorSlug,
          ParamType.String,
        ),
        'authorName': serializeParam(
          _authorName,
          ParamType.String,
        ),
        'authorAvatar': serializeParam(
          _authorAvatar,
          ParamType.String,
        ),
        'ownerId': serializeParam(
          _ownerId,
          ParamType.String,
        ),
        'followedAt': serializeParam(
          _followedAt,
          ParamType.DateTime,
        ),
        'authorIsVerified': serializeParam(
          _authorIsVerified,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserListItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserListItemStruct(
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
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        itemCount: deserializeParam(
          data['itemCount'],
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
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: deserializeParam(
          data['updatedAt'],
          ParamType.DateTime,
          false,
        ),
        sortPosition: deserializeParam(
          data['sortPosition'],
          ParamType.int,
          false,
        ),
        isOwner: deserializeParam(
          data['isOwner'],
          ParamType.bool,
          false,
        ),
        isFollowed: deserializeParam(
          data['isFollowed'],
          ParamType.bool,
          false,
        ),
        isFeatured: deserializeParam(
          data['isFeatured'],
          ParamType.bool,
          false,
        ),
        isGhost: deserializeParam(
          data['isGhost'],
          ParamType.bool,
          false,
        ),
        authorSlug: deserializeParam(
          data['authorSlug'],
          ParamType.String,
          false,
        ),
        authorName: deserializeParam(
          data['authorName'],
          ParamType.String,
          false,
        ),
        authorAvatar: deserializeParam(
          data['authorAvatar'],
          ParamType.String,
          false,
        ),
        ownerId: deserializeParam(
          data['ownerId'],
          ParamType.String,
          false,
        ),
        followedAt: deserializeParam(
          data['followedAt'],
          ParamType.DateTime,
          false,
        ),
        authorIsVerified: deserializeParam(
          data['authorIsVerified'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserListItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserListItemStruct &&
        listId == other.listId &&
        listName == other.listName &&
        description == other.description &&
        itemCount == other.itemCount &&
        thumb1 == other.thumb1 &&
        thumb2 == other.thumb2 &&
        thumb3 == other.thumb3 &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        sortPosition == other.sortPosition &&
        isOwner == other.isOwner &&
        isFollowed == other.isFollowed &&
        isFeatured == other.isFeatured &&
        isGhost == other.isGhost &&
        authorSlug == other.authorSlug &&
        authorName == other.authorName &&
        authorAvatar == other.authorAvatar &&
        ownerId == other.ownerId &&
        followedAt == other.followedAt &&
        authorIsVerified == other.authorIsVerified;
  }

  @override
  int get hashCode => const ListEquality().hash([
        listId,
        listName,
        description,
        itemCount,
        thumb1,
        thumb2,
        thumb3,
        createdAt,
        updatedAt,
        sortPosition,
        isOwner,
        isFollowed,
        isFeatured,
        isGhost,
        authorSlug,
        authorName,
        authorAvatar,
        ownerId,
        followedAt,
        authorIsVerified
      ]);
}

UserListItemStruct createUserListItemStruct({
  String? listId,
  String? listName,
  String? description,
  int? itemCount,
  String? thumb1,
  String? thumb2,
  String? thumb3,
  DateTime? createdAt,
  DateTime? updatedAt,
  int? sortPosition,
  bool? isOwner,
  bool? isFollowed,
  bool? isFeatured,
  bool? isGhost,
  String? authorSlug,
  String? authorName,
  String? authorAvatar,
  String? ownerId,
  DateTime? followedAt,
  bool? authorIsVerified,
}) =>
    UserListItemStruct(
      listId: listId,
      listName: listName,
      description: description,
      itemCount: itemCount,
      thumb1: thumb1,
      thumb2: thumb2,
      thumb3: thumb3,
      createdAt: createdAt,
      updatedAt: updatedAt,
      sortPosition: sortPosition,
      isOwner: isOwner,
      isFollowed: isFollowed,
      isFeatured: isFeatured,
      isGhost: isGhost,
      authorSlug: authorSlug,
      authorName: authorName,
      authorAvatar: authorAvatar,
      ownerId: ownerId,
      followedAt: followedAt,
      authorIsVerified: authorIsVerified,
    );
