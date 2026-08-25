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

import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '/custom_code/actions/ensure_cover_cache.dart';

const String _kBase = 'https://app.gibifolio.com.br';
// Domínio de compartilhamento (App Links + card de preview). Usa o formato de
// rota nativo do app, então o link abre direto no app quando instalado, e cai
// no card/redirect (via Vercel -> Edge Function) para crawlers e navegador.
const String _kShareBase = 'https://link.gibifolio.com.br';
const String _kStorage =
    'https://dlxinhmwtgrsqhwhmepg.supabase.co/storage/v1/object/public/';
const String _kLogoAsset = 'assets/images/app_launcher_icon.png';

/// Compartilha um título, edição ou lista com texto rico + capa.
///
/// [type]: 'title', 'issue' ou 'list'. [id]: o id correspondente.
/// Busca os dados no Supabase de forma null-safe. Se algo faltar (ou a
/// busca falhar), ainda compartilha o link — nunca lança exceção.
///
/// Imagem anexada: a capa da entidade; se não houver capa (ou o download
/// falhar), cai no logo do Gibifolio como imagem padrão.
Future<void> shareContent(String type, String id) async {
  String url = _kBase;
  String caption = 'Gibifolio';
  String? coverPath;

  try {
    switch (type) {
      case 'title':
        {
          final rows = await AppTitleDetailTable().querySingleRow(
            queryFn: (q) => q.eqOrNull('title_id', id),
          );
          final r = rows.isNotEmpty ? rows.first : null;
          url = '$_kShareBase/titleDetailPage?titleId=$id';
          caption = _titleCaption(r, url);
          coverPath = _firstNonEmpty([r?.titleThumb, r?.titleCover]);
          break;
        }
      case 'issue':
        {
          final rows = await AppIssueDetailTable().querySingleRow(
            queryFn: (q) => q.eqOrNull('issue_id', id),
          );
          final r = rows.isNotEmpty ? rows.first : null;
          url =
              '$_kShareBase/issueDetailPage?issueId=$id&tittleId=${r?.titleId ?? ''}';
          caption = _issueCaption(r, url);
          coverPath = _firstNonEmpty([r?.thumbLocalPath, r?.coverLocalPath]);
          break;
        }
      case 'list':
        {
          final rows = await AppListDetailTable().querySingleRow(
            queryFn: (q) => q.eqOrNull('list_id', id),
          );
          final r = rows.isNotEmpty ? rows.first : null;
          url = '$_kShareBase/listDetailPage?listId=$id';
          caption = _listCaption(r, url);
          coverPath = r?.thumb1;
          break;
        }
    }
  } catch (_) {
    // Busca falhou: segue com o link básico.
  }

  // Imagem: capa da entidade, com fallback pro logo. Tudo best-effort.
  XFile? img = await _coverFile(coverPath);
  img ??= await _logoFile();

  await SharePlus.instance.share(
    ShareParams(
      text: caption,
      subject: 'Gibifolio',
      files: img == null ? null : [img],
    ),
  );
}

/// Baixa a capa (reusando o cache de capas) e devolve como um arquivo .jpg
/// de verdade, com mimeType/name — necessário para o share reconhecer como
/// imagem (o cache guarda o arquivo com nome de hash, sem extensão).
Future<XFile?> _coverFile(String? coverPath) async {
  if (kIsWeb || coverPath == null || coverPath.isEmpty) return null;
  try {
    final f = await coverCacheManager.getSingleFile('$_kStorage$coverPath');
    final bytes = await f.readAsBytes();
    final dir = await getTemporaryDirectory();
    final out = File('${dir.path}/gibifolio_share_cover.jpg');
    await out.writeAsBytes(bytes, flush: true);
    return XFile(out.path, mimeType: 'image/jpeg', name: 'capa.jpg');
  } catch (_) {
    return null;
  }
}

/// Logo do Gibifolio (asset) copiado pra um arquivo temporário, para servir
/// de imagem padrão quando a entidade não tem capa.
Future<XFile?> _logoFile() async {
  if (kIsWeb) return null;
  try {
    final data = await rootBundle.load(_kLogoAsset);
    final dir = await getTemporaryDirectory();
    final path = '${dir.path}/gibifolio_share_logo.png';
    final file = File(path);
    await file.writeAsBytes(data.buffer.asUint8List(), flush: true);
    return XFile(path, mimeType: 'image/png', name: 'gibifolio.png');
  } catch (_) {
    return null;
  }
}

String? _firstNonEmpty(List<String?> xs) {
  for (final x in xs) {
    if (x != null && x.isNotEmpty) return x;
  }
  return null;
}

String _clean(String? s) => (s ?? '').trim();

/// Negrito no WhatsApp/Telegram é *asterisco*. Em apps sem markdown os
/// asteriscos aparecem literais — como o alvo principal é WhatsApp, ok.
String _b(String s) => s.isEmpty ? '' : '*$s*';

String _titleCaption(AppTitleDetailRow? r, String url) {
  if (r == null) return 'Confira essa série no Gibifolio: $url';
  final pre = _clean(r.preTitle);
  final name = _clean(r.titleName);
  final sub = _clean(r.titleSubtitle);
  final publisher = _clean(r.publisherName);
  final n = r.issueCount ?? 0;

  final body = <String>[];
  if (pre.isNotEmpty) body.add(pre);
  if (name.isNotEmpty) body.add(_b(name));
  if (sub.isNotEmpty) body.add(sub);
  final pe = <String>[];
  if (publisher.isNotEmpty) pe.add(publisher);
  if (n > 0) pe.add(n == 1 ? '1 edição' : '$n edições');
  if (pe.isNotEmpty) body.add(pe.join(' · '));

  final lines = <String>['📚 Confira essa série no Gibifolio', ''];
  lines.addAll(body);
  lines.add('');
  lines.add(url);
  return lines.join('\n');
}

String _issueCaption(AppIssueDetailRow? r, String url) {
  if (r == null) return 'Confira no Gibifolio: $url';
  final name = _clean(r.titleName);
  final numTxt = _clean(r.issueNumber);
  final issueName = _clean(r.issueName);
  final issueSub = _clean(r.issueSubtitle);
  final publisher = _clean(r.publisherName);

  final hb = StringBuffer();
  if (name.isNotEmpty) hb.write(name);
  if (numTxt.isNotEmpty) hb.write(hb.isEmpty ? '#$numTxt' : ' #$numTxt');
  final header = hb.toString();

  final body = <String>[];
  if (header.isNotEmpty) body.add(_b(header));
  if (issueName.isNotEmpty) body.add(issueName);
  if (issueSub.isNotEmpty) body.add(issueSub);
  if (publisher.isNotEmpty) body.add(publisher);

  final lines = <String>['📕 Confira no Gibifolio', ''];
  lines.addAll(body);
  lines.add('');
  lines.add(url);
  return lines.join('\n');
}

String _listCaption(AppListDetailRow? r, String url) {
  if (r == null) return 'Confira essa lista no Gibifolio: $url';
  final name = _clean(r.listName);
  final desc = _clean(r.description);
  final n = r.itemCount ?? 0;
  final qtd = n == 1 ? '1 item' : '$n itens';

  final hb = StringBuffer();
  if (name.isNotEmpty) hb.write(name);
  if (n > 0) hb.write(hb.isEmpty ? qtd : ' · $qtd');
  final header = hb.toString();

  final body = <String>[];
  body.add(_b(header.isEmpty ? 'Lista de HQs' : header));
  if (desc.isNotEmpty) body.add(desc);

  final lines = <String>['📋 Confira essa lista no Gibifolio', ''];
  lines.addAll(body);
  lines.add('');
  lines.add(url);
  return lines.join('\n');
}
