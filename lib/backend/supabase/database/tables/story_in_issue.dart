import '../database.dart';

class StoryInIssueTable extends SupabaseTable<StoryInIssueRow> {
  @override
  String get tableName => 'story_in_issue';

  @override
  StoryInIssueRow createRow(Map<String, dynamic> data) => StoryInIssueRow(data);
}

class StoryInIssueRow extends SupabaseDataRow {
  StoryInIssueRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StoryInIssueTable();

  String get storyId => getField<String>('story_id')!;
  set storyId(String value) => setField<String>('story_id', value);

  String get issueId => getField<String>('issue_id')!;
  set issueId(String value) => setField<String>('issue_id', value);

  int? get seqInIssue => getField<int>('seq_in_issue');
  set seqInIssue(int? value) => setField<int>('seq_in_issue', value);

  int? get pageStart => getField<int>('page_start');
  set pageStart(int? value) => setField<int>('page_start', value);

  int? get pageEnd => getField<int>('page_end');
  set pageEnd(int? value) => setField<int>('page_end', value);

  bool? get isReprint => getField<bool>('is_reprint');
  set isReprint(bool? value) => setField<bool>('is_reprint', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get originIssueId => getField<String>('origin_issue_id');
  set originIssueId(String? value) =>
      setField<String>('origin_issue_id', value);
}
