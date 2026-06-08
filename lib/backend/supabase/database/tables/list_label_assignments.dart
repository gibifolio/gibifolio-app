import '../database.dart';

class ListLabelAssignmentsTable extends SupabaseTable<ListLabelAssignmentsRow> {
  @override
  String get tableName => 'list_label_assignments';

  @override
  ListLabelAssignmentsRow createRow(Map<String, dynamic> data) =>
      ListLabelAssignmentsRow(data);
}

class ListLabelAssignmentsRow extends SupabaseDataRow {
  ListLabelAssignmentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ListLabelAssignmentsTable();

  String get listId => getField<String>('list_id')!;
  set listId(String value) => setField<String>('list_id', value);

  String get labelId => getField<String>('label_id')!;
  set labelId(String value) => setField<String>('label_id', value);
}
