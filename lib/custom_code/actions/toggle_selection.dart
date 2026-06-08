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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

Future<bool> toggleSelection(String issueId) async {
  FFAppState().update(() {
    List<String> ids = List.from(FFAppState().selectedIds);
    if (ids.contains(issueId)) {
      ids.remove(issueId);
    } else {
      ids.add(issueId);
    }
    FFAppState().selectedIds = ids;
    if (ids.isEmpty) {
      FFAppState().isSelectionMode = false;
    }
  });
  return true;
}
