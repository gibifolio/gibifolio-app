import '../database.dart';

class AppLibraryCountsTable extends SupabaseTable<AppLibraryCountsRow> {
  @override
  String get tableName => 'app_library_counts';

  @override
  AppLibraryCountsRow createRow(Map<String, dynamic> data) =>
      AppLibraryCountsRow(data);
}

class AppLibraryCountsRow extends SupabaseDataRow {
  AppLibraryCountsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppLibraryCountsTable();

  int? get ownedCount => getField<int>('owned_count');
  set ownedCount(int? value) => setField<int>('owned_count', value);

  int? get wantedCount => getField<int>('wanted_count');
  set wantedCount(int? value) => setField<int>('wanted_count', value);

  int? get readingCount => getField<int>('reading_count');
  set readingCount(int? value) => setField<int>('reading_count', value);

  int? get readCount => getField<int>('read_count');
  set readCount(int? value) => setField<int>('read_count', value);

  int? get unreadCount => getField<int>('unread_count');
  set unreadCount(int? value) => setField<int>('unread_count', value);

  int? get customListCount => getField<int>('custom_list_count');
  set customListCount(int? value) => setField<int>('custom_list_count', value);
}
