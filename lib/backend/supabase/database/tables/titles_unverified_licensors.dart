import '../database.dart';

class TitlesUnverifiedLicensorsTable
    extends SupabaseTable<TitlesUnverifiedLicensorsRow> {
  @override
  String get tableName => 'titles_unverified_licensors';

  @override
  TitlesUnverifiedLicensorsRow createRow(Map<String, dynamic> data) =>
      TitlesUnverifiedLicensorsRow(data);
}

class TitlesUnverifiedLicensorsRow extends SupabaseDataRow {
  TitlesUnverifiedLicensorsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TitlesUnverifiedLicensorsTable();

  String? get titleId => getField<String>('title_id');
  set titleId(String? value) => setField<String>('title_id', value);

  String? get titleName => getField<String>('title_name');
  set titleName(String? value) => setField<String>('title_name', value);

  String? get licensors => getField<String>('licensors');
  set licensors(String? value) => setField<String>('licensors', value);

  String? get publisherId => getField<String>('publisher_id');
  set publisherId(String? value) => setField<String>('publisher_id', value);

  String? get thumbLocalPath => getField<String>('thumb_local_path');
  set thumbLocalPath(String? value) =>
      setField<String>('thumb_local_path', value);
}
