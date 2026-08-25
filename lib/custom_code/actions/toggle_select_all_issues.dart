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

Future<bool> toggleSelectAllIssues(String titleId) async {
  final client = Supabase.instance.client;
  final result =
      await client.from('issues').select('issue_id').eq('title_id', titleId);
  final ids = (result as List).map((row) => row['issue_id'] as String).toList();

  final currentIds = List<String>.from(FFAppState().selectedIds);
  final alreadyAllSelected = ids.every((id) => currentIds.contains(id));

  FFAppState().update(() {
    if (alreadyAllSelected) {
      FFAppState().selectedIds = [];
      // permanece no modo seleção
    } else {
      FFAppState().selectedIds = ids;
    }
  });

  return true;
}
