import '../database.dart';

class BackupMarvelEssenciaisListItemsTable
    extends SupabaseTable<BackupMarvelEssenciaisListItemsRow> {
  @override
  String get tableName => '_backup_marvel_essenciais_list_items';

  @override
  BackupMarvelEssenciaisListItemsRow createRow(Map<String, dynamic> data) =>
      BackupMarvelEssenciaisListItemsRow(data);
}

class BackupMarvelEssenciaisListItemsRow extends SupabaseDataRow {
  BackupMarvelEssenciaisListItemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BackupMarvelEssenciaisListItemsTable();

  String? get listId => getField<String>('list_id');
  set listId(String? value) => setField<String>('list_id', value);

  String? get entityType => getField<String>('entity_type');
  set entityType(String? value) => setField<String>('entity_type', value);

  String? get entityId => getField<String>('entity_id');
  set entityId(String? value) => setField<String>('entity_id', value);

  int? get position => getField<int>('position');
  set position(int? value) => setField<int>('position', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  DateTime? get addedAt => getField<DateTime>('added_at');
  set addedAt(DateTime? value) => setField<DateTime>('added_at', value);
}
