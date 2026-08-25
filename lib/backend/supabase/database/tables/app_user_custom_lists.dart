import '../database.dart';

class AppUserCustomListsTable extends SupabaseTable<AppUserCustomListsRow> {
  @override
  String get tableName => 'app_user_custom_lists';

  @override
  AppUserCustomListsRow createRow(Map<String, dynamic> data) =>
      AppUserCustomListsRow(data);
}

class AppUserCustomListsRow extends SupabaseDataRow {
  AppUserCustomListsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppUserCustomListsTable();

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

  int? get itemCount => getField<int>('item_count');
  set itemCount(int? value) => setField<int>('item_count', value);

  String? get thumb1 => getField<String>('thumb_1');
  set thumb1(String? value) => setField<String>('thumb_1', value);

  String? get thumb2 => getField<String>('thumb_2');
  set thumb2(String? value) => setField<String>('thumb_2', value);

  String? get thumb3 => getField<String>('thumb_3');
  set thumb3(String? value) => setField<String>('thumb_3', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get sortPosition => getField<int>('sort_position');
  set sortPosition(int? value) => setField<int>('sort_position', value);
}
