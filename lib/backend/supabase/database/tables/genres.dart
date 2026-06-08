import '../database.dart';

class GenresTable extends SupabaseTable<GenresRow> {
  @override
  String get tableName => 'genres';

  @override
  GenresRow createRow(Map<String, dynamic> data) => GenresRow(data);
}

class GenresRow extends SupabaseDataRow {
  GenresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GenresTable();

  int? get genreId => getField<int>('genre_id');
  set genreId(int? value) => setField<int>('genre_id', value);

  String get genreName => getField<String>('genre_name')!;
  set genreName(String value) => setField<String>('genre_name', value);
}
