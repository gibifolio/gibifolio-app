import '../database.dart';

class TitleLicensorsTable extends SupabaseTable<TitleLicensorsRow> {
  @override
  String get tableName => 'title_licensors';

  @override
  TitleLicensorsRow createRow(Map<String, dynamic> data) =>
      TitleLicensorsRow(data);
}

class TitleLicensorsRow extends SupabaseDataRow {
  TitleLicensorsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TitleLicensorsTable();

  String get titleId => getField<String>('title_id')!;
  set titleId(String value) => setField<String>('title_id', value);

  int get licensorId => getField<int>('licensor_id')!;
  set licensorId(int value) => setField<int>('licensor_id', value);
}
