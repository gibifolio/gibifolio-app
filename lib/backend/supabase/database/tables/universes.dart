import '../database.dart';

class UniversesTable extends SupabaseTable<UniversesRow> {
  @override
  String get tableName => 'universes';

  @override
  UniversesRow createRow(Map<String, dynamic> data) => UniversesRow(data);
}

class UniversesRow extends SupabaseDataRow {
  UniversesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UniversesTable();

  String get universeId => getField<String>('universe_id')!;
  set universeId(String value) => setField<String>('universe_id', value);

  String get universeName => getField<String>('universe_name')!;
  set universeName(String value) => setField<String>('universe_name', value);
}
