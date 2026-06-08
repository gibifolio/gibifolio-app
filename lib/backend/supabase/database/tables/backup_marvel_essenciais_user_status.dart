import '../database.dart';

class BackupMarvelEssenciaisUserStatusTable
    extends SupabaseTable<BackupMarvelEssenciaisUserStatusRow> {
  @override
  String get tableName => '_backup_marvel_essenciais_user_status';

  @override
  BackupMarvelEssenciaisUserStatusRow createRow(Map<String, dynamic> data) =>
      BackupMarvelEssenciaisUserStatusRow(data);
}

class BackupMarvelEssenciaisUserStatusRow extends SupabaseDataRow {
  BackupMarvelEssenciaisUserStatusRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BackupMarvelEssenciaisUserStatusTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  String? get statusReading => getField<String>('status_reading');
  set statusReading(String? value) => setField<String>('status_reading', value);

  String? get statusOwnership => getField<String>('status_ownership');
  set statusOwnership(String? value) =>
      setField<String>('status_ownership', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
