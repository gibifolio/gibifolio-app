import '../database.dart';

class TypesTable extends SupabaseTable<TypesRow> {
  @override
  String get tableName => 'types';

  @override
  TypesRow createRow(Map<String, dynamic> data) => TypesRow(data);
}

class TypesRow extends SupabaseDataRow {
  TypesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TypesTable();

  int? get typeId => getField<int>('type_id');
  set typeId(int? value) => setField<int>('type_id', value);

  String get typeName => getField<String>('type_name')!;
  set typeName(String value) => setField<String>('type_name', value);
}
