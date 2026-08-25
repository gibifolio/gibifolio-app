import '../database.dart';

class BkpG2cIssuesTable extends SupabaseTable<BkpG2cIssuesRow> {
  @override
  String get tableName => 'bkp_g2c_issues';

  @override
  BkpG2cIssuesRow createRow(Map<String, dynamic> data) => BkpG2cIssuesRow(data);
}

class BkpG2cIssuesRow extends SupabaseDataRow {
  BkpG2cIssuesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BkpG2cIssuesTable();

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  String? get issueSubtitle => getField<String>('issue_subtitle');
  set issueSubtitle(String? value) => setField<String>('issue_subtitle', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  DateTime? get bkpAt => getField<DateTime>('bkp_at');
  set bkpAt(DateTime? value) => setField<DateTime>('bkp_at', value);
}
