import '../database.dart';

class AppCreatorStoriesTable extends SupabaseTable<AppCreatorStoriesRow> {
  @override
  String get tableName => 'app_creator_stories';

  @override
  AppCreatorStoriesRow createRow(Map<String, dynamic> data) =>
      AppCreatorStoriesRow(data);
}

class AppCreatorStoriesRow extends SupabaseDataRow {
  AppCreatorStoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppCreatorStoriesTable();

  String? get creatorId => getField<String>('creator_id');
  set creatorId(String? value) => setField<String>('creator_id', value);

  String? get roles => getField<String>('roles');
  set roles(String? value) => setField<String>('roles', value);

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  String? get issueNumber => getField<String>('issue_number');
  set issueNumber(String? value) => setField<String>('issue_number', value);

  String? get issueName => getField<String>('issue_name');
  set issueName(String? value) => setField<String>('issue_name', value);

  String? get issueSubtitle => getField<String>('issue_subtitle');
  set issueSubtitle(String? value) => setField<String>('issue_subtitle', value);

  int? get issuePages => getField<int>('issue_pages');
  set issuePages(int? value) => setField<int>('issue_pages', value);

  DateTime? get issueDate => getField<DateTime>('issue_date');
  set issueDate(DateTime? value) => setField<DateTime>('issue_date', value);

  String? get titleId => getField<String>('title_id');
  set titleId(String? value) => setField<String>('title_id', value);

  String? get titleName => getField<String>('title_name');
  set titleName(String? value) => setField<String>('title_name', value);

  String? get titleSubtitle => getField<String>('title_subtitle');
  set titleSubtitle(String? value) => setField<String>('title_subtitle', value);

  String? get series => getField<String>('series');
  set series(String? value) => setField<String>('series', value);

  String? get licensors => getField<String>('licensors');
  set licensors(String? value) => setField<String>('licensors', value);

  bool? get isAdult => getField<bool>('is_adult');
  set isAdult(bool? value) => setField<bool>('is_adult', value);

  String? get publisherName => getField<String>('publisher_name');
  set publisherName(String? value) => setField<String>('publisher_name', value);

  String? get thumbLocalPath => getField<String>('thumb_local_path');
  set thumbLocalPath(String? value) =>
      setField<String>('thumb_local_path', value);
}
