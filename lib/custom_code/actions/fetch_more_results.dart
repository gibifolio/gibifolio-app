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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:supabase_flutter/supabase_flutter.dart';

Future fetchMoreResults(String query) async {
  final int nextOffset = FFAppState().searchOffset + 20;
  final response = await Supabase.instance.client.rpc(
    'search_titles',
    params: {
      'p_query': query,
      'p_limit': 20,
      'p_offset': nextOffset,
    },
  );
  final List<dynamic> data = response as List<dynamic>;
  if (data.isEmpty) return;
  FFAppState().update(() {
    FFAppState().searchOffset = nextOffset;
    FFAppState().searchResults = [
      ...FFAppState().searchResults,
      ...data
          .map((item) => SearchResultItemStruct(
                titleId: item['titleId'] as String? ?? '',
                titleName: item['titleName'] as String? ?? '',
                titleSubtitle: item['titleSubtitle'] as String? ?? '',
                series: item['series'] as String? ?? '',
                typeNormalized: item['typeNormalized'] as String? ?? '',
                publicationStatus: item['publicationStatus'] as String? ?? '',
                publisherName: item['publisherName'] as String? ?? '',
                licensors: item['licensors'] as String? ?? '',
                issueCount: (item['issueCount'] as int?) ?? 0,
                singleIssueId: item['singleIssueId'] as String? ?? '',
                singleIssuePages: (item['singleIssuePages'] as int?) ?? 0,
                titleThumb: item['titleThumb'] as String? ?? '',
                firstIssueThumb: item['firstIssueThumb'] as String? ?? '',
                secondIssueThumb: item['secondIssueThumb'] as String? ?? '',
                thirdIssueThumb: item['thirdIssueThumb'] as String? ?? '',
                readingAggregate: item['readingAggregate'] as String? ?? 'none',
                ownershipAggregate:
                    item['ownershipAggregate'] as String? ?? 'none',
              ))
          .toList(),
    ];
  });
}
