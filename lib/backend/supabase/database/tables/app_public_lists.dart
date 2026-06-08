import '../database.dart';

class AppPublicListsTable extends SupabaseTable<AppPublicListsRow> {
  @override
  String get tableName => 'app_public_lists';

  @override
  AppPublicListsRow createRow(Map<String, dynamic> data) =>
      AppPublicListsRow(data);
}

class AppPublicListsRow extends SupabaseDataRow {
  AppPublicListsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppPublicListsTable();

  String? get listId => getField<String>('list_id');
  set listId(String? value) => setField<String>('list_id', value);

  String? get listName => getField<String>('list_name');
  set listName(String? value) => setField<String>('list_name', value);

  String? get slug => getField<String>('slug');
  set slug(String? value) => setField<String>('slug', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  bool? get isFeatured => getField<bool>('is_featured');
  set isFeatured(bool? value) => setField<bool>('is_featured', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get profileSlug => getField<String>('profile_slug');
  set profileSlug(String? value) => setField<String>('profile_slug', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  int? get itemCount => getField<int>('item_count');
  set itemCount(int? value) => setField<int>('item_count', value);
}
