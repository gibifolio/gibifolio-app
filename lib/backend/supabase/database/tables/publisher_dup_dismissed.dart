import '../database.dart';

class PublisherDupDismissedTable
    extends SupabaseTable<PublisherDupDismissedRow> {
  @override
  String get tableName => 'publisher_dup_dismissed';

  @override
  PublisherDupDismissedRow createRow(Map<String, dynamic> data) =>
      PublisherDupDismissedRow(data);
}

class PublisherDupDismissedRow extends SupabaseDataRow {
  PublisherDupDismissedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PublisherDupDismissedTable();

  String get key => getField<String>('key')!;
  set key(String value) => setField<String>('key', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);
}
