import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'confirmation_bottom_sheet_model.dart';
export 'confirmation_bottom_sheet_model.dart';

class ConfirmationBottomSheetWidget extends StatefulWidget {
  const ConfirmationBottomSheetWidget({
    super.key,
    String? labelDismiss,
    this.labelActionPrimary,
    this.labelActionSecondary1,
    this.labelActionSecondary2,
    this.labelActionDestructive,
    this.dialogTitle,
    this.iconDestructive,
    bool? showPrimary,
    bool? showSecondary1,
    bool? showSecondary2,
    bool? showDestructive,
    this.dialogMessage,
    this.clickPrimary,
    this.clickSecondary1,
    this.clickSecondary2,
    this.clickDestructive,
    this.iconPrimary,
    this.iconSecondary1,
    this.iconSecondary2,
  })  : this.labelDismiss = labelDismiss ?? 'Fechar',
        this.showPrimary = showPrimary ?? true,
        this.showSecondary1 = showSecondary1 ?? true,
        this.showSecondary2 = showSecondary2 ?? false,
        this.showDestructive = showDestructive ?? false;

  final String labelDismiss;
  final String? labelActionPrimary;
  final String? labelActionSecondary1;
  final String? labelActionSecondary2;
  final String? labelActionDestructive;
  final String? dialogTitle;
  final Widget? iconDestructive;
  final bool showPrimary;
  final bool showSecondary1;
  final bool showSecondary2;
  final bool showDestructive;
  final String? dialogMessage;
  final Future Function()? clickPrimary;
  final Future Function()? clickSecondary1;
  final Future Function()? clickSecondary2;
  final Future Function()? clickDestructive;
  final Widget? iconPrimary;
  final Widget? iconSecondary1;
  final Widget? iconSecondary2;

  @override
  State<ConfirmationBottomSheetWidget> createState() =>
      _ConfirmationBottomSheetWidgetState();
}

class _ConfirmationBottomSheetWidgetState
    extends State<ConfirmationBottomSheetWidget> {
  late ConfirmationBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmationBottomSheetModel());

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
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (widget.dialogTitle != null &&
                            widget.dialogTitle != '')
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.dialogTitle,
                                'Título do diálogo',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        if (widget.dialogMessage != null &&
                            widget.dialogMessage != '')
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.dialogMessage,
                                'Mensagem',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ),
                  if (widget.showPrimary)
                    FFButtonWidget(
                      onPressed: () async {
                        await widget.clickPrimary?.call();
                        Navigator.pop(context);
                      },
                      text: widget.labelActionPrimary!,
                      icon: widget.iconPrimary,
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 56.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        iconPadding: EdgeInsets.all(0.0),
                        color: FlutterFlowTheme.of(context).primaryText,
                        textStyle:
                            FlutterFlowTheme.of(context).labelLarge.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(56.0),
                      ),
                    ),
                  if (widget.showSecondary1)
                    FFButtonWidget(
                      onPressed: () async {
                        await widget.clickSecondary1?.call();
                        Navigator.pop(context);
                      },
                      text: widget.labelActionSecondary1!,
                      icon: widget.iconSecondary1,
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 56.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        iconPadding: EdgeInsets.all(0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .labelLarge
                            .override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontStyle,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(56.0),
                      ),
                    ),
                  if (widget.showSecondary2)
                    FFButtonWidget(
                      onPressed: () async {
                        await widget.clickSecondary2?.call();
                        Navigator.pop(context);
                      },
                      text: widget.labelActionSecondary2!,
                      icon: widget.iconSecondary2,
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 56.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        iconPadding: EdgeInsets.all(0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .labelLarge
                            .override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontStyle,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(56.0),
                      ),
                    ),
                  if (widget.showDestructive)
                    FFButtonWidget(
                      onPressed: () async {
                        await widget.clickDestructive?.call();
                        Navigator.pop(context);
                      },
                      text: widget.labelActionDestructive!,
                      icon: widget.iconDestructive,
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 56.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        iconPadding: EdgeInsets.all(0.0),
                        color: Color(0x1AF32929),
                        textStyle:
                            FlutterFlowTheme.of(context).labelLarge.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).error,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
            Container(
              height: 80.0,
              decoration: BoxDecoration(),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: widget.labelDismiss,
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        iconPadding: EdgeInsets.all(16.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .labelLarge
                            .override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontStyle,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
