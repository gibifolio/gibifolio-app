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

import 'package:universal_io/io.dart' show SocketException;

/// Estado de conectividade observável, em custom_code (NÃO em FFAppState, que é
/// gerado). O `OfflineBanner` escuta este notifier; as actions de cache marcam
/// online/offline conforme o resultado das requests (detecção reativa, sem
/// pacote de conectividade novo).
final ValueNotifier<bool> isOfflineNotifier = ValueNotifier<bool>(false);

/// Marca offline (no-op se já estava). Idempotente.
void markOffline() {
  if (!isOfflineNotifier.value) {
    isOfflineNotifier.value = true;
  }
}

/// Marca online ao reconectar e dispara revalidação das views visíveis,
/// reaproveitando o sinal de refresh já usado pelo app (`needsLibraryRefresh`).
void markOnline() {
  if (isOfflineNotifier.value) {
    isOfflineNotifier.value = false;
    try {
      // Notifica páginas que observam o FFAppState a re-buscar (re-fetch simples
      // das views visíveis; sem fila persistente — FR-OFF-03).
      FFAppState().update(() => FFAppState().needsLibraryRefresh = true);
    } catch (_) {}
  }
}

/// Heurística reativa: o erro parece falta de conexão? Tolerante (string match)
/// para cobrir SocketException, timeouts e o equivalente no web (XHR).
bool isOfflineError(Object e) {
  if (e is SocketException || e is TimeoutException) return true;
  final s = e.toString().toLowerCase();
  return s.contains('socketexception') ||
      s.contains('failed host lookup') ||
      s.contains('network is unreachable') ||
      s.contains('connection refused') ||
      s.contains('connection reset') ||
      s.contains('connection closed') ||
      s.contains('connection timed out') ||
      s.contains('timeout') ||
      s.contains('xmlhttprequest') ||
      s.contains('clientexception');
}

/// Action de registro no FlutterFlow (preserva o singleton/notifier nos exports).
Future<void> ensureConnectivityState() async {
  // ignore: unnecessary_statements
  isOfflineNotifier;
}
