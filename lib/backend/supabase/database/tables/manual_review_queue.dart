import '../database.dart';

class ManualReviewQueueTable extends SupabaseTable<ManualReviewQueueRow> {
  @override
  String get tableName => 'manual_review_queue';

  @override
  ManualReviewQueueRow createRow(Map<String, dynamic> data) =>
      ManualReviewQueueRow(data);
}

class ManualReviewQueueRow extends SupabaseDataRow {
  ManualReviewQueueRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ManualReviewQueueTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get entityType => getField<String>('entity_type')!;
  set entityType(String value) => setField<String>('entity_type', value);

  String get entityId => getField<String>('entity_id')!;
  set entityId(String value) => setField<String>('entity_id', value);

  String? get note => getField<String>('note');
  set note(String? value) => setField<String>('note', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get requestedBy => getField<String>('requested_by');
  set requestedBy(String? value) => setField<String>('requested_by', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get resolvedAt => getField<DateTime>('resolved_at');
  set resolvedAt(DateTime? value) => setField<DateTime>('resolved_at', value);
}
