import '/components/skeletons/text_skeleton/text_skeleton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'brands_skeleton_model.dart';
export 'brands_skeleton_model.dart';

class BrandsSkeletonWidget extends StatefulWidget {
  const BrandsSkeletonWidget({super.key});

  @override
  State<BrandsSkeletonWidget> createState() => _BrandsSkeletonWidgetState();
}

class _BrandsSkeletonWidgetState extends State<BrandsSkeletonWidget> {
  late BrandsSkeletonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrandsSkeletonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: Align(
        alignment: AlignmentDirectional(-1.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.textSkeletonModel1,
                updateCallback: () => safeSetState(() {}),
                child: TextSkeletonWidget(
                  width: 72.0,
                  height: 72.0,
                  borderRadius: 1000.0,
                ),
              ),
              wrapWithModel(
                model: _model.textSkeletonModel2,
                updateCallback: () => safeSetState(() {}),
                child: TextSkeletonWidget(
                  width: 72.0,
                  height: 72.0,
                  borderRadius: 1000.0,
                ),
              ),
              wrapWithModel(
                model: _model.textSkeletonModel3,
                updateCallback: () => safeSetState(() {}),
                child: TextSkeletonWidget(
                  width: 72.0,
                  height: 72.0,
                  borderRadius: 1000.0,
                ),
              ),
              wrapWithModel(
                model: _model.textSkeletonModel4,
                updateCallback: () => safeSetState(() {}),
                child: TextSkeletonWidget(
                  width: 72.0,
                  height: 72.0,
                  borderRadius: 1000.0,
                ),
              ),
            ].divide(SizedBox(width: 16.0)).around(SizedBox(width: 16.0)),
          ),
        ),
      ),
    );
  }
}
