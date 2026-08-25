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

Future<bool> upsertIssueStatus(
  String issueId,
  String titleId,
  String? statusReading,
  String? statusOwnership,
) async {
  final client = Supabase.instance.client;
  final user = client.auth.currentUser;
  if (user == null) return false;

  // 1. Upsert / delete em user_issue_status
  if (statusReading == null && statusOwnership == null) {
    await client
        .from('user_issue_status')
        .delete()
        .eq('user_id', user.id)
        .eq('issue_id', issueId);
  } else {
    await client.from('user_issue_status').upsert(
      {
        'user_id': user.id,
        'issue_id': issueId,
        'status_reading': statusReading,
        'status_ownership': statusOwnership,
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      },
      onConflict: 'user_id,issue_id',
    );
  }

  // 2. Recalcular status do título
  await client.rpc('recalculate_title_status', params: {
    'p_user_id': user.id,
    'p_title_id': titleId,
  });

  await invalidateTitleCaches(user.id, titleId);

  return true;
}
