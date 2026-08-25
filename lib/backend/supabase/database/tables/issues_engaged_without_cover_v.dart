import '../database.dart';

class IssuesEngagedWithoutCoverVTable
    extends SupabaseTable<IssuesEngagedWithoutCoverVRow> {
  @override
  String get tableName => 'issues_engaged_without_cover_v';

  @override
  IssuesEngagedWithoutCoverVRow createRow(Map<String, dynamic> data) =>
      IssuesEngagedWithoutCoverVRow(data);
}

class IssuesEngagedWithoutCoverVRow extends SupabaseDataRow {
  IssuesEngagedWithoutCoverVRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => IssuesEngagedWithoutCoverVTable();

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  String? get titleId => getField<String>('title_id');
  set titleId(String? value) => setField<String>('title_id', value);

  String? get titleName => getField<String>('title_name');
  set titleName(String? value) => setField<String>('title_name', value);

  String? get issueNumber => getField<String>('issue_number');
  set issueNumber(String? value) => setField<String>('issue_number', value);

  String? get issueName => getField<String>('issue_name');
  set issueName(String? value) => setField<String>('issue_name', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  String? get urlGdqIssue => getField<String>('url_gdq_issue');
  set urlGdqIssue(String? value) => setField<String>('url_gdq_issue', value);

  String? get coverUrlSource => getField<String>('cover_url_source');
  set coverUrlSource(String? value) =>
      setField<String>('cover_url_source', value);

  bool? get isQueued => getField<bool>('is_queued');
  set isQueued(bool? value) => setField<bool>('is_queued', value);

  int? get usersCount => getField<int>('users_count');
  set usersCount(int? value) => setField<int>('users_count', value);

  int? get titleUsersCount => getField<int>('title_users_count');
  set titleUsersCount(int? value) => setField<int>('title_users_count', value);

  bool? get isDismissed => getField<bool>('is_dismissed');
  set isDismissed(bool? value) => setField<bool>('is_dismissed', value);
}
