import '../database.dart';

class MergeJournalSummaryTable extends SupabaseTable<MergeJournalSummaryRow> {
  @override
  String get tableName => 'merge_journal_summary';

  @override
  MergeJournalSummaryRow createRow(Map<String, dynamic> data) =>
      MergeJournalSummaryRow(data);
}

class MergeJournalSummaryRow extends SupabaseDataRow {
  MergeJournalSummaryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MergeJournalSummaryTable();

  String? get mergeId => getField<String>('merge_id');
  set mergeId(String? value) => setField<String>('merge_id', value);

  String? get kind => getField<String>('kind');
  set kind(String? value) => setField<String>('kind', value);

  String? get targetId => getField<String>('target_id');
  set targetId(String? value) => setField<String>('target_id', value);

  List<String> get sourceIds => getListField<String>('source_ids');
  set sourceIds(List<String>? value) =>
      setListField<String>('source_ids', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get undoneAt => getField<DateTime>('undone_at');
  set undoneAt(DateTime? value) => setField<DateTime>('undone_at', value);

  int? get nFontes => getField<int>('n_fontes');
  set nFontes(int? value) => setField<int>('n_fontes', value);

  int? get nTitulos => getField<int>('n_titulos');
  set nTitulos(int? value) => setField<int>('n_titulos', value);

  int? get nIssues => getField<int>('n_issues');
  set nIssues(int? value) => setField<int>('n_issues', value);

  int? get nUis => getField<int>('n_uis');
  set nUis(int? value) => setField<int>('n_uis', value);

  int? get nUts => getField<int>('n_uts');
  set nUts(int? value) => setField<int>('n_uts', value);
}
