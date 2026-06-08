import '../database.dart';

class StoriesTable extends SupabaseTable<StoriesRow> {
  @override
  String get tableName => 'stories';

  @override
  StoriesRow createRow(Map<String, dynamic> data) => StoriesRow(data);
}

class StoriesRow extends SupabaseDataRow {
  StoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StoriesTable();

  String get storyId => getField<String>('story_id')!;
  set storyId(String value) => setField<String>('story_id', value);

  String? get canonicalKey => getField<String>('canonical_key');
  set canonicalKey(String? value) => setField<String>('canonical_key', value);

  String? get storyCanonicalKey => getField<String>('story_canonical_key');
  set storyCanonicalKey(String? value) =>
      setField<String>('story_canonical_key', value);

  String? get storyTitle => getField<String>('story_title');
  set storyTitle(String? value) => setField<String>('story_title', value);

  String? get originalTitle => getField<String>('original_title');
  set originalTitle(String? value) => setField<String>('original_title', value);

  String? get synopsis => getField<String>('synopsis');
  set synopsis(String? value) => setField<String>('synopsis', value);

  DateTime? get firstPublishDate => getField<DateTime>('first_publish_date');
  set firstPublishDate(DateTime? value) =>
      setField<DateTime>('first_publish_date', value);

  String? get firstPublisherId => getField<String>('first_publisher_id');
  set firstPublisherId(String? value) =>
      setField<String>('first_publisher_id', value);

  String? get parseStatus => getField<String>('parse_status');
  set parseStatus(String? value) => setField<String>('parse_status', value);

  String? get parseNotes => getField<String>('parse_notes');
  set parseNotes(String? value) => setField<String>('parse_notes', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
