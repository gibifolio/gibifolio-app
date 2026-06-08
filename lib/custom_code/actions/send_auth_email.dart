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
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> sendAuthEmail(String email) async {
  const supabaseUrl = 'https://dlxinhmwtgrsqhwhmepg.supabase.co';
  const anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRseGluaG13dGdyc3Fod2htZXBnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzEzODkyNDgsImV4cCI6MjA4Njk2NTI0OH0.9t6w8fPOOT-g8y2betipbiW42yGkHvwAjENCjSf14hU';

  // 1. Verificar se o usuário existe
  final checkResponse = await http.post(
    Uri.parse('$supabaseUrl/functions/v1/check-user-exists'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $anonKey',
    },
    body: jsonEncode({'email': email}),
  );

  final exists = jsonDecode(checkResponse.body)['exists'] as bool;

  // 2. Enviar o email correto
  if (exists) {
    // Usuário existente: magic link
    await SupaFlow.client.auth.signInWithOtp(
      email: email,
      emailRedirectTo: 'https://app.gibifolio.com.br',
    );
    return false; // não é novo usuário
  } else {
    // Novo usuário: email de confirmação de cadastro
    await SupaFlow.client.auth.signUp(
      email: email,
      password: '', // magic link não usa senha
      emailRedirectTo: 'https://app.gibifolio.com.br/onboarding',
    );
    return true; // é novo usuário
  }
}
