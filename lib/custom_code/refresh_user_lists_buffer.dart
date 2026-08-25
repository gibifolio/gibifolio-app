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

import 'package:supabase_flutter/supabase_flutter.dart';
import '/custom_code/actions/ensure_local_cache.dart';

// Invalida o cache e recarrega as listas frescas (próprias + seguidas),
// reaplicando o critério atual. Usar após criar/editar/excluir/seguir/reordenar
// ou em pull-to-refresh.
Future<void> refreshUserListsBuffer() async {
  final userId = Supabase.instance.client.auth.currentUser?.id;
  if (userId == null) return;

  await LocalCacheService.instance.evict('lists_v2:$userId');

  final rows = await getCachedLists(userId); // miss -> fresco

  final buffer = rows
      .map((r) => UserListItemStruct(
            listId: r.listId,
            listName: r.listName,
            description: r.description,
            itemCount: r.itemCount,
            thumb1: r.thumb1,
            thumb2: r.thumb2,
            thumb3: r.thumb3,
            createdAt: r.createdAt,
            updatedAt: r.updatedAt,
            sortPosition: r.position,
            isOwner: r.isOwner,
            isFollowed: r.isFollowed,
            isFeatured: r.isFeatured,
            isGhost: r.isGhost,
            authorSlug: r.authorSlug,
            authorName: r.authorName,
            authorAvatar: r.authorAvatar,
            ownerId: r.ownerId,
            followedAt: r.followedAt,
            authorIsVerified: r.authorIsVerified,
          ))
      .toList();

  FFAppState().userListsBuffer = buffer;
  await sortUserListsBuffer(FFAppState().listSortCriterion);
}
