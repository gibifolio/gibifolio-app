import '../database.dart';

class PublisherImportQueueBackup20260726Table
    extends SupabaseTable<PublisherImportQueueBackup20260726Row> {
  @override
  String get tableName => 'publisher_import_queue_backup_20260726';

  @override
  PublisherImportQueueBackup20260726Row createRow(Map<String, dynamic> data) =>
      PublisherImportQueueBackup20260726Row(data);
}

class PublisherImportQueueBackup20260726Row extends SupabaseDataRow {
  PublisherImportQueueBackup20260726Row(Map<String, dynamic> data)
      : super(data);

  @override
  SupabaseTable get table => PublisherImportQueueBackup20260726Table();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get uploadId => getField<String>('upload_id');
  set uploadId(String? value) => setField<String>('upload_id', value);

  String? get fileName => getField<String>('file_name');
  set fileName(String? value) => setField<String>('file_name', value);

  int? get lineNumber => getField<int>('line_number');
  set lineNumber(int? value) => setField<int>('line_number', value);

  dynamic get payload => getField<dynamic>('payload');
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
}
