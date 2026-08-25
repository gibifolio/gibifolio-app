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

import 'dart:async';

import '/custom_code/actions/ensure_local_cache.dart';
import '/custom_code/actions/ensure_connectivity_state.dart';

/// Releases recentes com stale-while-revalidate (Padrão B — FutureBuilder).
///
/// - Cache fresco (< 30 min): serve sem bater na rede. - Cache stale: serve
/// na hora e revalida em background (persiste p/ a próxima). - Sem cache:
/// busca fresco e grava. - Offline/erro: retorna o cache disponível (mesmo
/// expirado) ou lista vazia.
Future<List<RecentReleasesCacheRow>> getCachedReleases() async {
  const key = 'releases:recent';
  const ttl = Duration(minutes: 30);
  final cache = LocalCacheService.instance;

  final env = await cache.readEnvelope(key);
  final cached = env?.data.map((m) => RecentReleasesCacheRow(m)).toList();

  if (env != null && cache.isFresh(env, ttl) && cached != null) {
    return cached;
  }

  if (cached != null && cached.isNotEmpty) {
    unawaited(_revalidateReleases(key));
    return cached;
  }

  try {
    final fresh = await _fetchReleases();
    markOnline();
    await cache.writeEnvelope(key, fresh.map((r) => r.data).toList());
    return fresh;
  } catch (e) {
    if (isOfflineError(e)) markOffline();
    return cached ?? <RecentReleasesCacheRow>[];
  }
}

Future<void> _revalidateReleases(String key) async {
  try {
    final fresh = await _fetchReleases();
    markOnline();
    await LocalCacheService.instance
        .writeEnvelope(key, fresh.map((r) => r.data).toList());
  } catch (e) {
    if (isOfflineError(e)) markOffline();
  }
}

Future<List<RecentReleasesCacheRow>> _fetchReleases() =>
    RecentReleasesCacheTable().queryRows(queryFn: (q) => q);
