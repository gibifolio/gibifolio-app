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

Future<bool> bulkUpdateIssueOwnershipStatus(
  String statusOwnership,
  String titleId,
) async {
  final client = Supabase.instance.client;
  final user = client.auth.currentUser;
  if (user == null) return false;

  final List<String> issueIds = List<String>.from(FFAppState().selectedIds);
  if (issueIds.isEmpty) return false;

  // Busca status atual de todas as issues selecionadas
  final existing = await client
      .from('user_issue_status')
      .select('issue_id, status_ownership, status_reading')
      .eq('user_id', user.id)
      .inFilter('issue_id', issueIds);

  final Map<String, String?> ownershipMap = {
    for (final row in existing)
      row['issue_id'] as String: row['status_ownership'] as String?
  };
  final Map<String, String?> readingMap = {
    for (final row in existing)
      row['issue_id'] as String: row['status_reading'] as String?
  };

  // Toggle: se todas já têm o status, remove; senão, aplica
  final allHaveStatus =
      issueIds.every((id) => ownershipMap[id] == statusOwnership);
  final String? finalStatus = allHaveStatus ? null : statusOwnership;

  final records = issueIds
      .map((id) => {
            'user_id': user.id,
            'issue_id': id,
            'status_ownership': finalStatus,
            'status_reading': readingMap[id],
            'updated_at': DateTime.now().toUtc().toIso8601String(),
          })
      .toList();

  await client.from('user_issue_status').upsert(
        records,
        onConflict: 'user_id,issue_id',
      );

  // Recalcular status do título uma única vez ao final
  await client.rpc('recalculate_title_status', params: {
    'p_user_id': user.id,
    'p_title_id': titleId,
  });

  await invalidateTitleCaches(user.id, titleId);

  return true;
}
