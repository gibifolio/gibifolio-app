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
// and then add the boilerplate code using the green button on the right!
import 'package:supabase_flutter/supabase_flutter.dart';

Future<String> queueScrape(
  String jobType,
  String entityId,
  String url,
) async {
  try {
    final response = await Supabase.instance.client.rpc(
      'app_queue_scrape',
      params: {
        'p_job_type': jobType,
        'p_entity_id': entityId,
        'p_url': url,
      },
    );

    if (response == null) return 'error';

    final data = response as Map<String, dynamic>;
    if (data['success'] != true) return 'error';
    if (data['already_queued'] == true) return 'already_queued';
    return 'success';
  } catch (e) {
    return 'error';
  }
}
