import '../database.dart';

class TitleClustersTable extends SupabaseTable<TitleClustersRow> {
  @override
  String get tableName => 'title_clusters';

  @override
  TitleClustersRow createRow(Map<String, dynamic> data) =>
      TitleClustersRow(data);
}

class TitleClustersRow extends SupabaseDataRow {
  TitleClustersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TitleClustersTable();

  String get titleId => getField<String>('title_id')!;
  set titleId(String value) => setField<String>('title_id', value);

  String get clusterId => getField<String>('cluster_id')!;
  set clusterId(String value) => setField<String>('cluster_id', value);
}
