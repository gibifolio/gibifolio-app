import '../database.dart';

class TitlesTable extends SupabaseTable<TitlesRow> {
  @override
  String get tableName => 'titles';

  @override
  TitlesRow createRow(Map<String, dynamic> data) => TitlesRow(data);
}

class TitlesRow extends SupabaseDataRow {
  TitlesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TitlesTable();

  String get titleId => getField<String>('title_id')!;
  set titleId(String value) => setField<String>('title_id', value);

  String? get titleName => getField<String>('title_name');
  set titleName(String? value) => setField<String>('title_name', value);

  String? get titleNameParsedRaw => getField<String>('title_name_parsed_raw');
  set titleNameParsedRaw(String? value) =>
      setField<String>('title_name_parsed_raw', value);

  String? get titleSubtitle => getField<String>('title_subtitle');
  set titleSubtitle(String? value) => setField<String>('title_subtitle', value);

  String? get series => getField<String>('series');
  set series(String? value) => setField<String>('series', value);

  int? get typeId => getField<int>('type_id');
  set typeId(int? value) => setField<int>('type_id', value);

  int? get genreId => getField<int>('genre_id');
  set genreId(int? value) => setField<int>('genre_id', value);

  String? get typeNormalized => getField<String>('type_normalized');
  set typeNormalized(String? value) =>
      setField<String>('type_normalized', value);

  String? get publisherId => getField<String>('publisher_id');
  set publisherId(String? value) => setField<String>('publisher_id', value);

  String? get licensors => getField<String>('licensors');
  set licensors(String? value) => setField<String>('licensors', value);

  String? get publicationStatus => getField<String>('publication_status');
  set publicationStatus(String? value) =>
      setField<String>('publication_status', value);

  String? get urlGdqTitle => getField<String>('url_gdq_title');
  set urlGdqTitle(String? value) => setField<String>('url_gdq_title', value);

  String? get coverUrlSource => getField<String>('cover_url_source');
  set coverUrlSource(String? value) =>
      setField<String>('cover_url_source', value);

  String? get coverLocalPath => getField<String>('cover_local_path');
  set coverLocalPath(String? value) =>
      setField<String>('cover_local_path', value);

  String? get thumbLocalPath => getField<String>('thumb_local_path');
  set thumbLocalPath(String? value) =>
      setField<String>('thumb_local_path', value);

  String? get canonicalKey => getField<String>('canonical_key');
  set canonicalKey(String? value) => setField<String>('canonical_key', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  bool? get isAdult => getField<bool>('is_adult');
  set isAdult(bool? value) => setField<bool>('is_adult', value);

  String? get searchName => getField<String>('search_name');
  set searchName(String? value) => setField<String>('search_name', value);

  String? get searchCombined => getField<String>('search_combined');
  set searchCombined(String? value) =>
      setField<String>('search_combined', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get typeRaw => getField<String>('type_raw');
  set typeRaw(String? value) => setField<String>('type_raw', value);

  String? get formatLabel => getField<String>('format_label');
  set formatLabel(String? value) => setField<String>('format_label', value);

  String? get titleNamePublisherRaw =>
      getField<String>('title_name_publisher_raw');
  set titleNamePublisherRaw(String? value) =>
      setField<String>('title_name_publisher_raw', value);

  String? get imprint => getField<String>('imprint');
  set imprint(String? value) => setField<String>('imprint', value);

  String? get collectionRaw => getField<String>('collection_raw');
  set collectionRaw(String? value) => setField<String>('collection_raw', value);

  String? get collectionId => getField<String>('collection_id');
  set collectionId(String? value) => setField<String>('collection_id', value);

  String? get preTitle => getField<String>('pre_title');
  set preTitle(String? value) => setField<String>('pre_title', value);

  String? get gdqTitleCode => getField<String>('gdq_title_code');
  set gdqTitleCode(String? value) => setField<String>('gdq_title_code', value);

  String? get genreRaw => getField<String>('genre_raw');
  set genreRaw(String? value) => setField<String>('genre_raw', value);
}
