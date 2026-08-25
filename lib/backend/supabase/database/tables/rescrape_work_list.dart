import '../database.dart';

class RescrapeWorkListTable extends SupabaseTable<RescrapeWorkListRow> {
  @override
  String get tableName => 'rescrape_work_list';

  @override
  RescrapeWorkListRow createRow(Map<String, dynamic> data) =>
      RescrapeWorkListRow(data);
}

class RescrapeWorkListRow extends SupabaseDataRow {
  RescrapeWorkListRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RescrapeWorkListTable();

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);

  String? get source => getField<String>('source');
  set source(String? value) => setField<String>('source', value);

  String? get titleName => getField<String>('title_name');
  set titleName(String? value) => setField<String>('title_name', value);

  String? get releaseDate => getField<String>('release_date');
  set releaseDate(String? value) => setField<String>('release_date', value);

  DateTime? get publisherSyncedAt => getField<DateTime>('publisher_synced_at');
  set publisherSyncedAt(DateTime? value) =>
      setField<DateTime>('publisher_synced_at', value);
}
