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

import 'dart:async';

import 'local_cache_service.dart';
import 'connectivity_state.dart';

/// Listas do usuário com stale-while-revalidate (Padrão B — FutureBuilder).
///
/// - Cache fresco (< 1 h): serve sem rede.
/// - Cache stale: serve na hora e revalida em background.
/// - Sem cache: busca fresco e grava.
/// - Offline/erro: retorna o cache disponível ou lista vazia.
///
/// Chave por usuário (`lists:<userId>`); a query é escopada por RLS.
Future<List<AppUserCustomListsRow>> getCachedLists(String userId) async {
  final key = 'lists:$userId';
  const ttl = Duration(hours: 1);
  final cache = LocalCacheService.instance;

  final env = await cache.readEnvelope(key);
  final cached = env?.data.map((m) => AppUserCustomListsRow(m)).toList();

  if (env != null && cache.isFresh(env, ttl) && cached != null) {
    return cached;
  }

  if (cached != null && cached.isNotEmpty) {
    unawaited(_revalidateLists(key));
    return cached;
  }

  try {
    final fresh = await _fetchLists();
    markOnline();
    await cache.writeEnvelope(key, fresh.map((r) => r.data).toList());
    return fresh;
  } catch (e) {
    if (isOfflineError(e)) markOffline();
    return cached ?? <AppUserCustomListsRow>[];
  }
}

Future<void> _revalidateLists(String key) async {
  try {
    final fresh = await _fetchLists();
    markOnline();
    await LocalCacheService.instance
        .writeEnvelope(key, fresh.map((r) => r.data).toList());
  } catch (e) {
    if (isOfflineError(e)) markOffline();
  }
}

Future<List<AppUserCustomListsRow>> _fetchLists() =>
    AppUserCustomListsTable().queryRows(queryFn: (q) => q.order('updated_at'));
