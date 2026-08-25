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
import '/custom_code/actions/ensure_local_cache.dart';

/// Limpa todo o cache do app: imagens (CacheManager) + dados (Hive).
/// Tolerante a falhas; nunca lança (cada etapa é isolada).
Future<void> clearAppCache() async {
  try {
    await coverCacheManager.emptyCache();
  } catch (_) {}
  try {
    await LocalCacheService.instance.clearAll();
  } catch (_) {}
}
