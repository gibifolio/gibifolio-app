import '../database.dart';

class AppRecentReleasesTable extends SupabaseTable<AppRecentReleasesRow> {
  @override
  String get tableName => 'app_recent_releases';

  @override
  AppRecentReleasesRow createRow(Map<String, dynamic> data) =>
      AppRecentReleasesRow(data);
}

class AppRecentReleasesRow extends SupabaseDataRow {
  AppRecentReleasesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppRecentReleasesTable();

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  String? get titleId => getField<String>('title_id');
  set titleId(String? value) => setField<String>('title_id', value);

  String? get issueNumber => getField<String>('issue_number');
  set issueNumber(String? value) => setField<String>('issue_number', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  String? get titleName => getField<String>('title_name');
  set titleName(String? value) => setField<String>('title_name', value);

  String? get typeNormalized => getField<String>('type_normalized');
  set typeNormalized(String? value) =>
      setField<String>('type_normalized', value);

  String? get primaryThumb => getField<String>('primary_thumb');
  set primaryThumb(String? value) => setField<String>('primary_thumb', value);

  bool? get isAdult => getField<bool>('is_adult');
  set isAdult(bool? value) => setField<bool>('is_adult', value);

  String? get preTitle => getField<String>('pre_title');
  set preTitle(String? value) => setField<String>('pre_title', value);

  String? get formatLabel => getField<String>('format_label');
  set formatLabel(String? value) => setField<String>('format_label', value);
}
