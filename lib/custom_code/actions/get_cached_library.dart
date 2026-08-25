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

/// Biblioteca do usuário com SWR vivo (Padrão A — app state).
///
/// Serve do cache em `FFAppState().libraryTitles` na hora e revalida em
/// background atualizando o MESMO campo — a UI ligada via Consumer/watch
/// re-renderiza com o dado fresco. Offline/erro: mantém o cache.
///
/// Chave por usuário (`library:<userId>`) para isolar contas no mesmo device.
Future<List<LibraryTitleItemStruct>> getCachedLibrary(String userId) async {
  final key = 'library:$userId';
  const ttl = Duration(hours: 24);
  final cache = LocalCacheService.instance;

  final env = await cache.readEnvelope(key);
  final cached = env?.data
      .map((m) => LibraryTitleItemStruct.fromSerializableMap(m))
      .toList();

  if (cached != null && cached.isNotEmpty) {
    FFAppState().update(() => FFAppState().libraryTitles = cached);
    // Biblioteca sempre revalida em background (a expiração de 24h só decide
    // se o cache ainda pode ser servido após um período longo offline).
    unawaited(_revalidateLibrary(key, userId));
    return cached;
  }

  try {
    final fresh = await fetchLibraryTitles(userId);
    markOnline();
    await cache.writeEnvelope(
        key, fresh.map((e) => e.toSerializableMap()).toList());
    FFAppState().update(() => FFAppState().libraryTitles = fresh);
    return fresh;
  } catch (e) {
    if (isOfflineError(e)) markOffline();
    return cached ?? <LibraryTitleItemStruct>[];
  }
}

Future<void> _revalidateLibrary(String key, String userId) async {
  try {
    final fresh = await fetchLibraryTitles(userId);
    markOnline();
    await LocalCacheService.instance
        .writeEnvelope(key, fresh.map((e) => e.toSerializableMap()).toList());
    FFAppState().update(() => FFAppState().libraryTitles = fresh);
  } catch (e) {
    if (isOfflineError(e)) markOffline();
  }
}
