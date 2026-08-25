import '../database.dart';

class AppTitleCardTable extends SupabaseTable<AppTitleCardRow> {
  @override
  String get tableName => 'app_title_card';

  @override
  AppTitleCardRow createRow(Map<String, dynamic> data) => AppTitleCardRow(data);
}

class AppTitleCardRow extends SupabaseDataRow {
  AppTitleCardRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppTitleCardTable();

  String? get titleId => getField<String>('title_id');
  set titleId(String? value) => setField<String>('title_id', value);

  String? get titleName => getField<String>('title_name');
  set titleName(String? value) => setField<String>('title_name', value);

  String? get titleSubtitle => getField<String>('title_subtitle');
  set titleSubtitle(String? value) => setField<String>('title_subtitle', value);

  String? get series => getField<String>('series');
  set series(String? value) => setField<String>('series', value);

  String? get typeNormalized => getField<String>('type_normalized');
  set typeNormalized(String? value) =>
      setField<String>('type_normalized', value);

  String? get publicationStatus => getField<String>('publication_status');
  set publicationStatus(String? value) =>
      setField<String>('publication_status', value);

  String? get canonicalKey => getField<String>('canonical_key');
  set canonicalKey(String? value) => setField<String>('canonical_key', value);

  int? get genreId => getField<int>('genre_id');
  set genreId(int? value) => setField<int>('genre_id', value);

  String? get publisherId => getField<String>('publisher_id');
  set publisherId(String? value) => setField<String>('publisher_id', value);

  int? get typeId => getField<int>('type_id');
  set typeId(int? value) => setField<int>('type_id', value);

  String? get licensors => getField<String>('licensors');
  set licensors(String? value) => setField<String>('licensors', value);

  bool? get isAdult => getField<bool>('is_adult');
  set isAdult(bool? value) => setField<bool>('is_adult', value);

  String? get urlGdqTitle => getField<String>('url_gdq_title');
  set urlGdqTitle(String? value) => setField<String>('url_gdq_title', value);

  String? get titleThumb => getField<String>('title_thumb');
  set titleThumb(String? value) => setField<String>('title_thumb', value);

  String? get titleCover => getField<String>('title_cover');
  set titleCover(String? value) => setField<String>('title_cover', value);

  String? get publisherName => getField<String>('publisher_name');
  set publisherName(String? value) => setField<String>('publisher_name', value);

  String? get genreName => getField<String>('genre_name');
  set genreName(String? value) => setField<String>('genre_name', value);

  String? get typeName => getField<String>('type_name');
  set typeName(String? value) => setField<String>('type_name', value);

  int? get issueCount => getField<int>('issue_count');
  set issueCount(int? value) => setField<int>('issue_count', value);

  DateTime? get firstIssueDate => getField<DateTime>('first_issue_date');
  set firstIssueDate(DateTime? value) =>
      setField<DateTime>('first_issue_date', value);

  String? get singleIssueId => getField<String>('single_issue_id');
  set singleIssueId(String? value) =>
      setField<String>('single_issue_id', value);

  int? get singleIssuePages => getField<int>('single_issue_pages');
  set singleIssuePages(int? value) =>
      setField<int>('single_issue_pages', value);

  String? get firstIssueThumb => getField<String>('first_issue_thumb');
  set firstIssueThumb(String? value) =>
      setField<String>('first_issue_thumb', value);

  String? get firstIssueCover => getField<String>('first_issue_cover');
  set firstIssueCover(String? value) =>
      setField<String>('first_issue_cover', value);

  String? get secondIssueThumb => getField<String>('second_issue_thumb');
  set secondIssueThumb(String? value) =>
      setField<String>('second_issue_thumb', value);

  String? get secondIssueCover => getField<String>('second_issue_cover');
  set secondIssueCover(String? value) =>
      setField<String>('second_issue_cover', value);

  String? get thirdIssueThumb => getField<String>('third_issue_thumb');
  set thirdIssueThumb(String? value) =>
      setField<String>('third_issue_thumb', value);

  String? get thirdIssueCover => getField<String>('third_issue_cover');
  set thirdIssueCover(String? value) =>
      setField<String>('third_issue_cover', value);

  String? get preTitle => getField<String>('pre_title');
  set preTitle(String? value) => setField<String>('pre_title', value);

  String? get formatLabel => getField<String>('format_label');
  set formatLabel(String? value) => setField<String>('format_label', value);
}
