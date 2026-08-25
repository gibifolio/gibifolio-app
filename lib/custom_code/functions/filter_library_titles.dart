import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<LibraryTitleItemStruct>? filterLibraryTitles(
  List<LibraryTitleItemStruct> titles,
  String? query,
  String chip,
) {
  List<LibraryTitleItemStruct> filterLibraryTitles(
    List<LibraryTitleItemStruct> titles,
    String chip,
    String query,
  ) {
    // Filtra por chip
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

    // Filtra por query (se preenchida)
    if (query.trim().isEmpty) return filtered;

    final q = query.trim().toLowerCase();

    return filtered.where((t) {
      final name = (t.titleName ?? '').toLowerCase();
      final subtitle = (t.titleSubtitle ?? '').toLowerCase();
      final series = (t.series ?? '').toLowerCase();
      return name.contains(q) || subtitle.contains(q) || series.contains(q);
    }).toList();
    return [];
  }
}
