import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  DateTime? get birthDate => getField<DateTime>('birth_date');
  set birthDate(DateTime? value) => setField<DateTime>('birth_date', value);

  DateTime? get termsAcceptedAt => getField<DateTime>('terms_accepted_at');
  set termsAcceptedAt(DateTime? value) =>
      setField<DateTime>('terms_accepted_at', value);

  String? get termsVersion => getField<String>('terms_version');
  set termsVersion(String? value) => setField<String>('terms_version', value);

  String? get termsAcceptedIp => getField<String>('terms_accepted_ip');
  set termsAcceptedIp(String? value) =>
      setField<String>('terms_accepted_ip', value);

  bool? get adultContentEnabled => getField<bool>('adult_content_enabled');
  set adultContentEnabled(bool? value) =>
      setField<bool>('adult_content_enabled', value);

  DateTime? get adultConsentAt => getField<DateTime>('adult_consent_at');
  set adultConsentAt(DateTime? value) =>
      setField<DateTime>('adult_consent_at', value);

  String? get adultConsentIp => getField<String>('adult_consent_ip');
  set adultConsentIp(String? value) =>
      setField<String>('adult_consent_ip', value);

  String? get profileSlug => getField<String>('profile_slug');
  set profileSlug(String? value) => setField<String>('profile_slug', value);

  bool? get profileIsPublic => getField<bool>('profile_is_public');
  set profileIsPublic(bool? value) =>
      setField<bool>('profile_is_public', value);

  String? get bio => getField<String>('bio');
  set bio(String? value) => setField<String>('bio', value);
}
