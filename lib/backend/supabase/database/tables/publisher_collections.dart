import '../database.dart';

class PublisherCollectionsTable extends SupabaseTable<PublisherCollectionsRow> {
  @override
  String get tableName => 'publisher_collections';

  @override
  PublisherCollectionsRow createRow(Map<String, dynamic> data) =>
      PublisherCollectionsRow(data);
}

class PublisherCollectionsRow extends SupabaseDataRow {
  PublisherCollectionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PublisherCollectionsTable();

  String get collectionId => getField<String>('collection_id')!;
  set collectionId(String value) => setField<String>('collection_id', value);

  String? get publisherId => getField<String>('publisher_id');
  set publisherId(String? value) => setField<String>('publisher_id', value);

  String get collectionName => getField<String>('collection_name')!;
  set collectionName(String value) =>
      setField<String>('collection_name', value);

  dynamic get aliases => getField<dynamic>('aliases');
  set aliases(dynamic value) => setField<dynamic>('aliases', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get logoPath => getField<String>('logo_path');
  set logoPath(String? value) => setField<String>('logo_path', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String get canonicalKey => getField<String>('canonical_key')!;
  set canonicalKey(String value) => setField<String>('canonical_key', value);
}
