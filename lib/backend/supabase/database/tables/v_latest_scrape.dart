import '../database.dart';

class VLatestScrapeTable extends SupabaseTable<VLatestScrapeRow> {
  @override
  String get tableName => 'v_latest_scrape';

  @override
  VLatestScrapeRow createRow(Map<String, dynamic> data) =>
      VLatestScrapeRow(data);
}

class VLatestScrapeRow extends SupabaseDataRow {
  VLatestScrapeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VLatestScrapeTable();

  String? get runId => getField<String>('run_id');
  set runId(String? value) => setField<String>('run_id', value);

  DateTime? get startedAt => getField<DateTime>('started_at');
  set startedAt(DateTime? value) => setField<DateTime>('started_at', value);

  DateTime? get finishedAt => getField<DateTime>('finished_at');
  set finishedAt(DateTime? value) => setField<DateTime>('finished_at', value);

  dynamic get monthsScraped => getField<dynamic>('months_scraped');
  set monthsScraped(dynamic value) =>
      setField<dynamic>('months_scraped', value);

  int? get issuesAdded => getField<int>('issues_added');
  set issuesAdded(int? value) => setField<int>('issues_added', value);

  int? get issuesUpdated => getField<int>('issues_updated');
  set issuesUpdated(int? value) => setField<int>('issues_updated', value);

  int? get titlesAdded => getField<int>('titles_added');
  set titlesAdded(int? value) => setField<int>('titles_added', value);

  int? get titlesUpdated => getField<int>('titles_updated');
  set titlesUpdated(int? value) => setField<int>('titles_updated', value);

  dynamic get errorsJson => getField<dynamic>('errors_json');
  set errorsJson(dynamic value) => setField<dynamic>('errors_json', value);
}
