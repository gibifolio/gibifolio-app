import '../database.dart';

class AppStoryCreditsTable extends SupabaseTable<AppStoryCreditsRow> {
  @override
  String get tableName => 'app_story_credits';

  @override
  AppStoryCreditsRow createRow(Map<String, dynamic> data) =>
      AppStoryCreditsRow(data);
}

class AppStoryCreditsRow extends SupabaseDataRow {
  AppStoryCreditsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppStoryCreditsTable();

  String? get storyId => getField<String>('story_id');
  set storyId(String? value) => setField<String>('story_id', value);

  String? get creatorId => getField<String>('creator_id');
  set creatorId(String? value) => setField<String>('creator_id', value);

  String? get creatorName => getField<String>('creator_name');
  set creatorName(String? value) => setField<String>('creator_name', value);

  String? get roleName => getField<String>('role_name');
  set roleName(String? value) => setField<String>('role_name', value);
}
