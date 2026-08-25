import '../database.dart';

class AppUserListsUnifiedTable extends SupabaseTable<AppUserListsUnifiedRow> {
  @override
  String get tableName => 'app_user_lists_unified';

  @override
  AppUserListsUnifiedRow createRow(Map<String, dynamic> data) =>
      AppUserListsUnifiedRow(data);
}

class AppUserListsUnifiedRow extends SupabaseDataRow {
  AppUserListsUnifiedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppUserListsUnifiedTable();

  String? get listId => getField<String>('list_id');
  set listId(String? value) => setField<String>('list_id', value);

  String? get listName => getField<String>('list_name');
  set listName(String? value) => setField<String>('list_name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  bool? get isOwner => getField<bool>('is_owner');
  set isOwner(bool? value) => setField<bool>('is_owner', value);

  bool? get isFollowed => getField<bool>('is_followed');
  set isFollowed(bool? value) => setField<bool>('is_followed', value);

  bool? get isFeatured => getField<bool>('is_featured');
  set isFeatured(bool? value) => setField<bool>('is_featured', value);

  bool? get isGhost => getField<bool>('is_ghost');
  set isGhost(bool? value) => setField<bool>('is_ghost', value);

  int? get position => getField<int>('position');
  set position(int? value) => setField<int>('position', value);

  int? get itemCount => getField<int>('item_count');
  set itemCount(int? value) => setField<int>('item_count', value);

  String? get thumb1 => getField<String>('thumb_1');
  set thumb1(String? value) => setField<String>('thumb_1', value);

  String? get thumb2 => getField<String>('thumb_2');
  set thumb2(String? value) => setField<String>('thumb_2', value);

  String? get thumb3 => getField<String>('thumb_3');
  set thumb3(String? value) => setField<String>('thumb_3', value);

  String? get authorSlug => getField<String>('author_slug');
  set authorSlug(String? value) => setField<String>('author_slug', value);

  String? get authorName => getField<String>('author_name');
  set authorName(String? value) => setField<String>('author_name', value);

  String? get authorAvatar => getField<String>('author_avatar');
  set authorAvatar(String? value) => setField<String>('author_avatar', value);

  String? get ownerId => getField<String>('owner_id');
  set ownerId(String? value) => setField<String>('owner_id', value);

  DateTime? get followedAt => getField<DateTime>('followed_at');
  set followedAt(DateTime? value) => setField<DateTime>('followed_at', value);

  bool? get authorIsVerified => getField<bool>('author_is_verified');
  set authorIsVerified(bool? value) =>
      setField<bool>('author_is_verified', value);
}
