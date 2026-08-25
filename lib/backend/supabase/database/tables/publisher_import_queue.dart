import '../database.dart';

class PublisherImportQueueTable extends SupabaseTable<PublisherImportQueueRow> {
  @override
  String get tableName => 'publisher_import_queue';

  @override
  PublisherImportQueueRow createRow(Map<String, dynamic> data) =>
      PublisherImportQueueRow(data);
}

class PublisherImportQueueRow extends SupabaseDataRow {
  PublisherImportQueueRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PublisherImportQueueTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get uploadId => getField<String>('upload_id')!;
  set uploadId(String value) => setField<String>('upload_id', value);

  String? get fileName => getField<String>('file_name');
  set fileName(String? value) => setField<String>('file_name', value);

  int get lineNumber => getField<int>('line_number')!;
  set lineNumber(int value) => setField<int>('line_number', value);

  dynamic get payload => getField<dynamic>('payload')!;
  set payload(dynamic value) => setField<dynamic>('payload', value);

  String? get publisherId => getField<String>('publisher_id');
  set publisherId(String? value) => setField<String>('publisher_id', value);

  String? get groupKey => getField<String>('group_key');
  set groupKey(String? value) => setField<String>('group_key', value);

  String? get temporalBucket => getField<String>('temporal_bucket');
  set temporalBucket(String? value) =>
      setField<String>('temporal_bucket', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get matchedQueueId => getField<String>('matched_queue_id');
  set matchedQueueId(String? value) =>
      setField<String>('matched_queue_id', value);

  String? get createdTitleId => getField<String>('created_title_id');
  set createdTitleId(String? value) =>
      setField<String>('created_title_id', value);

  String? get createdIssueId => getField<String>('created_issue_id');
  set createdIssueId(String? value) =>
      setField<String>('created_issue_id', value);

  String? get errorReason => getField<String>('error_reason');
  set errorReason(String? value) => setField<String>('error_reason', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get descartadoEm => getField<DateTime>('descartado_em');
  set descartadoEm(DateTime? value) =>
      setField<DateTime>('descartado_em', value);

  bool? get reconcDismissed => getField<bool>('reconc_dismissed');
  set reconcDismissed(bool? value) => setField<bool>('reconc_dismissed', value);
}
