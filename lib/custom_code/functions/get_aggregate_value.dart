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
