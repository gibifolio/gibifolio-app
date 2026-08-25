import '../database.dart';

class MergeJournalTable extends SupabaseTable<MergeJournalRow> {
  @override
  String get tableName => 'merge_journal';

  @override
  MergeJournalRow createRow(Map<String, dynamic> data) => MergeJournalRow(data);
}

class MergeJournalRow extends SupabaseDataRow {
  MergeJournalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MergeJournalTable();

  String? get mergeId => getField<String>('merge_id');
  set mergeId(String? value) => setField<String>('merge_id', value);

  String get kind => getField<String>('kind')!;
  set kind(String value) => setField<String>('kind', value);

  String? get userEmail => getField<String>('user_email');
  set userEmail(String? value) => setField<String>('user_email', value);

  String? get targetId => getField<String>('target_id');
  set targetId(String? value) => setField<String>('target_id', value);

  List<String> get sourceIds => getListField<String>('source_ids');
  set sourceIds(List<String>? value) =>
      setListField<String>('source_ids', value);

  dynamic get snapshot => getField<dynamic>('snapshot')!;
  set snapshot(dynamic value) => setField<dynamic>('snapshot', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get undoneAt => getField<DateTime>('undone_at');
  set undoneAt(DateTime? value) => setField<DateTime>('undone_at', value);
}
