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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!

Future<String> queueReview(
  String entityType,
  String entityId,
  String? note,
) async {
  try {
    final res = await SupaFlow.client.rpc(
      'app_queue_review',
      params: {
        'p_entity_type': entityType,
        'p_entity_id': entityId,
        'p_note': note,
      },
    );

    if (res is Map) {
      if (res['success'] == true) {
        return res['already_queued'] == true ? 'already_queued' : 'success';
      }
      final err = res['error'];
      return err is String ? err : 'error';
    }
    return 'error';
  } catch (_) {
    return 'error';
  }
}
