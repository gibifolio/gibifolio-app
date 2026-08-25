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

// Ordena o userListsBuffer conforme o criterio:
//   'alphabetical' -> nome normalizado (minusculo, sem acento) A-Z
//   'manual'       -> sortPosition asc (posicao global unificada)
//   'recents' (ou qualquer outro) -> atividade mais recente desc, onde:
//        seguidas usam followedAt; proprias usam COALESCE(updatedAt, createdAt)
Future<void> sortUserListsBuffer(String criterion) async {
  final buffer = FFAppState().userListsBuffer.toList();

  String norm(String? s) {
    var out = (s ?? '').toLowerCase().trim();
    const from = 'áàâãäéèêëíìîïóòôõöúùûüçñ';
    const to = 'aaaaaeeeeiiiiooooouuuucn';
    for (var i = 0; i < from.length; i++) {
      out = out.replaceAll(from[i], to[i]);
    }
    return out;
  }

  DateTime? recentKey(UserListItemStruct e) {
    if (e.isFollowed) {
      return e.hasFollowedAt() ? e.followedAt : null;
    }
    return e.hasUpdatedAt() ? e.updatedAt : e.createdAt;
  }

  if (criterion == 'alphabetical') {
    buffer.sort((a, b) => norm(a.listName).compareTo(norm(b.listName)));
  } else if (criterion == 'manual') {
    buffer.sort((a, b) => (a.sortPosition).compareTo(b.sortPosition));
  } else {
    // recents
    buffer.sort((a, b) {
      final da = recentKey(a);
      final db = recentKey(b);
      if (da == null && db == null) return 0;
      if (da == null) return 1;
      if (db == null) return -1;
      return db.compareTo(da); // desc
    });
  }

  FFAppState().update(() {
    FFAppState().userListsBuffer = buffer;
  });
}
