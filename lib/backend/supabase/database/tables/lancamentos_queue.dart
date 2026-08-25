import '../database.dart';

class LancamentosQueueTable extends SupabaseTable<LancamentosQueueRow> {
  @override
  String get tableName => 'lancamentos_queue';

  @override
  LancamentosQueueRow createRow(Map<String, dynamic> data) =>
      LancamentosQueueRow(data);
}

class LancamentosQueueRow extends SupabaseDataRow {
  LancamentosQueueRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LancamentosQueueTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get uploadId => getField<String>('upload_id')!;
  set uploadId(String value) => setField<String>('upload_id', value);

  String get gdqNumericId => getField<String>('gdq_numeric_id')!;
  set gdqNumericId(String value) => setField<String>('gdq_numeric_id', value);

  String get gdqIssueUrl => getField<String>('gdq_issue_url')!;
  set gdqIssueUrl(String value) => setField<String>('gdq_issue_url', value);

  String? get publisherLabel => getField<String>('publisher_label');
  set publisherLabel(String? value) =>
      setField<String>('publisher_label', value);

  String? get publisherId => getField<String>('publisher_id');
  set publisherId(String? value) => setField<String>('publisher_id', value);

  String? get titleNameRaw => getField<String>('title_name_raw');
  set titleNameRaw(String? value) => setField<String>('title_name_raw', value);

  String? get issueNumber => getField<String>('issue_number');
  set issueNumber(String? value) => setField<String>('issue_number', value);

  DateTime? get releaseDate => getField<DateTime>('release_date');
  set releaseDate(DateTime? value) => setField<DateTime>('release_date', value);

  String? get matchedTitleId => getField<String>('matched_title_id');
  set matchedTitleId(String? value) =>
      setField<String>('matched_title_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get adiadoEm => getField<DateTime>('adiado_em');
  set adiadoEm(DateTime? value) => setField<DateTime>('adiado_em', value);

  DateTime? get descartadoEm => getField<DateTime>('descartado_em');
  set descartadoEm(DateTime? value) =>
      setField<DateTime>('descartado_em', value);
}
