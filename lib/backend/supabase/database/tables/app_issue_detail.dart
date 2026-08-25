import '../database.dart';

class AppIssueDetailTable extends SupabaseTable<AppIssueDetailRow> {
  @override
  String get tableName => 'app_issue_detail';

  @override
  AppIssueDetailRow createRow(Map<String, dynamic> data) =>
      AppIssueDetailRow(data);
}

class AppIssueDetailRow extends SupabaseDataRow {
  AppIssueDetailRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppIssueDetailTable();

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  String? get titleId => getField<String>('title_id');
  set titleId(String? value) => setField<String>('title_id', value);

  String? get issueNumber => getField<String>('issue_number');
  set issueNumber(String? value) => setField<String>('issue_number', value);

  String? get issueName => getField<String>('issue_name');
  set issueName(String? value) => setField<String>('issue_name', value);

  String? get issueSubtitle => getField<String>('issue_subtitle');
  set issueSubtitle(String? value) => setField<String>('issue_subtitle', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  int? get pages => getField<int>('pages');
  set pages(int? value) => setField<int>('pages', value);

  String? get urlGdqIssue => getField<String>('url_gdq_issue');
  set urlGdqIssue(String? value) => setField<String>('url_gdq_issue', value);

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

  String? get publisherId => getField<String>('publisher_id');
  set publisherId(String? value) => setField<String>('publisher_id', value);

  bool? get isAdult => getField<bool>('is_adult');
  set isAdult(bool? value) => setField<bool>('is_adult', value);

  String? get publisherName => getField<String>('publisher_name');
  set publisherName(String? value) => setField<String>('publisher_name', value);

  String? get licensors => getField<String>('licensors');
  set licensors(String? value) => setField<String>('licensors', value);

  String? get genreName => getField<String>('genre_name');
  set genreName(String? value) => setField<String>('genre_name', value);

  String? get typeName => getField<String>('type_name');
  set typeName(String? value) => setField<String>('type_name', value);

  String? get primaryVariantId => getField<String>('primary_variant_id');
  set primaryVariantId(String? value) =>
      setField<String>('primary_variant_id', value);

  String? get thumbLocalPath => getField<String>('thumb_local_path');
  set thumbLocalPath(String? value) =>
      setField<String>('thumb_local_path', value);

  String? get coverLocalPath => getField<String>('cover_local_path');
  set coverLocalPath(String? value) =>
      setField<String>('cover_local_path', value);

  String? get primaryVariantLabel => getField<String>('primary_variant_label');
  set primaryVariantLabel(String? value) =>
      setField<String>('primary_variant_label', value);

  int? get variantCount => getField<int>('variant_count');
  set variantCount(int? value) => setField<int>('variant_count', value);

  bool? get isSingleIssue => getField<bool>('is_single_issue');
  set isSingleIssue(bool? value) => setField<bool>('is_single_issue', value);

  String? get preTitle => getField<String>('pre_title');
  set preTitle(String? value) => setField<String>('pre_title', value);

  String? get formatLabel => getField<String>('format_label');
  set formatLabel(String? value) => setField<String>('format_label', value);
}
