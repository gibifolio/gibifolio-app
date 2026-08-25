import '../database.dart';

class BkpG2IssuesTable extends SupabaseTable<BkpG2IssuesRow> {
  @override
  String get tableName => 'bkp_g2_issues';

  @override
  BkpG2IssuesRow createRow(Map<String, dynamic> data) => BkpG2IssuesRow(data);
}

class BkpG2IssuesRow extends SupabaseDataRow {
  BkpG2IssuesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BkpG2IssuesTable();

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  String? get issueSubtitle => getField<String>('issue_subtitle');
  set issueSubtitle(String? value) => setField<String>('issue_subtitle', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  DateTime? get bkpAt => getField<DateTime>('bkp_at');
  set bkpAt(DateTime? value) => setField<DateTime>('bkp_at', value);
}
