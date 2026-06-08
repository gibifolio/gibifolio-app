import '../database.dart';

class LicensorsTable extends SupabaseTable<LicensorsRow> {
  @override
  String get tableName => 'licensors';

  @override
  LicensorsRow createRow(Map<String, dynamic> data) => LicensorsRow(data);
}

class LicensorsRow extends SupabaseDataRow {
  LicensorsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LicensorsTable();

  int? get licensorId => getField<int>('licensor_id');
  set licensorId(int? value) => setField<int>('licensor_id', value);

  String get licensorName => getField<String>('licensor_name')!;
  set licensorName(String value) => setField<String>('licensor_name', value);

  dynamic get aliases => getField<dynamic>('aliases');
  set aliases(dynamic value) => setField<dynamic>('aliases', value);

  String? get logoPath => getField<String>('logo_path');
  set logoPath(String? value) => setField<String>('logo_path', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);
}
