import '../database.dart';

class UserTitleStatusTable extends SupabaseTable<UserTitleStatusRow> {
  @override
  String get tableName => 'user_title_status';

  @override
  UserTitleStatusRow createRow(Map<String, dynamic> data) =>
      UserTitleStatusRow(data);
}

class UserTitleStatusRow extends SupabaseDataRow {
  UserTitleStatusRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserTitleStatusTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get titleId => getField<String>('title_id')!;
  set titleId(String value) => setField<String>('title_id', value);

  String? get statusOwnership => getField<String>('status_ownership');
  set statusOwnership(String? value) =>
      setField<String>('status_ownership', value);

  String? get statusReading => getField<String>('status_reading');
  set statusReading(String? value) => setField<String>('status_reading', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
