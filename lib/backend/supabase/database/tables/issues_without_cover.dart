import '../database.dart';

class IssuesWithoutCoverTable extends SupabaseTable<IssuesWithoutCoverRow> {
  @override
  String get tableName => 'issues_without_cover';

  @override
  IssuesWithoutCoverRow createRow(Map<String, dynamic> data) =>
      IssuesWithoutCoverRow(data);
}

class IssuesWithoutCoverRow extends SupabaseDataRow {
  IssuesWithoutCoverRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => IssuesWithoutCoverTable();

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
}
