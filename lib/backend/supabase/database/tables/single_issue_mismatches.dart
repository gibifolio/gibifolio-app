import '../database.dart';

class SingleIssueMismatchesTable
    extends SupabaseTable<SingleIssueMismatchesRow> {
  @override
  String get tableName => 'single_issue_mismatches';

  @override
  SingleIssueMismatchesRow createRow(Map<String, dynamic> data) =>
      SingleIssueMismatchesRow(data);
}

class SingleIssueMismatchesRow extends SupabaseDataRow {
  SingleIssueMismatchesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SingleIssueMismatchesTable();

  String? get titleId => getField<String>('title_id');
  set titleId(String? value) => setField<String>('title_id', value);

  String? get titleName => getField<String>('title_name');
  set titleName(String? value) => setField<String>('title_name', value);

  String? get typeNormalized => getField<String>('type_normalized');
  set typeNormalized(String? value) =>
      setField<String>('type_normalized', value);

  int? get typeId => getField<int>('type_id');
  set typeId(int? value) => setField<int>('type_id', value);

  String? get publicationStatus => getField<String>('publication_status');
  set publicationStatus(String? value) =>
      setField<String>('publication_status', value);

  int? get issueCount => getField<int>('issue_count');
  set issueCount(int? value) => setField<int>('issue_count', value);
}
