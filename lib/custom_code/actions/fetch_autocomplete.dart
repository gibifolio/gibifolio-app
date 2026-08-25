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

Future fetchAutocomplete(String query) async {
  if (query.trim().length < 2) {
    FFAppState().update(() {
      FFAppState().autocompleteResults = [];
      FFAppState().autocompleteVisible = false;
    });
    return;
  }

  await Future.delayed(const Duration(milliseconds: 400));

  final response = await Supabase.instance.client.rpc(
    'autocomplete_titles',
    params: {
      'p_query': query,
      'p_limit': 6,
    },
  );

  final List<dynamic> data = response as List<dynamic>;

  FFAppState().update(() {
    FFAppState().autocompleteResults = data
        .map((item) => AutocompleteItemStruct(
              titleId: item['title_id'] as String? ?? '',
              titleName: item['title_name'] as String? ?? '',
              titleSubtitle: item['title_subtitle'] as String? ?? '',
              series: item['series'] as String? ?? '',
              publisherName: item['publisher_name'] as String? ?? '',
              titleThumb: item['title_thumb'] as String? ?? '',
              issueCount: (item['issue_count'] as int?) ?? 0,
              typeNormalized: item['type_normalized'] as String? ?? '',
              singleIssueId: item['single_issue_id'] as String? ?? '',
              isAdult: item['is_adult'] as bool? ?? false,
            ))
        .toList();
    FFAppState().autocompleteVisible = data.isNotEmpty;
  });
}
