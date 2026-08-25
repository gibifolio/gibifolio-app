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

// Move um item do listEditBuffer da posicao antiga para a nova.
// Chamada no On Reorder do ReorderableListView.
// Faz o ajuste de indice padrao do ReorderableListView (newIndex--,
// quando arrastando pra baixo) e notifica a tela via FFAppState().update.
Future<void> moveBufferItem(int oldIndex, int newIndex) async {
  final buffer = FFAppState().listEditBuffer.toList();

  if (oldIndex < 0 || oldIndex >= buffer.length) return;

  final item = buffer.removeAt(oldIndex);

  var insertIndex = newIndex;
  if (newIndex > oldIndex) insertIndex -= 1;
  if (insertIndex < 0) insertIndex = 0;
  if (insertIndex > buffer.length) insertIndex = buffer.length;

  buffer.insert(insertIndex, item);

  FFAppState().update(() {
    FFAppState().listEditBuffer = buffer;
  });
}
