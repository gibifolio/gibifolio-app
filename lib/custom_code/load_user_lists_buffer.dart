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

// Carrega próprias + seguidas (view unificada via SWR getCachedLists) no buffer.
// sortPosition recebe a posição global (user_list_order) exposta como `position`.
Future<List<UserListItemStruct>> loadUserListsBuffer() async {
  final userId = Supabase.instance.client.auth.currentUser?.id;
  if (userId == null) return <UserListItemStruct>[];

  final rows = await getCachedLists(userId);

  return rows
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
}
