import '../database.dart';

class ListFollowersTable extends SupabaseTable<ListFollowersRow> {
  @override
  String get tableName => 'list_followers';

  @override
  ListFollowersRow createRow(Map<String, dynamic> data) =>
      ListFollowersRow(data);
}

class ListFollowersRow extends SupabaseDataRow {
  ListFollowersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ListFollowersTable();

  String get listId => getField<String>('list_id')!;
  set listId(String value) => setField<String>('list_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  DateTime? get followedAt => getField<DateTime>('followed_at');
  set followedAt(DateTime? value) => setField<DateTime>('followed_at', value);
}
