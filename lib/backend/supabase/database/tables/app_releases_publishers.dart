import '../database.dart';

class AppReleasesPublishersTable
    extends SupabaseTable<AppReleasesPublishersRow> {
  @override
  String get tableName => 'app_releases_publishers';

  @override
  AppReleasesPublishersRow createRow(Map<String, dynamic> data) =>
      AppReleasesPublishersRow(data);
}

class AppReleasesPublishersRow extends SupabaseDataRow {
  AppReleasesPublishersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppReleasesPublishersTable();

  String get publisherId => getField<String>('publisher_id')!;
  set publisherId(String value) => setField<String>('publisher_id', value);

  String get publisherName => getField<String>('publisher_name')!;
  set publisherName(String value) => setField<String>('publisher_name', value);

  int get issueCount => getField<int>('issue_count')!;
  set issueCount(int value) => setField<int>('issue_count', value);
}
