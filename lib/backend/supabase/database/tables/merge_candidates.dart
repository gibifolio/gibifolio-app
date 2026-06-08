import '../database.dart';

class MergeCandidatesTable extends SupabaseTable<MergeCandidatesRow> {
  @override
  String get tableName => 'merge_candidates';

  @override
  MergeCandidatesRow createRow(Map<String, dynamic> data) =>
      MergeCandidatesRow(data);
}

class MergeCandidatesRow extends SupabaseDataRow {
  MergeCandidatesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MergeCandidatesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get entityType => getField<String>('entity_type');
  set entityType(String? value) => setField<String>('entity_type', value);

  dynamic get entityIds => getField<dynamic>('entity_ids')!;
  set entityIds(dynamic value) => setField<dynamic>('entity_ids', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get suggestedBy => getField<String>('suggested_by');
  set suggestedBy(String? value) => setField<String>('suggested_by', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
