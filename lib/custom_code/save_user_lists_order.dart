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

// Persiste a nova ordem chamando reorder_user_lists(uuid[]).
// orderedIds = ids VISÍVEIS na aba, na nova ordem (regra de slots é do banco).
// Após persistir, invalida o cache (a ordem global mudou no user_list_order);
// a aba deve chamar refreshUserListsBuffer ao voltar.
Future<bool> saveUserListsOrder(List<String> orderedIds) async {
  try {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) return false;
    if (orderedIds.isEmpty) return true;

    await Supabase.instance.client.rpc(
      'reorder_user_lists',
      params: {'p_ordered_ids': orderedIds},
    );

    await LocalCacheService.instance.evict('lists_v2:$userId');
    return true;
  } catch (e) {
    return false;
  }
}
