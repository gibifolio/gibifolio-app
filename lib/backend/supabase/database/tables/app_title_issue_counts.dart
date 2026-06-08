import '../database.dart';

class AppTitleIssueCountsTable extends SupabaseTable<AppTitleIssueCountsRow> {
  @override
  String get tableName => 'app_title_issue_counts';

  @override
  AppTitleIssueCountsRow createRow(Map<String, dynamic> data) =>
      AppTitleIssueCountsRow(data);
}

class AppTitleIssueCountsRow extends SupabaseDataRow {
  AppTitleIssueCountsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppTitleIssueCountsTable();

  String? get titleId => getField<String>('title_id');
  set titleId(String? value) => setField<String>('title_id', value);

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
}
