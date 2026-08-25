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
import 'dart:convert';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

/// Envelope de cache: dados (lista de mapas JSON) + timestamp para TTL.
class CachedEnvelope {
  CachedEnvelope({required this.data, required this.cachedAt});
  final List<Map<String, dynamic>> data;
  final int cachedAt; // epoch ms
}

/// Serviço de cache local em Hive (lazy-init, tolerante a falhas).
///
/// Init é lazy/idempotente porque `main.dart` é gerado (sem ponto de bootstrap
/// editável). Usa `Hive.init(path)` + `path_provider` — SEM `hive_flutter`
/// (que não está no pubspec). No web pula o path (IndexedDB).
///
/// Qualquer erro (box inacessível, JSON corrompido) degrada para no-op: o
/// chamador cai no fetch normal. O cache NUNCA derruba o app.
///
/// É um singleton top-level: registrar como Custom Action (`ensureLocalCache`)
/// no FlutterFlow para sobreviver aos exports. Vizinhos importam este arquivo
/// direto para acessar `LocalCacheService.instance`.
class LocalCacheService {
  LocalCacheService._();
  static final LocalCacheService instance = LocalCacheService._();

  static const String _boxName = 'gibifolio_data_cache';
  static const String _hiveSubdir = 'gibifolio_cache';
  static const int _envelopeVersion = 1;

  Box? _box;
  Future<void>? _initFuture;

  Future<void> ensureInit() => _initFuture ??= _doInit();

  Future<void> _doInit() async {
    try {
      if (!kIsWeb) {
        final dir = await getApplicationDocumentsDirectory();
        Hive.init('${dir.path}/$_hiveSubdir');
      }
      _box = await Hive.openBox(_boxName);
    } catch (_) {
      _box = null;
      _initFuture = null; // permite nova tentativa numa próxima chamada
    }
  }

  /// Lê o envelope de uma chave. Retorna null em miss/erro (e limpa entrada ruim).
  Future<CachedEnvelope?> readEnvelope(String key) async {
    try {
      await ensureInit();
      final raw = _box?.get(key);
      if (raw is! String) return null;
      final map = jsonDecode(raw) as Map<String, dynamic>;
      final list = (map['data'] as List?) ?? const [];
      final data =
          list.whereType<Map>().map((e) => e.cast<String, dynamic>()).toList();
      final cachedAt = (map['cachedAt'] as num?)?.toInt() ?? 0;
      return CachedEnvelope(data: data, cachedAt: cachedAt);
    } catch (_) {
      // Entrada corrompida: trata como miss e remove a entrada ruim.
      await evict(key);
      return null;
    }
  }

  /// Grava a lista de mapas JSON sob a chave, carimbando `cachedAt = agora`.
  Future<void> writeEnvelope(
      String key, List<Map<String, dynamic>> data) async {
    try {
      await ensureInit();
      final raw = jsonEncode({
        'v': _envelopeVersion,
        'cachedAt': DateTime.now().millisecondsSinceEpoch,
        'data': data,
      });
      await _box?.put(key, raw);
    } catch (_) {
      // best-effort: falha ao gravar não é fatal.
    }
  }

  bool isFresh(CachedEnvelope env, Duration ttl) =>
      DateTime.now().millisecondsSinceEpoch - env.cachedAt < ttl.inMilliseconds;

  Future<void> evict(String key) async {
    try {
      await ensureInit();
      await _box?.delete(key);
    } catch (_) {}
  }

  Future<void> clearAll() async {
    try {
      await ensureInit();
      await _box?.clear();
    } catch (_) {}
  }

  /// Tamanho aproximado do cache de dados em disco, em bytes (0 no web/erro).
  Future<int> sizeInBytes() async {
    if (kIsWeb) return 0;
    try {
      final dir = await getApplicationDocumentsDirectory();
      final cacheDir = Directory('${dir.path}/$_hiveSubdir');
      if (!await cacheDir.exists()) return 0;
      var total = 0;
      await for (final entity
          in cacheDir.list(recursive: true, followLinks: false)) {
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
}

/// Action de registro no FlutterFlow (preserva o singleton nos exports).
/// Idempotente: garante o Hive inicializado.
Future<void> ensureLocalCache() async {
  await LocalCacheService.instance.ensureInit();
}
