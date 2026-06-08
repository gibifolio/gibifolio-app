import '../database.dart';

class RecentReleasesCacheTable extends SupabaseTable<RecentReleasesCacheRow> {
  @override
  String get tableName => 'recent_releases_cache';

  @override
  RecentReleasesCacheRow createRow(Map<String, dynamic> data) =>
      RecentReleasesCacheRow(data);
}

class RecentReleasesCacheRow extends SupabaseDataRow {
  RecentReleasesCacheRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RecentReleasesCacheTable();

  String get issueId => getField<String>('issue_id')!;
  set issueId(String value) => setField<String>('issue_id', value);

  String get titleId => getField<String>('title_id')!;
  set titleId(String value) => setField<String>('title_id', value);

  String? get issueNumber => getField<String>('issue_number');
  set issueNumber(String? value) => setField<String>('issue_number', value);

  String? get date => getField<String>('date');
  set date(String? value) => setField<String>('date', value);

  String get titleName => getField<String>('title_name')!;
  set titleName(String value) => setField<String>('title_name', value);

  String? get typeNormalized => getField<String>('type_normalized');
  set typeNormalized(String? value) =>
      setField<String>('type_normalized', value);

  String? get primaryThumb => getField<String>('primary_thumb');
  set primaryThumb(String? value) => setField<String>('primary_thumb', value);

  bool? get isAdult => getField<bool>('is_adult');
  set isAdult(bool? value) => setField<bool>('is_adult', value);

  int get position => getField<int>('position')!;
  set position(int value) => setField<int>('position', value);
}
