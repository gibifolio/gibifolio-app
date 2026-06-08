import '../database.dart';

class AppLibraryWantedTable extends SupabaseTable<AppLibraryWantedRow> {
  @override
  String get tableName => 'app_library_wanted';

  @override
  AppLibraryWantedRow createRow(Map<String, dynamic> data) =>
      AppLibraryWantedRow(data);
}

class AppLibraryWantedRow extends SupabaseDataRow {
  AppLibraryWantedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppLibraryWantedTable();

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

  String? get publisherId => getField<String>('publisher_id');
  set publisherId(String? value) => setField<String>('publisher_id', value);

  String? get publisherName => getField<String>('publisher_name');
  set publisherName(String? value) => setField<String>('publisher_name', value);

  String? get licensors => getField<String>('licensors');
  set licensors(String? value) => setField<String>('licensors', value);

  String? get publicationStatus => getField<String>('publication_status');
  set publicationStatus(String? value) =>
      setField<String>('publication_status', value);

  bool? get isAdult => getField<bool>('is_adult');
  set isAdult(bool? value) => setField<bool>('is_adult', value);

  String? get canonicalKey => getField<String>('canonical_key');
  set canonicalKey(String? value) => setField<String>('canonical_key', value);

  String? get searchCombined => getField<String>('search_combined');
  set searchCombined(String? value) =>
      setField<String>('search_combined', value);

  int? get issueCount => getField<int>('issue_count');
  set issueCount(int? value) => setField<int>('issue_count', value);

  String? get singleIssueId => getField<String>('single_issue_id');
  set singleIssueId(String? value) =>
      setField<String>('single_issue_id', value);

  int? get singleIssuePages => getField<int>('single_issue_pages');
  set singleIssuePages(int? value) =>
      setField<int>('single_issue_pages', value);

  int? get wantedCount => getField<int>('wanted_count');
  set wantedCount(int? value) => setField<int>('wanted_count', value);

  String? get firstStatusIssueId => getField<String>('first_status_issue_id');
  set firstStatusIssueId(String? value) =>
      setField<String>('first_status_issue_id', value);

  String? get wantedT1 => getField<String>('wanted_t1');
  set wantedT1(String? value) => setField<String>('wanted_t1', value);

  String? get wantedT2 => getField<String>('wanted_t2');
  set wantedT2(String? value) => setField<String>('wanted_t2', value);

  String? get wantedT3 => getField<String>('wanted_t3');
  set wantedT3(String? value) => setField<String>('wanted_t3', value);

  String? get fT1 => getField<String>('f_t1');
  set fT1(String? value) => setField<String>('f_t1', value);

  String? get fT2 => getField<String>('f_t2');
  set fT2(String? value) => setField<String>('f_t2', value);

  String? get fT3 => getField<String>('f_t3');
  set fT3(String? value) => setField<String>('f_t3', value);
}
