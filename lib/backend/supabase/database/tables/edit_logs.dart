import '../database.dart';

class EditLogsTable extends SupabaseTable<EditLogsRow> {
  @override
  String get tableName => 'edit_logs';

  @override
  EditLogsRow createRow(Map<String, dynamic> data) => EditLogsRow(data);
}

class EditLogsRow extends SupabaseDataRow {
  EditLogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EditLogsTable();

  String? get logId => getField<String>('log_id');
  set logId(String? value) => setField<String>('log_id', value);

  String get tableNameField => getField<String>('table_name')!;
  set tableNameField(String value) => setField<String>('table_name', value);

  String get recordId => getField<String>('record_id')!;
  set recordId(String value) => setField<String>('record_id', value);

  String? get fieldName => getField<String>('field_name');
  set fieldName(String? value) => setField<String>('field_name', value);

  String? get oldValue => getField<String>('old_value');
  set oldValue(String? value) => setField<String>('old_value', value);

  String? get newValue => getField<String>('new_value');
  set newValue(String? value) => setField<String>('new_value', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userEmail => getField<String>('user_email');
  set userEmail(String? value) => setField<String>('user_email', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
