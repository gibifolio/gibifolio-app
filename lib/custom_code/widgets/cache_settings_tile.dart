// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/clear_app_cache.dart';
import '/custom_code/actions/get_cache_size_label.dart';

/// Tile para as configurações: mostra o tamanho do cache em disco e limpa
/// (imagens + dados) ao tocar, atualizando o tamanho em seguida. Auto-contido
/// para inserir na SettingsPage via FlutterFlow.
class CacheSettingsTile extends StatefulWidget {
  const CacheSettingsTile({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CacheSettingsTile> createState() => _CacheSettingsTileState();
}

class _CacheSettingsTileState extends State<CacheSettingsTile> {
  String? _sizeLabel;
  bool _clearing = false;

  @override
  void initState() {
    super.initState();
    _loadSize();
  }

  Future<void> _loadSize() async {
    final label = await getCacheSizeLabel();
    if (mounted) setState(() => _sizeLabel = label);
  }

  Future<void> _clear() async {
    if (_clearing) return;
    setState(() => _clearing = true);
    await clearAppCache();
    if (!mounted) return;
    await _loadSize();
    if (!mounted) return;
    setState(() => _clearing = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cache limpo.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final subtitle = _clearing ? 'Limpando…' : 'Em disco: ${_sizeLabel ?? '…'}';

    return InkWell(
      onTap: _clearing ? null : _clear,
      child: Container(
        width: widget.width,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        child: Row(
          children: [
            Icon(Icons.cleaning_services_rounded,
                color: theme.secondaryText, size: 22.0),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Limpar cache', style: theme.bodyLarge),
                  const SizedBox(height: 2.0),
                  Text(subtitle, style: theme.labelSmall),
                ],
              ),
            ),
            if (_clearing)
              const SizedBox(
                width: 18.0,
                height: 18.0,
                child: CircularProgressIndicator(strokeWidth: 2.0),
              )
            else
              Icon(Icons.chevron_right_rounded,
                  color: theme.secondaryText, size: 20.0),
          ],
        ),
      ),
    );
  }
}
