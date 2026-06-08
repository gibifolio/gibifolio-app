// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future<String> completeOnboarding(
  DateTime birthDate,
  String termsVersion,
) async {
  try {
    final userId = SupaFlow.client.auth.currentUser?.id;
    if (userId == null) return 'Usuário não autenticado';

    final response = await SupaFlow.client.from('users').update({
      'birth_date': birthDate.toIso8601String().substring(0, 10),
      'terms_accepted_at': DateTime.now().toUtc().toIso8601String(),
      'terms_version': termsVersion,
    }).eq('user_id', userId);

    return '';
  } catch (e) {
    return e.toString();
  }
}
