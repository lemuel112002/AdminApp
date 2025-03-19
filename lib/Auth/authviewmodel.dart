import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthViewModel extends ChangeNotifier {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> signIn(
    String email,
    String password,
    VoidCallback onSuccess,
    Function(String) onError,
  ) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      debugPrint("Login Response: ${response.user}");

      if (response.user != null) {
        final userEmail = response.user!.email?.toLowerCase();
        debugPrint("Email: $userEmail");

        if (userEmail == "admin@gmail.com") {
          debugPrint("Admin login success!");
          onSuccess();
        } else {
          debugPrint("Non-admin login attempt.");
          onError("Only admin can log in.");
        }
      } else {
        debugPrint("Login failed: Invalid email or password.");
        onError("Invalid email or password.");
      }
    } catch (e) {
      debugPrint("Login Error: ${e.toString()}");
      onError("Authentication failed. Check your credentials.");
    }
  }
}
