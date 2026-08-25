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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:supabase_flutter/supabase_flutter.dart';

Future fetchSearchResults(String query) async {
  FFAppState().update(() {
    FFAppState().searchIsLoading = true;
    FFAppState().searchResults = [];
    FFAppState().searchOffset = 0;
  });
  final response = await Supabase.instance.client.rpc(
    'search_titles',
    params: {
      'p_query': query,
      'p_limit': 20,
      'p_offset': 0,
    },
  );
  final List<dynamic> data = response as List<dynamic>;
  FFAppState().update(() {
    FFAppState().searchResults = data
        .map((item) => SearchResultItemStruct(
              titleId: item['titleId'] as String? ?? '',
              titleName: item['titleName'] as String? ?? '',
              preTitle: item['preTitle'] as String? ?? '',
              formatLabel: item['formatLabel'] as String? ?? '',
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
              isAdult: item['isAdult'] as bool? ?? false,
            ))
        .toList();
    FFAppState().searchIsLoading = false;
    FFAppState().searchOffset = data.length; // linha nova
  });
}
