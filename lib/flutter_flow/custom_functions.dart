import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int indexPositionUpdated(int? index) {
  return (index ?? 0) + 1;
}

List<String>? extractListIds(List<ListItemsRow> rows) {
  return rows
      .map((r) => r.listId?.toString() ?? '')
      .where((id) => id.isNotEmpty)
      .toList();
}

bool? isNotEmpty() {
  bool isNotEmpty(String value) {
    return value.trim().isNotEmpty;
  }
}

String? getAggregateValue() {
// Extrai um valor de string de um Map dinâmico retornado por fetchTitleAggregate
// Parâmetros:
//   result: dynamic  — o Map retornado pela action
//   key: String      — 'reading_aggregate' ou 'ownership_aggregate'
// Retorno: String

  String getAggregateValue(
    dynamic result,
    String key,
  ) {
    if (result == null) return 'none';
    try {
      final map = result as Map<String, dynamic>;
      return map[key]?.toString() ?? 'none';
    } catch (e) {
      return 'none';
    }
  }
}

bool isUnderThirteen(DateTime birthDate) {
  final today = DateTime.now();
  final age = today.year -
      birthDate.year -
      ((today.month < birthDate.month ||
              (today.month == birthDate.month && today.day < birthDate.day))
          ? 1
          : 0);
  return age < 13;
}

bool isUnderEighteen(DateTime birthDate) {
  final today = DateTime.now();
  final age = today.year -
      birthDate.year -
      ((today.month < birthDate.month ||
              (today.month == birthDate.month && today.day < birthDate.day))
          ? 1
          : 0);
  return age < 18;
}

bool canSeeAdultContent(
  String? birthDateString,
  bool? adultContentEnabled,
) {
  if (birthDateString == null || birthDateString.isEmpty) return false;
  try {
    final parts = birthDateString.split('-');
    final birthDate =
        DateTime(int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
    final today = DateTime.now();
    final age = today.year -
        birthDate.year -
        ((today.month < birthDate.month ||
                (today.month == birthDate.month && today.day < birthDate.day))
            ? 1
            : 0);
    return age >= 18 && (adultContentEnabled ?? false);
  } catch (e) {
    return false;
  }
}

bool isMinorUser(String? birthDateString) {
  if (birthDateString == null || birthDateString.isEmpty) return false;
  try {
    final parts = birthDateString.split('-');
    final birthDate =
        DateTime(int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
    final today = DateTime.now();
    final age = today.year -
        birthDate.year -
        ((today.month < birthDate.month ||
                (today.month == birthDate.month && today.day < birthDate.day))
            ? 1
            : 0);
    return age < 18;
  } catch (e) {
    return false;
  }
}

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

String? getBrandType(dynamic item) {
  return item['brand_type']?.toString() ?? '';
}

String? emptyToNull(String? value) {
  if (value == null || value.isEmpty) return null;
  return value;
}
