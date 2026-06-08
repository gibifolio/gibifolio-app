import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_page_widget.dart' show OnboardingPageWidget;
import 'package:flutter/material.dart';

class OnboardingPageModel extends FlutterFlowModel<OnboardingPageWidget> {
  ///  Local state fields for this page.

  DateTime? birthDate;

  bool acceptedTerms = false;

  bool acceptedPrivacy = false;

  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // Stores action output result for [Custom Action - completeOnboarding] action in Button widget.
  String? onboardingOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
