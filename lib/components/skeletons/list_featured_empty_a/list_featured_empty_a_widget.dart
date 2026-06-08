import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'list_featured_empty_a_model.dart';
export 'list_featured_empty_a_model.dart';

class ListFeaturedEmptyAWidget extends StatefulWidget {
  const ListFeaturedEmptyAWidget({
    super.key,
    String? textMessage,
  }) : this.textMessage = textMessage ?? 'Sua mensagem aqui.';

  final String textMessage;

  @override
  State<ListFeaturedEmptyAWidget> createState() =>
      _ListFeaturedEmptyAWidgetState();
}

class _ListFeaturedEmptyAWidgetState extends State<ListFeaturedEmptyAWidget> {
  late ListFeaturedEmptyAModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListFeaturedEmptyAModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Opacity(
          opacity: 0.6,
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              widget.textMessage,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    lineHeight: 1.2,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
