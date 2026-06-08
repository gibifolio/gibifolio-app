import '../database.dart';

class AppIssueStoriesTable extends SupabaseTable<AppIssueStoriesRow> {
  @override
  String get tableName => 'app_issue_stories';

  @override
  AppIssueStoriesRow createRow(Map<String, dynamic> data) =>
      AppIssueStoriesRow(data);
}

class AppIssueStoriesRow extends SupabaseDataRow {
  AppIssueStoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppIssueStoriesTable();

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  int? get seqInIssue => getField<int>('seq_in_issue');
  set seqInIssue(int? value) => setField<int>('seq_in_issue', value);

  bool? get isReprint => getField<bool>('is_reprint');
  set isReprint(bool? value) => setField<bool>('is_reprint', value);

  String? get storyId => getField<String>('story_id');
  set storyId(String? value) => setField<String>('story_id', value);

  String? get storyTitle => getField<String>('story_title');
  set storyTitle(String? value) => setField<String>('story_title', value);

  String? get originalTitle => getField<String>('original_title');
  set originalTitle(String? value) => setField<String>('original_title', value);

  String? get synopsis => getField<String>('synopsis');
  set synopsis(String? value) => setField<String>('synopsis', value);
}
