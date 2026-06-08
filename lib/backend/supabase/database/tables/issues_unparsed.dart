import '../database.dart';

class IssuesUnparsedTable extends SupabaseTable<IssuesUnparsedRow> {
  @override
  String get tableName => 'issues_unparsed';

  @override
  IssuesUnparsedRow createRow(Map<String, dynamic> data) =>
      IssuesUnparsedRow(data);
}

class IssuesUnparsedRow extends SupabaseDataRow {
  IssuesUnparsedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => IssuesUnparsedTable();

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  String? get titleId => getField<String>('title_id');
  set titleId(String? value) => setField<String>('title_id', value);

  String? get issueNumber => getField<String>('issue_number');
  set issueNumber(String? value) => setField<String>('issue_number', value);

  String? get urlGdqIssue => getField<String>('url_gdq_issue');
  set urlGdqIssue(String? value) => setField<String>('url_gdq_issue', value);

  String? get titleName => getField<String>('title_name');
  set titleName(String? value) => setField<String>('title_name', value);
}
