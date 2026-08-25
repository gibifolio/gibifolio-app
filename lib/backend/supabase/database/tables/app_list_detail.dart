import '../database.dart';

class AppListDetailTable extends SupabaseTable<AppListDetailRow> {
  @override
  String get tableName => 'app_list_detail';

  @override
  AppListDetailRow createRow(Map<String, dynamic> data) =>
      AppListDetailRow(data);
}

class AppListDetailRow extends SupabaseDataRow {
  AppListDetailRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppListDetailTable();

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

  bool? get isFeatured => getField<bool>('is_featured');
  set isFeatured(bool? value) => setField<bool>('is_featured', value);

  String? get listType => getField<String>('list_type');
  set listType(String? value) => setField<String>('list_type', value);

  int? get itemCount => getField<int>('item_count');
  set itemCount(int? value) => setField<int>('item_count', value);

  String? get thumb1 => getField<String>('thumb1');
  set thumb1(String? value) => setField<String>('thumb1', value);

  String? get thumb2 => getField<String>('thumb2');
  set thumb2(String? value) => setField<String>('thumb2', value);

  String? get thumb3 => getField<String>('thumb3');
  set thumb3(String? value) => setField<String>('thumb3', value);

  bool? get isAdult1 => getField<bool>('is_adult_1');
  set isAdult1(bool? value) => setField<bool>('is_adult_1', value);

  bool? get isAdult2 => getField<bool>('is_adult_2');
  set isAdult2(bool? value) => setField<bool>('is_adult_2', value);

  bool? get isAdult3 => getField<bool>('is_adult_3');
  set isAdult3(bool? value) => setField<bool>('is_adult_3', value);

  bool? get isPublic => getField<bool>('is_public');
  set isPublic(bool? value) => setField<bool>('is_public', value);

  bool? get isGhost => getField<bool>('is_ghost');
  set isGhost(bool? value) => setField<bool>('is_ghost', value);

  bool? get isFollowed => getField<bool>('is_followed');
  set isFollowed(bool? value) => setField<bool>('is_followed', value);

  String? get authorSlug => getField<String>('author_slug');
  set authorSlug(String? value) => setField<String>('author_slug', value);

  String? get authorName => getField<String>('author_name');
  set authorName(String? value) => setField<String>('author_name', value);

  String? get authorAvatar => getField<String>('author_avatar');
  set authorAvatar(String? value) => setField<String>('author_avatar', value);

  bool? get authorIsVerified => getField<bool>('author_is_verified');
  set authorIsVerified(bool? value) =>
      setField<bool>('author_is_verified', value);

  String? get cover1 => getField<String>('cover1');
  set cover1(String? value) => setField<String>('cover1', value);

  String? get cover2 => getField<String>('cover2');
  set cover2(String? value) => setField<String>('cover2', value);

  String? get cover3 => getField<String>('cover3');
  set cover3(String? value) => setField<String>('cover3', value);
}
