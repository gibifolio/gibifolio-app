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

Future<List<LibraryTitleItemStruct>> applyLibraryFilter(
  List<LibraryTitleItemStruct> titles,
  String chip,
  String? query,
) async {
  List<LibraryTitleItemStruct> filtered = titles.where((t) {
    switch (chip) {
      case 'owned':
        return t.hasOwned == true;
      case 'wanted':
        return t.hasWanted == true;
      case 'reading':
        return t.hasReading == true;
      case 'read':
        return t.hasRead == true;
      default:
        return t.hasOwned == true;
    }
  }).toList();

  if (query == null || query.trim().isEmpty) return filtered;

  final q = query.trim().toLowerCase();

  return filtered.where((t) {
    final name = (t.titleName ?? '').toLowerCase();
    final preTitle = (t.preTitle ?? '').toLowerCase();
    final formatLabel = (t.formatLabel ?? '').toLowerCase();
    final subtitle = (t.titleSubtitle ?? '').toLowerCase();
    final series = (t.series ?? '').toLowerCase();
    return name.contains(q) ||
        preTitle.contains(q) ||
        formatLabel.contains(q) ||
        subtitle.contains(q) ||
        series.contains(q);
  }).toList();
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
