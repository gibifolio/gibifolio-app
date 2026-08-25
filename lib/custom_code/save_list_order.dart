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

// Persiste a nova ordem do buffer chamando a RPC reorder_list_items.
// Retorna true em sucesso, false em erro (a RPC valida o dono no banco).
Future<bool> saveListOrder(
  String listId,
  List<ListEditItemStruct> items,
) async {
  try {
    final payload = items
        .map((e) => {
              'entity_type': e.entityType,
              'entity_id': e.entityId,
            })
        .toList();

    await Supabase.instance.client.rpc(
      'reorder_list_items',
      params: {
        'p_list_id': listId,
        'p_items': payload,
      },
    );
    return true;
  } catch (e) {
    return false;
  }
}
