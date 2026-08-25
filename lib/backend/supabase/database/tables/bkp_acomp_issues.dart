import '../database.dart';

class BkpAcompIssuesTable extends SupabaseTable<BkpAcompIssuesRow> {
  @override
  String get tableName => 'bkp_acomp_issues';

  @override
  BkpAcompIssuesRow createRow(Map<String, dynamic> data) =>
      BkpAcompIssuesRow(data);
}

class BkpAcompIssuesRow extends SupabaseDataRow {
  BkpAcompIssuesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BkpAcompIssuesTable();

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  String? get issueSubtitle => getField<String>('issue_subtitle');
  set issueSubtitle(String? value) => setField<String>('issue_subtitle', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  DateTime? get bkpAt => getField<DateTime>('bkp_at');
  set bkpAt(DateTime? value) => setField<DateTime>('bkp_at', value);
}
