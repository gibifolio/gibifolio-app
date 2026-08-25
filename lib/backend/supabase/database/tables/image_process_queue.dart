import '../database.dart';

class ImageProcessQueueTable extends SupabaseTable<ImageProcessQueueRow> {
  @override
  String get tableName => 'image_process_queue';

  @override
  ImageProcessQueueRow createRow(Map<String, dynamic> data) =>
      ImageProcessQueueRow(data);
}

class ImageProcessQueueRow extends SupabaseDataRow {
  ImageProcessQueueRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ImageProcessQueueTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get issueVariantId => getField<String>('issue_variant_id');
  set issueVariantId(String? value) =>
      setField<String>('issue_variant_id', value);

  String get sourceUrl => getField<String>('source_url')!;
  set sourceUrl(String value) => setField<String>('source_url', value);

  String? get kind => getField<String>('kind');
  set kind(String? value) => setField<String>('kind', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get attempts => getField<int>('attempts');
  set attempts(int? value) => setField<int>('attempts', value);

  String? get lastError => getField<String>('last_error');
  set lastError(String? value) => setField<String>('last_error', value);

  String? get targetPath => getField<String>('target_path');
  set targetPath(String? value) => setField<String>('target_path', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
