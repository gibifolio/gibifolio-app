import '../database.dart';

class UserIssueStatusTable extends SupabaseTable<UserIssueStatusRow> {
  @override
  String get tableName => 'user_issue_status';

  @override
  UserIssueStatusRow createRow(Map<String, dynamic> data) =>
      UserIssueStatusRow(data);
}

class UserIssueStatusRow extends SupabaseDataRow {
  UserIssueStatusRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserIssueStatusTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get issueId => getField<String>('issue_id')!;
  set issueId(String value) => setField<String>('issue_id', value);

  String? get statusReading => getField<String>('status_reading');
  set statusReading(String? value) => setField<String>('status_reading', value);

  String? get statusOwnership => getField<String>('status_ownership');
  set statusOwnership(String? value) =>
      setField<String>('status_ownership', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
