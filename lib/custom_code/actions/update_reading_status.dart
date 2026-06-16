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

Future<bool> updateReadingStatus(
  String issueId,
  String titleId,
  String? statusReading,
) async {
  try {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return false;

    final clean = (statusReading == null ||
            statusReading == 'null' ||
            statusReading.isEmpty)
        ? null
        : statusReading;

    // Busca o valor atual de ownership
    final existing = await Supabase.instance.client
        .from('user_issue_status')
        .select('status_ownership')
        .eq('user_id', user.id)
        .eq('issue_id', issueId)
        .maybeSingle();

    final currentOwnership = existing?['status_ownership'] as String?;

    // Se ambos ficam null, deleta a linha
    if (clean == null && currentOwnership == null) {
      await Supabase.instance.client
          .from('user_issue_status')
          .delete()
          .eq('user_id', user.id)
          .eq('issue_id', issueId);
    } else {
      await Supabase.instance.client.from('user_issue_status').upsert({
        'user_id': user.id,
        'issue_id': issueId,
        'status_reading': clean,
        'status_ownership': currentOwnership,
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      }, onConflict: 'user_id,issue_id');
    }

    // Recalcular status do título
    await Supabase.instance.client.rpc('recalculate_title_status', params: {
      'p_user_id': user.id,
      'p_title_id': titleId,
    });

    await invalidateTitleCaches(user.id, titleId);

    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}
