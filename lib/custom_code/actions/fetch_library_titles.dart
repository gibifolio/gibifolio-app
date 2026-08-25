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

Future<List<LibraryTitleItemStruct>> fetchLibraryTitles(
  String userId,
) async {
  final client = Supabase.instance.client;

  final response = await client.rpc(
    'app_library_titles_v2',
    params: {'p_user_id': userId},
  );

  if (response == null) return [];

  return (response as List).map((row) {
    return LibraryTitleItemStruct(
      titleId: row['title_id'] as String? ?? '',
      titleName: row['title_name'] as String? ?? '',
      preTitle: row['pre_title'] as String?,
      formatLabel: row['format_label'] as String?,
      titleSubtitle: row['title_subtitle'] as String?,
      series: row['series'] as String?,
      typeNormalized: row['type_normalized'] as String?,
      publisherName: row['publisher_name'] as String?,
      publicationStatus: row['publication_status'] as String?,
      canonicalKey: row['canonical_key'] as String?,
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
      ownedCount: row['owned_count'] as int? ?? 0,
      wantedCount: row['wanted_count'] as int? ?? 0,
      readingCount: row['reading_count'] as int? ?? 0,
      readCount: row['read_count'] as int? ?? 0,
      ownedT1: row['owned_t1'] as String?,
      ownedT2: row['owned_t2'] as String?,
      ownedT3: row['owned_t3'] as String?,
      wantedT1: row['wanted_t1'] as String?,
      wantedT2: row['wanted_t2'] as String?,
      wantedT3: row['wanted_t3'] as String?,
      readingT1: row['reading_t1'] as String?,
      readingT2: row['reading_t2'] as String?,
      readingT3: row['reading_t3'] as String?,
      readT1: row['read_t1'] as String?,
      readT2: row['read_t2'] as String?,
      readT3: row['read_t3'] as String?,
      ownedFirstIssueId: row['owned_first_issue_id'] as String?,
      wantedFirstIssueId: row['wanted_first_issue_id'] as String?,
      readingFirstIssueId: row['reading_first_issue_id'] as String?,
      readFirstIssueId: row['read_first_issue_id'] as String?,
    );
  }).toList();
}
