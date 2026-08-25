import '../database.dart';

class ListsTable extends SupabaseTable<ListsRow> {
  @override
  String get tableName => 'lists';

  @override
  ListsRow createRow(Map<String, dynamic> data) => ListsRow(data);
}

class ListsRow extends SupabaseDataRow {
  ListsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ListsTable();

  String? get listId => getField<String>('list_id');
  set listId(String? value) => setField<String>('list_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get listName => getField<String>('list_name')!;
  set listName(String value) => setField<String>('list_name', value);

  String? get listType => getField<String>('list_type');
  set listType(String? value) => setField<String>('list_type', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  bool? get isPublic => getField<bool>('is_public');
  set isPublic(bool? value) => setField<bool>('is_public', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get sourceListId => getField<String>('source_list_id');
  set sourceListId(String? value) => setField<String>('source_list_id', value);

  bool? get requireCredit => getField<bool>('require_credit');
  set requireCredit(bool? value) => setField<bool>('require_credit', value);

  bool? get hideCredit => getField<bool>('hide_credit');
  set hideCredit(bool? value) => setField<bool>('hide_credit', value);

  bool? get isFeatured => getField<bool>('is_featured');
  set isFeatured(bool? value) => setField<bool>('is_featured', value);

  String? get bgColor => getField<String>('bg_color');
  set bgColor(String? value) => setField<String>('bg_color', value);

  String? get sourceUrl => getField<String>('source_url');
  set sourceUrl(String? value) => setField<String>('source_url', value);

  String? get sourceUrlLabel => getField<String>('source_url_label');
  set sourceUrlLabel(String? value) =>
      setField<String>('source_url_label', value);

  String? get sourceAuthor => getField<String>('source_author');
  set sourceAuthor(String? value) => setField<String>('source_author', value);

  bool? get isGhost => getField<bool>('is_ghost');
  set isGhost(bool? value) => setField<bool>('is_ghost', value);

  DateTime? get deletedAt => getField<DateTime>('deleted_at');
  set deletedAt(DateTime? value) => setField<DateTime>('deleted_at', value);

  String? get slug => getField<String>('slug');
  set slug(String? value) => setField<String>('slug', value);

  int? get sortPosition => getField<int>('sort_position');
  set sortPosition(int? value) => setField<int>('sort_position', value);
}
