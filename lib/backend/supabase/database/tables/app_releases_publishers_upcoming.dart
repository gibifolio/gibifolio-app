import '../database.dart';

class AppReleasesPublishersUpcomingTable
    extends SupabaseTable<AppReleasesPublishersUpcomingRow> {
  @override
  String get tableName => 'app_releases_publishers_upcoming';

  @override
  AppReleasesPublishersUpcomingRow createRow(Map<String, dynamic> data) =>
      AppReleasesPublishersUpcomingRow(data);
}

class AppReleasesPublishersUpcomingRow extends SupabaseDataRow {
  AppReleasesPublishersUpcomingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppReleasesPublishersUpcomingTable();

  String? get publisherId => getField<String>('publisher_id');
  set publisherId(String? value) => setField<String>('publisher_id', value);

  String? get publisherName => getField<String>('publisher_name');
  set publisherName(String? value) => setField<String>('publisher_name', value);

  int? get issueCount => getField<int>('issue_count');
  set issueCount(int? value) => setField<int>('issue_count', value);
}
