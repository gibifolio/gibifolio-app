import '../database.dart';

class VariantCreditsTable extends SupabaseTable<VariantCreditsRow> {
  @override
  String get tableName => 'variant_credits';

  @override
  VariantCreditsRow createRow(Map<String, dynamic> data) =>
      VariantCreditsRow(data);
}

class VariantCreditsRow extends SupabaseDataRow {
  VariantCreditsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VariantCreditsTable();

  String get issueVariantId => getField<String>('issue_variant_id')!;
  set issueVariantId(String value) =>
      setField<String>('issue_variant_id', value);

  String get creatorId => getField<String>('creator_id')!;
  set creatorId(String value) => setField<String>('creator_id', value);

  String get roleName => getField<String>('role_name')!;
  set roleName(String value) => setField<String>('role_name', value);

  String? get creditNotes => getField<String>('credit_notes');
  set creditNotes(String? value) => setField<String>('credit_notes', value);
}
