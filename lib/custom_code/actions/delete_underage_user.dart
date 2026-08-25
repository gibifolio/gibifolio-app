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

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> deleteUnderageUser() async {
  const supabaseUrl = 'https://dlxinhmwtgrsqhwhmepg.supabase.co';

  final session = SupaFlow.client.auth.currentSession;
  if (session == null) return;

  await http.post(
    Uri.parse('$supabaseUrl/functions/v1/delete-underage-user'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${session.accessToken}',
    },
  );
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
