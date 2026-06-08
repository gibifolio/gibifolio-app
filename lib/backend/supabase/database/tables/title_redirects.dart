import '../database.dart';

class TitleRedirectsTable extends SupabaseTable<TitleRedirectsRow> {
  @override
  String get tableName => 'title_redirects';

  @override
  TitleRedirectsRow createRow(Map<String, dynamic> data) =>
      TitleRedirectsRow(data);
}

class TitleRedirectsRow extends SupabaseDataRow {
  TitleRedirectsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TitleRedirectsTable();

  String get sourceUrl => getField<String>('source_url')!;
  set sourceUrl(String value) => setField<String>('source_url', value);

  String get targetTitleId => getField<String>('target_title_id')!;
  set targetTitleId(String value) => setField<String>('target_title_id', value);

  String? get variantLabel => getField<String>('variant_label');
  set variantLabel(String? value) => setField<String>('variant_label', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
