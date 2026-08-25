// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future fetchAllBrands(String? search, int offset) async {
  final searchParam =
      (search == null || search.trim().isEmpty) ? null : search.trim();

  debugPrint(
      'fetchAllBrands called — search: "$search" | searchParam: "$searchParam" | offset: $offset');

  if (offset == 0) {
    FFAppState().update(() {
      FFAppState().allBrands = [];
      FFAppState().allBrandsOffset = 0;
    });
  }

  final response = await Supabase.instance.client.rpc(
    'get_all_brands',
    params: {
      'p_limit': 30,
      'p_offset': offset,
      'p_search': searchParam,
    },
  );

  final List<dynamic> data = response as List<dynamic>;

  debugPrint('fetchAllBrands result — ${data.length} items returned');

  FFAppState().update(() {
    FFAppState().allBrands = [
      ...FFAppState().allBrands,
      ...data,
    ];
    FFAppState().allBrandsOffset = offset + data.length;
    FFAppState().allBrandsHasMore = data.length == 30;
  });
}
