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

import '/custom_code/actions/ensure_cover_cache.dart';

/// Pré-carrega capas no cache de disco para telas seguintes (listas/biblioteca).
///
/// Best-effort: tolerante a URLs nulas/vazias/duplicadas e a falhas de rede
/// (offline, 404) — nunca lança. Usa o mesmo `coverCacheManager` do ComicCover,
/// então o que for pré-carregado aqui aparece instantâneo depois.
///
/// IMPORTANTE (conteúdo adulto): o chamador é responsável por NÃO passar URLs de
/// capas restritas (+18) para usuários sem permissão (isAdult/canSeeAdult), já que
/// esta action é genérica e não conhece o contexto do usuário.
Future<void> prefetchCovers(List<String>? urls) async {
  if (urls == null || urls.isEmpty) return;

  final seen = <String>{};
  for (final url in urls) {
    final u = url.trim();
    if (u.isEmpty || !seen.add(u)) continue;
    try {
      // getSingleFile retorna do cache se já houver; só baixa se faltar/expirar.
      await coverCacheManager.getSingleFile(u);
    } catch (_) {
      // Prefetch é best-effort: ignora falhas e segue para a próxima.
    }
  }
}
