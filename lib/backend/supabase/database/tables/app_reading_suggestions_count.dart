import '../database.dart';

class AppReadingSuggestionsCountTable
    extends SupabaseTable<AppReadingSuggestionsCountRow> {
  @override
  String get tableName => 'app_reading_suggestions_count';

  @override
  AppReadingSuggestionsCountRow createRow(Map<String, dynamic> data) =>
      AppReadingSuggestionsCountRow(data);
}

class AppReadingSuggestionsCountRow extends SupabaseDataRow {
  AppReadingSuggestionsCountRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppReadingSuggestionsCountTable();

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);
}
