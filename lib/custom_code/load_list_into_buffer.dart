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

/// Carrega os itens da lista (view app_list_items, ordem por position) para
/// uma List<ListEditItem> que alimenta o buffer de reordenacao.
Future<List<ListEditItemStruct>> loadListIntoBuffer(String listId) async {
  final rows = await AppListItemsTable().queryRows(
    queryFn: (q) =>
        q.eqOrNull('list_id', listId).order('position', ascending: true),
  );

  return rows
      .map((r) => ListEditItemStruct(
            entityType: r.entityType,
            entityId: r.entityId,
            thumbLocalPath: r.thumbLocalPath,
            preTitle: r.preTitle,
            titleName: r.titleName,
            titleSubtitle: r.titleSubtitle,
            publisherName: r.publisherName,
            licensors: r.licensors,
            issueNumber: r.issueNumber,
            issueName: r.issueName,
            issueSubtitle: r.issueSubtitle,
            formatLabel: r.formatLabel,
            isAdult: r.isAdult,
            issueCount: r.issueCount,
            series: r.series,
            issuePages: r.issuePages,
            typeNormalized: r.typeNormalized,
          ))
      .toList();
}
