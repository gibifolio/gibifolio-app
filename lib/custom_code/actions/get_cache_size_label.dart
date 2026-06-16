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

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

import 'local_cache_service.dart';

/// Tamanho atual do cache em disco (imagens + dados), formatado em pt-BR
/// (ex.: "12,4 MB"). Retorna "0 B" no web ou em erro.
Future<String> getCacheSizeLabel() async {
  var total = 0;
  try {
    total += await LocalCacheService.instance.sizeInBytes();
    total += await _imageCacheBytes();
  } catch (_) {}
  return _formatBytes(total);
}

Future<int> _imageCacheBytes() async {
  if (kIsWeb) return 0;
  try {
    // O CacheManager de capas (key 'gibifolioCovers') guarda em <temp>/gibifolioCovers.
    final tmp = await getTemporaryDirectory();
    final dir = Directory('${tmp.path}/gibifolioCovers');
    if (!await dir.exists()) return 0;
    var total = 0;
    await for (final entity in dir.list(recursive: true, followLinks: false)) {
      if (entity is File) {
        try {
          total += await entity.length();
        } catch (_) {}
      }
    }
    return total;
  } catch (_) {
    return 0;
  }
}

String _formatBytes(int bytes) {
  if (bytes <= 0) return '0 B';
  const units = ['B', 'KB', 'MB', 'GB'];
  var size = bytes.toDouble();
  var unit = 0;
  while (size >= 1024 && unit < units.length - 1) {
    size /= 1024;
    unit++;
  }
  final value = unit == 0
      ? size.toStringAsFixed(0)
      : size.toStringAsFixed(1).replaceAll('.', ',');
  return '$value ${units[unit]}';
}
