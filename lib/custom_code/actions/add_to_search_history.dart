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

Future addToSearchHistory(String term) async {
  final trimmed = term.trim();
  if (trimmed.isEmpty) return;

  final current = List<String>.from(FFAppState().searchHistory);

  // Remove duplicata se já existir
  current.removeWhere((t) => t.toLowerCase() == trimmed.toLowerCase());

  // Insere no início
  current.insert(0, trimmed);

  // Limita a 20 itens
  final updated = current.take(20).toList();

  FFAppState().update(() {
    FFAppState().searchHistory = updated;
  });
}
