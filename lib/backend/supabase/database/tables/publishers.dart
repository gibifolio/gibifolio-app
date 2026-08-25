import '../database.dart';

class PublishersTable extends SupabaseTable<PublishersRow> {
  @override
  String get tableName => 'publishers';

  @override
  PublishersRow createRow(Map<String, dynamic> data) => PublishersRow(data);
}

class PublishersRow extends SupabaseDataRow {
  PublishersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PublishersTable();

  String get publisherId => getField<String>('publisher_id')!;
  set publisherId(String value) => setField<String>('publisher_id', value);

  String get publisherName => getField<String>('publisher_name')!;
  set publisherName(String value) => setField<String>('publisher_name', value);

  String? get country => getField<String>('country');
  set country(String? value) => setField<String>('country', value);

  dynamic get imprintsJson => getField<dynamic>('imprints_json');
  set imprintsJson(dynamic value) => setField<dynamic>('imprints_json', value);

  String? get logoPath => getField<String>('logo_path');
  set logoPath(String? value) => setField<String>('logo_path', value);

  dynamic get aliases => getField<dynamic>('aliases');
  set aliases(dynamic value) => setField<dynamic>('aliases', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get canonicalKey => getField<String>('canonical_key');
  set canonicalKey(String? value) => setField<String>('canonical_key', value);

  String? get sourceSlug => getField<String>('source_slug');
  set sourceSlug(String? value) => setField<String>('source_slug', value);

  bool? get needsReview => getField<bool>('needs_review');
  set needsReview(bool? value) => setField<bool>('needs_review', value);
}
