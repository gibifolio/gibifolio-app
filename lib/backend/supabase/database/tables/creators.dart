import '../database.dart';

class CreatorsTable extends SupabaseTable<CreatorsRow> {
  @override
  String get tableName => 'creators';

  @override
  CreatorsRow createRow(Map<String, dynamic> data) => CreatorsRow(data);
}

class CreatorsRow extends SupabaseDataRow {
  CreatorsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CreatorsTable();

  String get creatorId => getField<String>('creator_id')!;
  set creatorId(String value) => setField<String>('creator_id', value);

  String get creatorName => getField<String>('creator_name')!;
  set creatorName(String value) => setField<String>('creator_name', value);

  String? get country => getField<String>('country');
  set country(String? value) => setField<String>('country', value);

  dynamic get aliasesJson => getField<dynamic>('aliases_json');
  set aliasesJson(dynamic value) => setField<dynamic>('aliases_json', value);

  String? get creatorCanonicalKey => getField<String>('creator_canonical_key');
  set creatorCanonicalKey(String? value) =>
      setField<String>('creator_canonical_key', value);

  String? get parseStatus => getField<String>('parse_status');
  set parseStatus(String? value) => setField<String>('parse_status', value);

  String? get parseNotes => getField<String>('parse_notes');
  set parseNotes(String? value) => setField<String>('parse_notes', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get gdqId => getField<int>('gdq_id');
  set gdqId(int? value) => setField<int>('gdq_id', value);

  String? get gdqUrl => getField<String>('gdq_url');
  set gdqUrl(String? value) => setField<String>('gdq_url', value);
}
