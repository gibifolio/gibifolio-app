import '../database.dart';

class BkpDupIssues20260727Table extends SupabaseTable<BkpDupIssues20260727Row> {
  @override
  String get tableName => 'bkp_dup_issues_20260727';

  @override
  BkpDupIssues20260727Row createRow(Map<String, dynamic> data) =>
      BkpDupIssues20260727Row(data);
}

class BkpDupIssues20260727Row extends SupabaseDataRow {
  BkpDupIssues20260727Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BkpDupIssues20260727Table();

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  String? get titleId => getField<String>('title_id');
  set titleId(String? value) => setField<String>('title_id', value);

  String? get urlGdqIssue => getField<String>('url_gdq_issue');
  set urlGdqIssue(String? value) => setField<String>('url_gdq_issue', value);

  String? get coverThumbnailSource =>
      getField<String>('cover_thumbnail_source');
  set coverThumbnailSource(String? value) =>
      setField<String>('cover_thumbnail_source', value);

  String? get issueName => getField<String>('issue_name');
  set issueName(String? value) => setField<String>('issue_name', value);

  String? get issueSubtitle => getField<String>('issue_subtitle');
  set issueSubtitle(String? value) => setField<String>('issue_subtitle', value);

  String? get issueNumber => getField<String>('issue_number');
  set issueNumber(String? value) => setField<String>('issue_number', value);

  int? get pages => getField<int>('pages');
  set pages(int? value) => setField<int>('pages', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  String? get issuePrimaryVariantId =>
      getField<String>('issue_primary_variant_id');
  set issuePrimaryVariantId(String? value) =>
      setField<String>('issue_primary_variant_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get contentParseStatus => getField<String>('content_parse_status');
  set contentParseStatus(String? value) =>
      setField<String>('content_parse_status', value);

  String? get contentParseNotes => getField<String>('content_parse_notes');
  set contentParseNotes(String? value) =>
      setField<String>('content_parse_notes', value);

  DateTime? get contentParsedAt => getField<DateTime>('content_parsed_at');
  set contentParsedAt(DateTime? value) =>
      setField<DateTime>('content_parsed_at', value);

  String? get urlPublisherIssue => getField<String>('url_publisher_issue');
  set urlPublisherIssue(String? value) =>
      setField<String>('url_publisher_issue', value);

  String? get ageRating => getField<String>('age_rating');
  set ageRating(String? value) => setField<String>('age_rating', value);

  String? get legacyNumber => getField<String>('legacy_number');
  set legacyNumber(String? value) => setField<String>('legacy_number', value);

  String? get publisherSyncStatus => getField<String>('publisher_sync_status');
  set publisherSyncStatus(String? value) =>
      setField<String>('publisher_sync_status', value);

  DateTime? get publisherSyncedAt => getField<DateTime>('publisher_synced_at');
  set publisherSyncedAt(DateTime? value) =>
      setField<DateTime>('publisher_synced_at', value);

  String? get gdqIssueId => getField<String>('gdq_issue_id');
  set gdqIssueId(String? value) => setField<String>('gdq_issue_id', value);
}
