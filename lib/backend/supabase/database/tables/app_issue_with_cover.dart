import '../database.dart';

class AppIssueWithCoverTable extends SupabaseTable<AppIssueWithCoverRow> {
  @override
  String get tableName => 'app_issue_with_cover';

  @override
  AppIssueWithCoverRow createRow(Map<String, dynamic> data) =>
      AppIssueWithCoverRow(data);
}

class AppIssueWithCoverRow extends SupabaseDataRow {
  AppIssueWithCoverRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppIssueWithCoverTable();

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

  String? get typeNormalized => getField<String>('type_normalized');
  set typeNormalized(String? value) =>
      setField<String>('type_normalized', value);

  bool? get isAdult => getField<bool>('is_adult');
  set isAdult(bool? value) => setField<bool>('is_adult', value);

  String? get titleCanonicalKey => getField<String>('title_canonical_key');
  set titleCanonicalKey(String? value) =>
      setField<String>('title_canonical_key', value);

  String? get primaryVariantId => getField<String>('primary_variant_id');
  set primaryVariantId(String? value) =>
      setField<String>('primary_variant_id', value);

  String? get thumbLocalPath => getField<String>('thumb_local_path');
  set thumbLocalPath(String? value) =>
      setField<String>('thumb_local_path', value);

  String? get coverLocalPath => getField<String>('cover_local_path');
  set coverLocalPath(String? value) =>
      setField<String>('cover_local_path', value);

  double? get sortOrder => getField<double>('sort_order');
  set sortOrder(double? value) => setField<double>('sort_order', value);

  bool? get hasStatus => getField<bool>('has_status');
  set hasStatus(bool? value) => setField<bool>('has_status', value);

  String? get statusOwnership => getField<String>('status_ownership');
  set statusOwnership(String? value) =>
      setField<String>('status_ownership', value);

  String? get statusReading => getField<String>('status_reading');
  set statusReading(String? value) => setField<String>('status_reading', value);

  String? get issueNameKey => getField<String>('issue_name_key');
  set issueNameKey(String? value) => setField<String>('issue_name_key', value);

  String? get issueSubtitleKey => getField<String>('issue_subtitle_key');
  set issueSubtitleKey(String? value) =>
      setField<String>('issue_subtitle_key', value);
}
