import '../database.dart';

class AppFeaturedListThumbsTable
    extends SupabaseTable<AppFeaturedListThumbsRow> {
  @override
  String get tableName => 'app_featured_list_thumbs';

  @override
  AppFeaturedListThumbsRow createRow(Map<String, dynamic> data) =>
      AppFeaturedListThumbsRow(data);
}

class AppFeaturedListThumbsRow extends SupabaseDataRow {
  AppFeaturedListThumbsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppFeaturedListThumbsTable();

  String? get listId => getField<String>('list_id');
  set listId(String? value) => setField<String>('list_id', value);

  String? get listName => getField<String>('list_name');
  set listName(String? value) => setField<String>('list_name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get bgColor => getField<String>('bg_color');
  set bgColor(String? value) => setField<String>('bg_color', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get itemCount => getField<int>('item_count');
  set itemCount(int? value) => setField<int>('item_count', value);

  String? get labels => getField<String>('labels');
  set labels(String? value) => setField<String>('labels', value);

  String? get thumb1 => getField<String>('thumb1');
  set thumb1(String? value) => setField<String>('thumb1', value);

  String? get thumb2 => getField<String>('thumb2');
  set thumb2(String? value) => setField<String>('thumb2', value);

  String? get thumb3 => getField<String>('thumb3');
  set thumb3(String? value) => setField<String>('thumb3', value);

  String? get authorSlug => getField<String>('author_slug');
  set authorSlug(String? value) => setField<String>('author_slug', value);

  String? get authorName => getField<String>('author_name');
  set authorName(String? value) => setField<String>('author_name', value);

  String? get authorAvatar => getField<String>('author_avatar');
  set authorAvatar(String? value) => setField<String>('author_avatar', value);

  bool? get authorIsVerified => getField<bool>('author_is_verified');
  set authorIsVerified(bool? value) =>
      setField<bool>('author_is_verified', value);
}
