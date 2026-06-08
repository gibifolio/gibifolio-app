import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'list_featured_empty_b_model.dart';
export 'list_featured_empty_b_model.dart';

class ListFeaturedEmptyBWidget extends StatefulWidget {
  const ListFeaturedEmptyBWidget({
    super.key,
    String? textMessage,
  }) : this.textMessage = textMessage ?? 'Sua mensagem aqui.';

  final String textMessage;

  @override
  State<ListFeaturedEmptyBWidget> createState() =>
      _ListFeaturedEmptyBWidgetState();
}

class _ListFeaturedEmptyBWidgetState extends State<ListFeaturedEmptyBWidget> {
  late ListFeaturedEmptyBModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListFeaturedEmptyBModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ClipRRect(
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
      ),
    );
  }
}
