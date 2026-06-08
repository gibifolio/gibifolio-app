import '../database.dart';

class AppFeaturedListsTable extends SupabaseTable<AppFeaturedListsRow> {
  @override
  String get tableName => 'app_featured_lists';

  @override
  AppFeaturedListsRow createRow(Map<String, dynamic> data) =>
      AppFeaturedListsRow(data);
}

class AppFeaturedListsRow extends SupabaseDataRow {
  AppFeaturedListsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppFeaturedListsTable();

  String? get listId => getField<String>('list_id');
  set listId(String? value) => setField<String>('list_id', value);

  String? get listName => getField<String>('list_name');
  set listName(String? value) => setField<String>('list_name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get itemCount => getField<int>('item_count');
  set itemCount(int? value) => setField<int>('item_count', value);
}
