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

import 'local_cache_service.dart';

/// Invalida os caches locais afetados por uma mudança de status (lido/quero/
/// tenho), mantendo a consistência com o estado. Seguro: nunca lança.
///
/// - Remove o cache da biblioteca do usuário (`library:<userId>`).
/// - Remove o cache de metadados do título (`title:<titleId>`), se houver.
/// - Sinaliza `needsLibraryRefresh` para as views visíveis re-buscarem.
Future<void> invalidateTitleCaches(String userId, String titleId) async {
  try {
    final cache = LocalCacheService.instance;
    if (userId.isNotEmpty) {
      await cache.evict('library:$userId');
    }
    if (titleId.isNotEmpty) {
      await cache.evict('title:$titleId');
    }
    FFAppState().update(() => FFAppState().needsLibraryRefresh = true);
  } catch (_) {
    // Invalidação é best-effort: na pior hipótese o cache revalida no próximo TTL.
  }
}
