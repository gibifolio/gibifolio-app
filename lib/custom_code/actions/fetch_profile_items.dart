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

Future fetchProfileItems(
  String userId,
  String? ownership,
  String? reading,
  String? search,
  bool listsOnly,
) async {
  FFAppState().update(() {
    FFAppState().profileIsLoading = true;
    FFAppState().profileItems = [];
    FFAppState().profileOffset = 0;
    FFAppState().profileHasMore = false;
  });

  try {
    final client = Supabase.instance.client;

    List<dynamic> titlesData = [];

    if (!listsOnly) {
      final titlesResponse = await client.rpc(
        'app_profile_titles',
        params: {
          'p_user_id': userId,
          'p_ownership': ownership,
          'p_reading': reading,
          'p_limit': 24,
          'p_offset': 0,
          'p_search': search,
        },
      );
      titlesData = titlesResponse as List<dynamic>;
    }

    List<dynamic> listsData = [];
    final bool noFilter = ownership == null && reading == null;
    if (noFilter || listsOnly) {
      final listsResponse = await client
          .from('lists')
          .select('list_id, list_name, description, is_public')
          .eq('user_id', userId)
          .eq('list_type', 'custom')
          .order('list_name', ascending: true);
      listsData = listsResponse as List<dynamic>;

      if (search != null && search.isNotEmpty) {
        final searchLower = search.toLowerCase();
        listsData = listsData.where((row) {
          final name = (row['list_name'] as String? ?? '').toLowerCase();
          final desc = (row['description'] as String? ?? '').toLowerCase();
          return name.contains(searchLower) || desc.contains(searchLower);
        }).toList();
      }
    }

    final List<ProfileItemStruct> unified = [];

    final listIds = listsData.map((r) => r['list_id'] as String).toList();

    Map<String, int> listCounts = {};
    Map<String, List<String?>> listThumbs = {};

    if (listIds.isNotEmpty) {
      final countsResponse = await client
          .from('list_items')
          .select('list_id')
          .inFilter('list_id', listIds);
      for (final row in countsResponse as List) {
        final id = row['list_id'] as String;
        listCounts[id] = (listCounts[id] ?? 0) + 1;
      }

      final thumbsResponse = await client
          .from('app_list_item_with_cover')
          .select('list_id, thumb_local_path')
          .inFilter('list_id', listIds)
          .not('thumb_local_path', 'is', null);
      for (final row in thumbsResponse as List) {
        final id = row['list_id'] as String;
        final thumb = row['thumb_local_path'] as String?;
        if (!listThumbs.containsKey(id)) listThumbs[id] = [];
        if (listThumbs[id]!.length < 3) listThumbs[id]!.add(thumb);
      }
    }

    for (final row in listsData) {
      final id = row['list_id'] as String;
      final thumbs = listThumbs[id] ?? [];
      unified.add(ProfileItemStruct(
        itemType: 'list',
        listId: id,
        listName: row['list_name'] as String? ?? '',
        listDescription: row['description'] as String?,
        listIsPublic: row['is_public'] as bool? ?? false,
        listItemCount: listCounts[id] ?? 0,
        thumb1: thumbs.length > 0 ? thumbs[0] : null,
        thumb2: thumbs.length > 1 ? thumbs[1] : null,
        thumb3: thumbs.length > 2 ? thumbs[2] : null,
      ));
    }

    for (final row in titlesData) {
      unified.add(ProfileItemStruct(
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
      ));
    }

    FFAppState().update(() {
      FFAppState().profileItems = unified;
      FFAppState().profileOffset = titlesData.length;
      FFAppState().profileHasMore = titlesData.length == 24;
      FFAppState().profileIsLoading = false;
    });
  } catch (e) {
    debugPrint('fetchProfileItems error: $e');
    FFAppState().update(() {
      FFAppState().profileIsLoading = false;
    });
  }
}
