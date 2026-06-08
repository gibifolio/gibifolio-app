import '../database.dart';

class TitleStatusesTable extends SupabaseTable<TitleStatusesRow> {
  @override
  String get tableName => 'title_statuses';

  @override
  TitleStatusesRow createRow(Map<String, dynamic> data) =>
      TitleStatusesRow(data);
}

class TitleStatusesRow extends SupabaseDataRow {
  TitleStatusesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TitleStatusesTable();

  int? get statusId => getField<int>('status_id');
  set statusId(int? value) => setField<int>('status_id', value);

  String get statusName => getField<String>('status_name')!;
  set statusName(String value) => setField<String>('status_name', value);
}
