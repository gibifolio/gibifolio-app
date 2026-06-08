import '../database.dart';

class AppLibraryTitlesTable extends SupabaseTable<AppLibraryTitlesRow> {
  @override
  String get tableName => 'app_library_titles';

  @override
  AppLibraryTitlesRow createRow(Map<String, dynamic> data) =>
      AppLibraryTitlesRow(data);
}

class AppLibraryTitlesRow extends SupabaseDataRow {
  AppLibraryTitlesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppLibraryTitlesTable();

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

  int? get issueCount => getField<int>('issue_count');
  set issueCount(int? value) => setField<int>('issue_count', value);

  String? get singleIssueId => getField<String>('single_issue_id');
  set singleIssueId(String? value) =>
      setField<String>('single_issue_id', value);

  int? get singleIssuePages => getField<int>('single_issue_pages');
  set singleIssuePages(int? value) =>
      setField<int>('single_issue_pages', value);

  String? get firstStatusIssueId => getField<String>('first_status_issue_id');
  set firstStatusIssueId(String? value) =>
      setField<String>('first_status_issue_id', value);

  String? get statusThumb => getField<String>('status_thumb');
  set statusThumb(String? value) => setField<String>('status_thumb', value);

  String? get statusThumb2 => getField<String>('status_thumb_2');
  set statusThumb2(String? value) => setField<String>('status_thumb_2', value);

  String? get statusThumb3 => getField<String>('status_thumb_3');
  set statusThumb3(String? value) => setField<String>('status_thumb_3', value);

  String? get firstIssueThumb => getField<String>('first_issue_thumb');
  set firstIssueThumb(String? value) =>
      setField<String>('first_issue_thumb', value);

  String? get secondIssueThumb => getField<String>('second_issue_thumb');
  set secondIssueThumb(String? value) =>
      setField<String>('second_issue_thumb', value);

  String? get thirdIssueThumb => getField<String>('third_issue_thumb');
  set thirdIssueThumb(String? value) =>
      setField<String>('third_issue_thumb', value);

  String? get singleSavedIssueId => getField<String>('single_saved_issue_id');
  set singleSavedIssueId(String? value) =>
      setField<String>('single_saved_issue_id', value);

  bool? get hasOwned => getField<bool>('has_owned');
  set hasOwned(bool? value) => setField<bool>('has_owned', value);

  bool? get hasWanted => getField<bool>('has_wanted');
  set hasWanted(bool? value) => setField<bool>('has_wanted', value);

  bool? get hasReading => getField<bool>('has_reading');
  set hasReading(bool? value) => setField<bool>('has_reading', value);

  bool? get hasRead => getField<bool>('has_read');
  set hasRead(bool? value) => setField<bool>('has_read', value);
}
