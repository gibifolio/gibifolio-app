import '../database.dart';

class AppIssueWithUserStatusTable
    extends SupabaseTable<AppIssueWithUserStatusRow> {
  @override
  String get tableName => 'app_issue_with_user_status';

  @override
  AppIssueWithUserStatusRow createRow(Map<String, dynamic> data) =>
      AppIssueWithUserStatusRow(data);
}

class AppIssueWithUserStatusRow extends SupabaseDataRow {
  AppIssueWithUserStatusRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppIssueWithUserStatusTable();

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  String? get titleId => getField<String>('title_id');
  set titleId(String? value) => setField<String>('title_id', value);

  String? get issueNumber => getField<String>('issue_number');
  set issueNumber(String? value) => setField<String>('issue_number', value);

  String? get issueName => getField<String>('issue_name');
  set issueName(String? value) => setField<String>('issue_name', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  int? get pages => getField<int>('pages');
  set pages(int? value) => setField<int>('pages', value);

  String? get primaryThumb => getField<String>('primary_thumb');
  set primaryThumb(String? value) => setField<String>('primary_thumb', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get statusReading => getField<String>('status_reading');
  set statusReading(String? value) => setField<String>('status_reading', value);

  String? get statusOwnership => getField<String>('status_ownership');
  set statusOwnership(String? value) =>
      setField<String>('status_ownership', value);

  DateTime? get statusUpdatedAt => getField<DateTime>('status_updated_at');
  set statusUpdatedAt(DateTime? value) =>
      setField<DateTime>('status_updated_at', value);

  bool? get isAdult => getField<bool>('is_adult');
  set isAdult(bool? value) => setField<bool>('is_adult', value);

  bool? get isSingleIssue => getField<bool>('is_single_issue');
  set isSingleIssue(bool? value) => setField<bool>('is_single_issue', value);
}
