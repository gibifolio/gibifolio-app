import '../database.dart';

class AppReleasesUpcomingTable extends SupabaseTable<AppReleasesUpcomingRow> {
  @override
  String get tableName => 'app_releases_upcoming';

  @override
  AppReleasesUpcomingRow createRow(Map<String, dynamic> data) =>
      AppReleasesUpcomingRow(data);
}

class AppReleasesUpcomingRow extends SupabaseDataRow {
  AppReleasesUpcomingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppReleasesUpcomingTable();

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

  String? get canonicalKey => getField<String>('canonical_key');
  set canonicalKey(String? value) => setField<String>('canonical_key', value);

  String? get typeNormalized => getField<String>('type_normalized');
  set typeNormalized(String? value) =>
      setField<String>('type_normalized', value);

  String? get publisherId => getField<String>('publisher_id');
  set publisherId(String? value) => setField<String>('publisher_id', value);

  String? get publisherName => getField<String>('publisher_name');
  set publisherName(String? value) => setField<String>('publisher_name', value);

  String? get primaryThumb => getField<String>('primary_thumb');
  set primaryThumb(String? value) => setField<String>('primary_thumb', value);

  bool? get isAdult => getField<bool>('is_adult');
  set isAdult(bool? value) => setField<bool>('is_adult', value);

  String? get preTitle => getField<String>('pre_title');
  set preTitle(String? value) => setField<String>('pre_title', value);

  String? get formatLabel => getField<String>('format_label');
  set formatLabel(String? value) => setField<String>('format_label', value);
}
