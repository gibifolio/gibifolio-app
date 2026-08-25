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

Future<bool> upsertTitleStatus(
  String titleId,
  String? statusOwnership,
  String? statusReading,
) async {
  final client = Supabase.instance.client;
  final user = client.auth.currentUser;
  if (user == null) return false;

  // 1. Upsert / delete em user_title_status
  if (statusOwnership == null && statusReading == null) {
    await client
        .from('user_title_status')
        .delete()
        .eq('user_id', user.id)
        .eq('title_id', titleId);
  } else {
    await client.from('user_title_status').upsert(
      {
        'user_id': user.id,
        'title_id': titleId,
        'status_ownership': statusOwnership,
        'status_reading': statusReading,
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      },
      onConflict: 'user_id,title_id',
    );
  }

  // 2. Cascatear para issues quando necessário
  // Reading: cascateia se 'read' ou null (remoção)
  if (statusReading == 'read' || statusReading == null) {
    await client.rpc('apply_title_status_to_issues', params: {
      'p_user_id': user.id,
      'p_title_id': titleId,
      'p_field': 'reading',
      'p_value': statusReading,
    });
  }

  // Ownership: cascateia se 'owned' ou null (remoção)
  if (statusOwnership == 'owned' || statusOwnership == null) {
    await client.rpc('apply_title_status_to_issues', params: {
      'p_user_id': user.id,
      'p_title_id': titleId,
      'p_field': 'ownership',
      'p_value': statusOwnership,
    });
  }

  await invalidateTitleCaches(user.id, titleId);

  return true;
}
