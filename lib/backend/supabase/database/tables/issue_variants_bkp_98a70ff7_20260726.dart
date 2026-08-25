import '../database.dart';

class IssueVariantsBkp98a70ff720260726Table
    extends SupabaseTable<IssueVariantsBkp98a70ff720260726Row> {
  @override
  String get tableName => 'issue_variants_bkp_98a70ff7_20260726';

  @override
  IssueVariantsBkp98a70ff720260726Row createRow(Map<String, dynamic> data) =>
      IssueVariantsBkp98a70ff720260726Row(data);
}

class IssueVariantsBkp98a70ff720260726Row extends SupabaseDataRow {
  IssueVariantsBkp98a70ff720260726Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => IssueVariantsBkp98a70ff720260726Table();

  String? get issueVariantId => getField<String>('issue_variant_id');
  set issueVariantId(String? value) =>
      setField<String>('issue_variant_id', value);

  String? get issueId => getField<String>('issue_id');
  set issueId(String? value) => setField<String>('issue_id', value);

  String? get variantCode => getField<String>('variant_code');
  set variantCode(String? value) => setField<String>('variant_code', value);

  String? get variantLabel => getField<String>('variant_label');
  set variantLabel(String? value) => setField<String>('variant_label', value);

  String? get format => getField<String>('format');
  set format(String? value) => setField<String>('format', value);

  String? get edition => getField<String>('edition');
  set edition(String? value) => setField<String>('edition', value);

  String? get isbn10 => getField<String>('isbn_10');
  set isbn10(String? value) => setField<String>('isbn_10', value);

  String? get isbn13 => getField<String>('isbn_13');
  set isbn13(String? value) => setField<String>('isbn_13', value);

  String? get barcodeValue => getField<String>('barcode_value');
  set barcodeValue(String? value) => setField<String>('barcode_value', value);

  String? get barcodeType => getField<String>('barcode_type');
  set barcodeType(String? value) => setField<String>('barcode_type', value);

  String? get coverUrlSource => getField<String>('cover_url_source');
  set coverUrlSource(String? value) =>
      setField<String>('cover_url_source', value);

  String? get coverLocalPath => getField<String>('cover_local_path');
  set coverLocalPath(String? value) =>
      setField<String>('cover_local_path', value);

  String? get thumbLocalPath => getField<String>('thumb_local_path');
  set thumbLocalPath(String? value) =>
      setField<String>('thumb_local_path', value);

  DateTime? get releaseDate => getField<DateTime>('release_date');
  set releaseDate(DateTime? value) => setField<DateTime>('release_date', value);

  bool? get isPrimary => getField<bool>('is_primary');
  set isPrimary(bool? value) => setField<bool>('is_primary', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get urlGdqIssueVariant => getField<String>('url_gdq_issue_variant');
  set urlGdqIssueVariant(String? value) =>
      setField<String>('url_gdq_issue_variant', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get urlPublisherIssueVariant =>
      getField<String>('url_publisher_issue_variant');
  set urlPublisherIssueVariant(String? value) =>
      setField<String>('url_publisher_issue_variant', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  DateTime? get priceObservedAt => getField<DateTime>('price_observed_at');
  set priceObservedAt(DateTime? value) =>
      setField<DateTime>('price_observed_at', value);
}
