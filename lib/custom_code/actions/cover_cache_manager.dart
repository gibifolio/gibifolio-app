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

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// CacheManager dedicado às capas (covers) do Gibifolio.
///
/// Política explícita (ver .specs/features/caching-layer):
///   - stalePeriod: 30 dias (capas mudam raramente)
///   - maxNrOfCacheObjects: 1000 (thumbs são pequenos)
///   - store em disco (no web degrada para memória, sem crash)
///
/// É um singleton top-level: este arquivo precisa ser registrado como
/// Custom Action no FlutterFlow (via `ensureCoverCache`) para sobreviver
/// aos exports. Os vizinhos (comic_cover, prefetch_covers) importam este
/// arquivo direto para acessar `coverCacheManager`.
final CacheManager coverCacheManager = CacheManager(
  Config(
    'gibifolioCovers',
    stalePeriod: const Duration(days: 30),
    maxNrOfCacheObjects: 1000,
  ),
);

/// Action trivial cuja única função é registrar este arquivo como Custom
/// Action no FlutterFlow, preservando o singleton `coverCacheManager` nos
/// exports. Idempotente e segura.
Future<void> ensureCoverCache() async {
  // Toca o singleton para forçar a construção lazy do CacheManager.
  // ignore: unnecessary_statements
  coverCacheManager;
}
