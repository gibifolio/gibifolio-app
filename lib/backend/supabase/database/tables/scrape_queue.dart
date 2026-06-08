import '../database.dart';

class ScrapeQueueTable extends SupabaseTable<ScrapeQueueRow> {
  @override
  String get tableName => 'scrape_queue';

  @override
  ScrapeQueueRow createRow(Map<String, dynamic> data) => ScrapeQueueRow(data);
}

class ScrapeQueueRow extends SupabaseDataRow {
  ScrapeQueueRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ScrapeQueueTable();

  String? get jobId => getField<String>('job_id');
  set jobId(String? value) => setField<String>('job_id', value);

  String get jobType => getField<String>('job_type')!;
  set jobType(String value) => setField<String>('job_type', value);

  String? get entityId => getField<String>('entity_id');
  set entityId(String? value) => setField<String>('entity_id', value);

  String get url => getField<String>('url')!;
  set url(String value) => setField<String>('url', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  dynamic get result => getField<dynamic>('result');
  set result(dynamic value) => setField<dynamic>('result', value);

  String? get requestedBy => getField<String>('requested_by');
  set requestedBy(String? value) => setField<String>('requested_by', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get startedAt => getField<DateTime>('started_at');
  set startedAt(DateTime? value) => setField<DateTime>('started_at', value);

  DateTime? get completedAt => getField<DateTime>('completed_at');
  set completedAt(DateTime? value) => setField<DateTime>('completed_at', value);
}
