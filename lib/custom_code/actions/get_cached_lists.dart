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

/// Listas do usuário (PRÓPRIAS + SEGUIDAS) com stale-while-revalidate.
/// Fonte: view app_user_lists_unified (RLS por auth.uid()).
/// Chave v2 (o shape mudou vs a antiga app_user_custom_lists).
Future<List<AppUserListsUnifiedRow>> getCachedLists(String userId) async {
  final key = 'lists_v2:$userId';
  const ttl = Duration(hours: 1);
  final cache = LocalCacheService.instance;

  final env = await cache.readEnvelope(key);
  final cached = env?.data.map((m) => AppUserListsUnifiedRow(m)).toList();

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
    return cached ?? <AppUserListsUnifiedRow>[];
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

Future<List<AppUserListsUnifiedRow>> _fetchLists() =>
    AppUserListsUnifiedTable().queryRows(
      queryFn: (q) => q.order('position', ascending: true),
    );
