import '../database.dart';

class IssuesWithoutPrimaryVariantTable
    extends SupabaseTable<IssuesWithoutPrimaryVariantRow> {
  @override
  String get tableName => 'issues_without_primary_variant';

  @override
  IssuesWithoutPrimaryVariantRow createRow(Map<String, dynamic> data) =>
      IssuesWithoutPrimaryVariantRow(data);
}

class IssuesWithoutPrimaryVariantRow extends SupabaseDataRow {
  IssuesWithoutPrimaryVariantRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => IssuesWithoutPrimaryVariantTable();

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  String? get titleId => getField<String>('title_id');
  set titleId(String? value) => setField<String>('title_id', value);

  String? get titleName => getField<String>('title_name');
  set titleName(String? value) => setField<String>('title_name', value);

  String? get issueNumber => getField<String>('issue_number');
  set issueNumber(String? value) => setField<String>('issue_number', value);

  int? get nVariants => getField<int>('n_variants');
  set nVariants(int? value) => setField<int>('n_variants', value);
}
