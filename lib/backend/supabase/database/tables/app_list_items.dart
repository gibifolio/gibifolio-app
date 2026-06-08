import '../database.dart';

class AppListItemsTable extends SupabaseTable<AppListItemsRow> {
  @override
  String get tableName => 'app_list_items';

  @override
  AppListItemsRow createRow(Map<String, dynamic> data) => AppListItemsRow(data);
}

class AppListItemsRow extends SupabaseDataRow {
  AppListItemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppListItemsTable();

  String? get listId => getField<String>('list_id');
  set listId(String? value) => setField<String>('list_id', value);

  String? get entityType => getField<String>('entity_type');
  set entityType(String? value) => setField<String>('entity_type', value);

  String? get entityId => getField<String>('entity_id');
  set entityId(String? value) => setField<String>('entity_id', value);

  int? get position => getField<int>('position');
  set position(int? value) => setField<int>('position', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get titleName => getField<String>('title_name');
  set titleName(String? value) => setField<String>('title_name', value);

  String? get titleSubtitle => getField<String>('title_subtitle');
  set titleSubtitle(String? value) => setField<String>('title_subtitle', value);

  String? get titleId => getField<String>('title_id');
  set titleId(String? value) => setField<String>('title_id', value);

  String? get publisherName => getField<String>('publisher_name');
  set publisherName(String? value) => setField<String>('publisher_name', value);

  String? get licensors => getField<String>('licensors');
  set licensors(String? value) => setField<String>('licensors', value);

  String? get series => getField<String>('series');
  set series(String? value) => setField<String>('series', value);

  String? get typeNormalized => getField<String>('type_normalized');
  set typeNormalized(String? value) =>
      setField<String>('type_normalized', value);

  String? get publicationStatus => getField<String>('publication_status');
  set publicationStatus(String? value) =>
      setField<String>('publication_status', value);

  String? get issueName => getField<String>('issue_name');
  set issueName(String? value) => setField<String>('issue_name', value);

  String? get issueSubtitle => getField<String>('issue_subtitle');
  set issueSubtitle(String? value) => setField<String>('issue_subtitle', value);

  String? get issueNumber => getField<String>('issue_number');
  set issueNumber(String? value) => setField<String>('issue_number', value);

  DateTime? get issueDate => getField<DateTime>('issue_date');
  set issueDate(DateTime? value) => setField<DateTime>('issue_date', value);

  int? get issuePages => getField<int>('issue_pages');
  set issuePages(int? value) => setField<int>('issue_pages', value);

  int? get issueCount => getField<int>('issue_count');
  set issueCount(int? value) => setField<int>('issue_count', value);

  String? get singleIssueId => getField<String>('single_issue_id');
  set singleIssueId(String? value) =>
      setField<String>('single_issue_id', value);

  int? get singleIssuePages => getField<int>('single_issue_pages');
  set singleIssuePages(int? value) =>
      setField<int>('single_issue_pages', value);

  String? get thumbLocalPath => getField<String>('thumb_local_path');
  set thumbLocalPath(String? value) =>
      setField<String>('thumb_local_path', value);

  String? get thumb2LocalPath => getField<String>('thumb2_local_path');
  set thumb2LocalPath(String? value) =>
      setField<String>('thumb2_local_path', value);

  String? get thumb3LocalPath => getField<String>('thumb3_local_path');
  set thumb3LocalPath(String? value) =>
      setField<String>('thumb3_local_path', value);

  String? get statusReading => getField<String>('status_reading');
  set statusReading(String? value) => setField<String>('status_reading', value);

  String? get statusOwnership => getField<String>('status_ownership');
  set statusOwnership(String? value) =>
      setField<String>('status_ownership', value);

  String? get titleStatusReading => getField<String>('title_status_reading');
  set titleStatusReading(String? value) =>
      setField<String>('title_status_reading', value);

  String? get titleStatusOwnership =>
      getField<String>('title_status_ownership');
  set titleStatusOwnership(String? value) =>
      setField<String>('title_status_ownership', value);

  bool? get isAdult => getField<bool>('is_adult');
  set isAdult(bool? value) => setField<bool>('is_adult', value);

  int? get displayOrder => getField<int>('display_order');
  set displayOrder(int? value) => setField<int>('display_order', value);
}
