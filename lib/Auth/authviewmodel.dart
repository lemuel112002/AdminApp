import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthViewModel extends ChangeNotifier {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> signUp(
    String email,
    String password,
    VoidCallback onSuccess,
    Function(String) onError,
  ) async {
    try {
      await supabase.auth.signUp(email: email, password: password);
      onSuccess();
    } catch (e) {
      onError(e.toString());
    }
  }

  Future<void> signIn(
    String email,
    String password,
    VoidCallback onSuccess,
    Function(String) onError,
  ) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
      onSuccess();
    } catch (e) {
      onError(e.toString());
    }
  }
}
