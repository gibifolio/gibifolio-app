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
import '/custom_code/actions/ensure_local_cache.dart';

// Deixa de seguir uma lista (RPC remove follow + linha de ordem).
// Invalida o cache pra a aba refletir. Retorna true.
Future<bool> unfollowList(String listId) async {
  try {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) return false;

    await Supabase.instance.client.rpc(
      'unfollow_list',
      params: {'p_list_id': listId},
    );

    await LocalCacheService.instance.evict('lists_v2:$userId');
    return true;
  } catch (e) {
    return false;
  }
}
