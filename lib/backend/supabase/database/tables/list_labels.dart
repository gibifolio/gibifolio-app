import '../database.dart';

class ListLabelsTable extends SupabaseTable<ListLabelsRow> {
  @override
  String get tableName => 'list_labels';

  @override
  ListLabelsRow createRow(Map<String, dynamic> data) => ListLabelsRow(data);
}

class ListLabelsRow extends SupabaseDataRow {
  ListLabelsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ListLabelsTable();

  String? get labelId => getField<String>('label_id');
  set labelId(String? value) => setField<String>('label_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
