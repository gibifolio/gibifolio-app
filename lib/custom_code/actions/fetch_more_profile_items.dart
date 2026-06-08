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

import 'package:supabase_flutter/supabase_flutter.dart';

Future fetchMoreProfileItems(
  String userId,
  String? ownership,
  String? reading,
  int offset,
  String? search, // novo
) async {
  if (!FFAppState().profileHasMore) return;

  try {
    final response = await Supabase.instance.client.rpc(
      'app_profile_titles',
      params: {
        'p_user_id': userId,
        'p_ownership': ownership,
        'p_reading': reading,
        'p_limit': 24,
        'p_offset': offset,
        'p_search': search, // novo
      },
    );

    final List<dynamic> data = response as List<dynamic>;

    final List<ProfileItemStruct> newItems = data.map((row) {
      return ProfileItemStruct(
        itemType: 'title',
        titleId: row['title_id'] as String? ?? '',
        titleName: row['title_name'] as String? ?? '',
        titleSubtitle: row['title_subtitle'] as String?,
        series: row['series'] as String?,
        typeNormalized: row['type_normalized'] as String?,
        publisherName: row['publisher_name'] as String?,
        publicationStatus: row['publication_status'] as String?,
        isAdult: row['is_adult'] as bool? ?? false,
        licensors: row['licensors'] as String?,
        issueCount: row['issue_count'] as int? ?? 0,
        singleIssueId: row['single_issue_id'] as String?,
        singleIssuePages: row['single_issue_pages'] as int?,
        singleSavedIssueId: row['single_saved_issue_id'] as String?,
        hasOwned: row['has_owned'] as bool? ?? false,
        hasWanted: row['has_wanted'] as bool? ?? false,
        hasReading: row['has_reading'] as bool? ?? false,
        hasRead: row['has_read'] as bool? ?? false,
        thumb1: row['status_thumb'] as String?,
        thumb2: row['status_thumb_2'] as String?,
        thumb3: row['status_thumb_3'] as String?,
      );
    }).toList();

    FFAppState().update(() {
      FFAppState().profileItems = [
        ...FFAppState().profileItems,
        ...newItems,
      ];
      FFAppState().profileOffset = offset + data.length;
      FFAppState().profileHasMore = data.length == 24;
    });
  } catch (e) {
    debugPrint('fetchMoreProfileItems error: $e');
  }
}
