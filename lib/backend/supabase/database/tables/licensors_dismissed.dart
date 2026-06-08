import '../database.dart';

class LicensorsDismissedTable extends SupabaseTable<LicensorsDismissedRow> {
  @override
  String get tableName => 'licensors_dismissed';

  @override
  LicensorsDismissedRow createRow(Map<String, dynamic> data) =>
      LicensorsDismissedRow(data);
}

class LicensorsDismissedRow extends SupabaseDataRow {
  LicensorsDismissedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LicensorsDismissedTable();

  String get value => getField<String>('value')!;
  set value(String value) => setField<String>('value', value);

  String? get reason => getField<String>('reason');
  set reason(String? value) => setField<String>('reason', value);

  DateTime? get dismissedAt => getField<DateTime>('dismissed_at');
  set dismissedAt(DateTime? value) => setField<DateTime>('dismissed_at', value);
}
