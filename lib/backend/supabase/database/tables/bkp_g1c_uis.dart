import '../database.dart';

class BkpG1cUisTable extends SupabaseTable<BkpG1cUisRow> {
  @override
  String get tableName => 'bkp_g1c_uis';

  @override
  BkpG1cUisRow createRow(Map<String, dynamic> data) => BkpG1cUisRow(data);
}

class BkpG1cUisRow extends SupabaseDataRow {
  BkpG1cUisRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BkpG1cUisTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  String? get statusReading => getField<String>('status_reading');
  set statusReading(String? value) => setField<String>('status_reading', value);

  String? get statusOwnership => getField<String>('status_ownership');
  set statusOwnership(String? value) =>
      setField<String>('status_ownership', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get bkpAt => getField<DateTime>('bkp_at');
  set bkpAt(DateTime? value) => setField<DateTime>('bkp_at', value);
}
