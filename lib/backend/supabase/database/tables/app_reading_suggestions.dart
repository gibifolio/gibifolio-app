import '../database.dart';

class AppReadingSuggestionsTable
    extends SupabaseTable<AppReadingSuggestionsRow> {
  @override
  String get tableName => 'app_reading_suggestions';

  @override
  AppReadingSuggestionsRow createRow(Map<String, dynamic> data) =>
      AppReadingSuggestionsRow(data);
}

class AppReadingSuggestionsRow extends SupabaseDataRow {
  AppReadingSuggestionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppReadingSuggestionsTable();

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  String? get titleId => getField<String>('title_id');
  set titleId(String? value) => setField<String>('title_id', value);

  String? get titleName => getField<String>('title_name');
  set titleName(String? value) => setField<String>('title_name', value);

  String? get titleSubtitle => getField<String>('title_subtitle');
  set titleSubtitle(String? value) => setField<String>('title_subtitle', value);

  String? get typeNormalized => getField<String>('type_normalized');
  set typeNormalized(String? value) =>
      setField<String>('type_normalized', value);

  bool? get isAdult => getField<bool>('is_adult');
  set isAdult(bool? value) => setField<bool>('is_adult', value);

  String? get issueNumber => getField<String>('issue_number');
  set issueNumber(String? value) => setField<String>('issue_number', value);

  String? get date => getField<String>('date');
  set date(String? value) => setField<String>('date', value);

  String? get thumbLocalPath => getField<String>('thumb_local_path');
  set thumbLocalPath(String? value) =>
      setField<String>('thumb_local_path', value);

  String? get preTitle => getField<String>('pre_title');
  set preTitle(String? value) => setField<String>('pre_title', value);

  String? get formatLabel => getField<String>('format_label');
  set formatLabel(String? value) => setField<String>('format_label', value);
}
