import '../database.dart';

class ClustersTable extends SupabaseTable<ClustersRow> {
  @override
  String get tableName => 'clusters';

  @override
  ClustersRow createRow(Map<String, dynamic> data) => ClustersRow(data);
}

class ClustersRow extends SupabaseDataRow {
  ClustersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClustersTable();

  String get clusterId => getField<String>('cluster_id')!;
  set clusterId(String value) => setField<String>('cluster_id', value);

  String? get universeId => getField<String>('universe_id');
  set universeId(String? value) => setField<String>('universe_id', value);

  String get clusterName => getField<String>('cluster_name')!;
  set clusterName(String value) => setField<String>('cluster_name', value);
}
