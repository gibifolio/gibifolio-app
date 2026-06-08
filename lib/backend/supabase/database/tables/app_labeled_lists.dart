import '../database.dart';

class AppLabeledListsTable extends SupabaseTable<AppLabeledListsRow> {
  @override
  String get tableName => 'app_labeled_lists';

  @override
  AppLabeledListsRow createRow(Map<String, dynamic> data) =>
      AppLabeledListsRow(data);
}

class AppLabeledListsRow extends SupabaseDataRow {
  AppLabeledListsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppLabeledListsTable();

  String? get listId => getField<String>('list_id');
  set listId(String? value) => setField<String>('list_id', value);

  String? get listName => getField<String>('list_name');
  set listName(String? value) => setField<String>('list_name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get bgColor => getField<String>('bg_color');
  set bgColor(String? value) => setField<String>('bg_color', value);

  String? get labelName => getField<String>('label_name');
  set labelName(String? value) => setField<String>('label_name', value);

  int? get itemCount => getField<int>('item_count');
  set itemCount(int? value) => setField<int>('item_count', value);

  String? get thumb1 => getField<String>('thumb1');
  set thumb1(String? value) => setField<String>('thumb1', value);

  String? get thumb2 => getField<String>('thumb2');
  set thumb2(String? value) => setField<String>('thumb2', value);

  String? get thumb3 => getField<String>('thumb3');
  set thumb3(String? value) => setField<String>('thumb3', value);

  String? get sourceUrl => getField<String>('source_url');
  set sourceUrl(String? value) => setField<String>('source_url', value);

  String? get sourceUrlLabel => getField<String>('source_url_label');
  set sourceUrlLabel(String? value) =>
      setField<String>('source_url_label', value);

  String? get sourceAuthor => getField<String>('source_author');
  set sourceAuthor(String? value) => setField<String>('source_author', value);
}
