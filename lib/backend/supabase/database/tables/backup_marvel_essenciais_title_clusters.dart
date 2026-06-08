import '../database.dart';

class BackupMarvelEssenciaisTitleClustersTable
    extends SupabaseTable<BackupMarvelEssenciaisTitleClustersRow> {
  @override
  String get tableName => '_backup_marvel_essenciais_title_clusters';

  @override
  BackupMarvelEssenciaisTitleClustersRow createRow(Map<String, dynamic> data) =>
      BackupMarvelEssenciaisTitleClustersRow(data);
}

class BackupMarvelEssenciaisTitleClustersRow extends SupabaseDataRow {
  BackupMarvelEssenciaisTitleClustersRow(Map<String, dynamic> data)
      : super(data);

  @override
  SupabaseTable get table => BackupMarvelEssenciaisTitleClustersTable();

  String? get titleId => getField<String>('title_id');
  set titleId(String? value) => setField<String>('title_id', value);

  String? get clusterId => getField<String>('cluster_id');
  set clusterId(String? value) => setField<String>('cluster_id', value);
}
