import '../database.dart';

class PublicProfilesTable extends SupabaseTable<PublicProfilesRow> {
  @override
  String get tableName => 'public_profiles';

  @override
  PublicProfilesRow createRow(Map<String, dynamic> data) =>
      PublicProfilesRow(data);
}

class PublicProfilesRow extends SupabaseDataRow {
  PublicProfilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PublicProfilesTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get profileSlug => getField<String>('profile_slug');
  set profileSlug(String? value) => setField<String>('profile_slug', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);

  String? get bio => getField<String>('bio');
  set bio(String? value) => setField<String>('bio', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);
}
