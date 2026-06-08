import '../database.dart';

class BackupMarvelEssenciaisIssuesTable
    extends SupabaseTable<BackupMarvelEssenciaisIssuesRow> {
  @override
  String get tableName => '_backup_marvel_essenciais_issues';

  @override
  BackupMarvelEssenciaisIssuesRow createRow(Map<String, dynamic> data) =>
      BackupMarvelEssenciaisIssuesRow(data);
}

class BackupMarvelEssenciaisIssuesRow extends SupabaseDataRow {
  BackupMarvelEssenciaisIssuesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BackupMarvelEssenciaisIssuesTable();

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
}
