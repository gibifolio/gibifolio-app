// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/connectivity_state.dart';

/// Banner discreto de estado offline. Auto-oculta quando online (ocupa zero
/// espaço), então pode ficar fixo no topo de qualquer tela sem quebrar layout.
/// Escuta `isOfflineNotifier` (custom_code) — não depende de App State gerado.
class OfflineBanner extends StatefulWidget {
  const OfflineBanner({
    super.key,
    this.width,
    this.height,
    this.message,
  });

  final double? width;
  final double? height;
  final String? message;

  @override
  State<OfflineBanner> createState() => _OfflineBannerState();
}

class _OfflineBannerState extends State<OfflineBanner> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isOfflineNotifier,
      builder: (context, isOffline, _) {
        if (!isOffline) return const SizedBox.shrink();
        final bg = FlutterFlowTheme.of(context).secondaryText;
        const fg = Colors.white;
        return Material(
          color: bg,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.cloud_off_rounded, size: 15.0, color: fg),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    widget.message ??
                        'Você está offline — mostrando dados salvos.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: fg,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
