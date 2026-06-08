// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<LicensorItemStruct>> fetchTitleLicensors(String titleId) async {
  try {
    final response = await Supabase.instance.client.rpc(
      'get_title_licensors',
      params: {'p_title_id': titleId},
    );
    final List<dynamic> data = response as List<dynamic>;
    print('fetchTitleLicensors: titleId=$titleId, count=${data.length}');
    return data
        .map((item) => LicensorItemStruct(
              licensorId: (item['licensor_id'] as int?) ?? 0,
              licensorName: item['licensor_name'] as String? ?? '',
            ))
        .toList();
  } catch (e) {
    print('fetchTitleLicensors ERROR: $e');
    return [];
  }
}
