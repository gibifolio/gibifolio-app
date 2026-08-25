import '../database.dart';

class BkpG1cVariantsTable extends SupabaseTable<BkpG1cVariantsRow> {
  @override
  String get tableName => 'bkp_g1c_variants';

  @override
  BkpG1cVariantsRow createRow(Map<String, dynamic> data) =>
      BkpG1cVariantsRow(data);
}

class BkpG1cVariantsRow extends SupabaseDataRow {
  BkpG1cVariantsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BkpG1cVariantsTable();

  String? get issueVariantId => getField<String>('issue_variant_id');
  set issueVariantId(String? value) =>
      setField<String>('issue_variant_id', value);

  String? get oldIssueId => getField<String>('old_issue_id');
  set oldIssueId(String? value) => setField<String>('old_issue_id', value);

  bool? get oldPrimary => getField<bool>('old_primary');
  set oldPrimary(bool? value) => setField<bool>('old_primary', value);

  String? get oldLabel => getField<String>('old_label');
  set oldLabel(String? value) => setField<String>('old_label', value);

  DateTime? get bkpAt => getField<DateTime>('bkp_at');
  set bkpAt(DateTime? value) => setField<DateTime>('bkp_at', value);
}
