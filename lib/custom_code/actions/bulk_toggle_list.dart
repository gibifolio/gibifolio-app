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

Future<bool> bulkToggleList(String listId) async {
  final client = Supabase.instance.client;
  final List<String> issueIds = List.from(FFAppState().selectedIds);
  if (issueIds.isEmpty) return false;

  // Busca issues ordenadas via view que tem sort_order calculado
  final ordered = await client
      .from('app_issue_with_cover')
      .select('issue_id, sort_order')
      .inFilter('issue_id', issueIds)
      .order('sort_order', ascending: true);

  final sortedIds =
      (ordered as List).map((row) => row['issue_id'] as String).toList();

  // Busca quais já estão na lista
  final existing = await client
      .from('list_items')
      .select('entity_id')
      .eq('list_id', listId)
      .inFilter('entity_id', sortedIds);

  final existingIds =
      (existing as List).map((row) => row['entity_id'] as String).toList();

  if (existingIds.length == sortedIds.length) {
    await client
        .from('list_items')
        .delete()
        .eq('list_id', listId)
        .inFilter('entity_id', sortedIds);
  } else {
    final now = DateTime.now().toUtc();
    final records = sortedIds
        .asMap()
        .entries
        .map((entry) => {
              'list_id': listId,
              'entity_id': entry.value,
              'entity_type': 'issue',
              'added_at':
                  now.add(Duration(seconds: entry.key)).toIso8601String(),
            })
        .toList();

    await client
        .from('list_items')
        .upsert(records, onConflict: 'list_id,entity_id');
  }

  return true;
}
