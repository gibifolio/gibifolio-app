import '../database.dart';

class UserListOrderTable extends SupabaseTable<UserListOrderRow> {
  @override
  String get tableName => 'user_list_order';

  @override
  UserListOrderRow createRow(Map<String, dynamic> data) =>
      UserListOrderRow(data);
}

class UserListOrderRow extends SupabaseDataRow {
  UserListOrderRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserListOrderTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get listId => getField<String>('list_id')!;
  set listId(String value) => setField<String>('list_id', value);

  int get position => getField<int>('position')!;
  set position(int value) => setField<int>('position', value);
}
