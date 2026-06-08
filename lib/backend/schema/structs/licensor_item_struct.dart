// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LicensorItemStruct extends BaseStruct {
  LicensorItemStruct({
    int? licensorId,
    String? licensorName,
  })  : _licensorId = licensorId,
        _licensorName = licensorName;

  // "licensorId" field.
  int? _licensorId;
  int get licensorId => _licensorId ?? 0;
  set licensorId(int? val) => _licensorId = val;

  void incrementLicensorId(int amount) => licensorId = licensorId + amount;

  bool hasLicensorId() => _licensorId != null;

  // "licensorName" field.
  String? _licensorName;
  String get licensorName => _licensorName ?? '';
  set licensorName(String? val) => _licensorName = val;

  bool hasLicensorName() => _licensorName != null;

  static LicensorItemStruct fromMap(Map<String, dynamic> data) =>
      LicensorItemStruct(
        licensorId: castToType<int>(data['licensorId']),
        licensorName: data['licensorName'] as String?,
      );

  static LicensorItemStruct? maybeFromMap(dynamic data) => data is Map
      ? LicensorItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'licensorId': _licensorId,
        'licensorName': _licensorName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'licensorId': serializeParam(
          _licensorId,
          ParamType.int,
        ),
        'licensorName': serializeParam(
          _licensorName,
          ParamType.String,
        ),
      }.withoutNulls;

  static LicensorItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      LicensorItemStruct(
        licensorId: deserializeParam(
          data['licensorId'],
          ParamType.int,
          false,
        ),
        licensorName: deserializeParam(
          data['licensorName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LicensorItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LicensorItemStruct &&
        licensorId == other.licensorId &&
        licensorName == other.licensorName;
  }

  @override
  int get hashCode => const ListEquality().hash([licensorId, licensorName]);
}

LicensorItemStruct createLicensorItemStruct({
  int? licensorId,
  String? licensorName,
}) =>
    LicensorItemStruct(
      licensorId: licensorId,
      licensorName: licensorName,
    );
