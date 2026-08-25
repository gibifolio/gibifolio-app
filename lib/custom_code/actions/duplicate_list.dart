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

// Duplica uma lista pública para o usuário logado (RPC duplicate_list).
// Retorna o list_id da nova lista (para navegar até ela), ou null em erro.
Future<String?> duplicateList(String sourceListId) async {
  try {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) return null;

    final res = await Supabase.instance.client.rpc(
      'duplicate_list',
      params: {'p_source_list_id': sourceListId},
    );

    await LocalCacheService.instance.evict('lists_v2:$userId');
    return res?.toString();
  } catch (e) {
    return null;
  }
}
