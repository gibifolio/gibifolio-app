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

Future<bool> updateTitleOwnershipStatus(
  String titleId,
  String? statusOwnership,
  bool isSingleIssue,
) async {
  final client = Supabase.instance.client;
  final user = client.auth.currentUser;
  if (user == null) return false;

  final clean = (statusOwnership == null ||
          statusOwnership == 'null' ||
          statusOwnership.isEmpty)
      ? null
      : statusOwnership;

  try {
    final existing = await client
        .from('user_title_status')
        .select('status_reading, status_ownership')
        .eq('user_id', user.id)
        .eq('title_id', titleId)
        .maybeSingle();

    final currentReading = existing?['status_reading'] as String?;
    final previousOwnership = existing?['status_ownership'] as String?;

    if (clean == null && currentReading == null) {
      await client
          .from('user_title_status')
          .delete()
          .eq('user_id', user.id)
          .eq('title_id', titleId);
    } else {
      await client.from('user_title_status').upsert({
        'user_id': user.id,
        'title_id': titleId,
        'status_reading': currentReading,
        'status_ownership': clean,
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      }, onConflict: 'user_id,title_id');
    }

    final shouldCascade = clean == 'owned' ||
        (clean == null && previousOwnership == 'owned') ||
        isSingleIssue;

    if (shouldCascade) {
      await client.rpc('apply_title_status_to_issues', params: {
        'p_user_id': user.id,
        'p_title_id': titleId,
        'p_field': 'ownership',
        'p_value': clean,
      });
    }

    return true;
  } catch (e) {
    print('updateTitleOwnershipStatus error: $e');
    return false;
  }
}
