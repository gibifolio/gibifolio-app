import '../database.dart';

class FeatureEventsTable extends SupabaseTable<FeatureEventsRow> {
  @override
  String get tableName => 'feature_events';

  @override
  FeatureEventsRow createRow(Map<String, dynamic> data) =>
      FeatureEventsRow(data);
}

class FeatureEventsRow extends SupabaseDataRow {
  FeatureEventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FeatureEventsTable();

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String get feature => getField<String>('feature')!;
  set feature(String value) => setField<String>('feature', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get listId => getField<String>('list_id');
  set listId(String? value) => setField<String>('list_id', value);

  int? get itemCount => getField<int>('item_count');
  set itemCount(int? value) => setField<int>('item_count', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
