import '../database.dart';

class MultiIssueMismatchesTable extends SupabaseTable<MultiIssueMismatchesRow> {
  @override
  String get tableName => 'multi_issue_mismatches';

  @override
  MultiIssueMismatchesRow createRow(Map<String, dynamic> data) =>
      MultiIssueMismatchesRow(data);
}

class MultiIssueMismatchesRow extends SupabaseDataRow {
  MultiIssueMismatchesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MultiIssueMismatchesTable();

  String? get titleId => getField<String>('title_id');
  set titleId(String? value) => setField<String>('title_id', value);

  String? get titleName => getField<String>('title_name');
  set titleName(String? value) => setField<String>('title_name', value);

  String? get typeNormalized => getField<String>('type_normalized');
  set typeNormalized(String? value) =>
      setField<String>('type_normalized', value);

  String? get publicationStatus => getField<String>('publication_status');
  set publicationStatus(String? value) =>
      setField<String>('publication_status', value);

  int? get issueCount => getField<int>('issue_count');
  set issueCount(int? value) => setField<int>('issue_count', value);
}
