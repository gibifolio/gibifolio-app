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
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';

Future<bool> signInWithMagicLink(String email) async {
  try {
    final redirectTo = kIsWeb
        ? 'https://app.gibifolio.com.br/'
        : 'gibifolio://gibifolio.com/login-callback';

    await Supabase.instance.client.auth.signInWithOtp(
      email: email,
      emailRedirectTo: redirectTo,
    );
    return true;
  } catch (e) {
    print('Magic Link error: $e');
    return false;
  }
}
