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

Future<bool> updateTitleReadingStatus(
  String titleId,
  String? statusReading,
  bool isSingleIssue,
) async {
  final client = Supabase.instance.client;
  final user = client.auth.currentUser;
  if (user == null) return false;

  final clean = (statusReading == null ||
          statusReading == 'null' ||
          statusReading.isEmpty)
      ? null
      : statusReading;

  try {
    final existing = await client
        .from('user_title_status')
        .select('status_ownership, status_reading')
        .eq('user_id', user.id)
        .eq('title_id', titleId)
        .maybeSingle();

    final currentOwnership = existing?['status_ownership'] as String?;
    final previousReading = existing?['status_reading'] as String?;

    if (clean == null && currentOwnership == null) {
      await client
          .from('user_title_status')
          .delete()
          .eq('user_id', user.id)
          .eq('title_id', titleId);
    } else {
      await client.from('user_title_status').upsert({
        'user_id': user.id,
        'title_id': titleId,
        'status_reading': clean,
        'status_ownership': currentOwnership,
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      }, onConflict: 'user_id,title_id');
    }

    final shouldCascade = clean == 'read' ||
        (clean == null && previousReading == 'read') ||
        isSingleIssue;

    if (shouldCascade) {
      await client.rpc('apply_title_status_to_issues', params: {
        'p_user_id': user.id,
        'p_title_id': titleId,
        'p_field': 'reading',
        'p_value': clean,
      });
    }

    await invalidateTitleCaches(user.id, titleId);

    return true;
  } catch (e) {
    print('updateTitleReadingStatus error: $e');
    return false;
  }
}
