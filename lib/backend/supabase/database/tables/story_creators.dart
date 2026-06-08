import '../database.dart';

class StoryCreatorsTable extends SupabaseTable<StoryCreatorsRow> {
  @override
  String get tableName => 'story_creators';

  @override
  StoryCreatorsRow createRow(Map<String, dynamic> data) =>
      StoryCreatorsRow(data);
}

class StoryCreatorsRow extends SupabaseDataRow {
  StoryCreatorsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StoryCreatorsTable();

  String get storyId => getField<String>('story_id')!;
  set storyId(String value) => setField<String>('story_id', value);

  String get creatorId => getField<String>('creator_id')!;
  set creatorId(String value) => setField<String>('creator_id', value);

  String get roleName => getField<String>('role_name')!;
  set roleName(String value) => setField<String>('role_name', value);

  String? get creditNotes => getField<String>('credit_notes');
  set creditNotes(String? value) => setField<String>('credit_notes', value);
}
