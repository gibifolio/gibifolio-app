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

// Move uma lista no userListsBuffer (On Reorder do modo manual) e renumera
// sortPosition = indice, mantendo o buffer sempre consistente.
Future<void> moveListBufferItem(int oldIndex, int newIndex) async {
  final buffer = FFAppState().userListsBuffer.toList();

  if (oldIndex < 0 || oldIndex >= buffer.length) return;

  final item = buffer.removeAt(oldIndex);

  var insertIndex = newIndex;
  if (newIndex > oldIndex) insertIndex -= 1;
  if (insertIndex < 0) insertIndex = 0;
  if (insertIndex > buffer.length) insertIndex = buffer.length;

  buffer.insert(insertIndex, item);

  for (var i = 0; i < buffer.length; i++) {
    buffer[i].sortPosition = i;
  }

  FFAppState().update(() {
    FFAppState().userListsBuffer = buffer;
  });
}
