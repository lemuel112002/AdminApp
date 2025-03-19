// ignore_for_file: library_private_types_in_public_api, unused_import
import 'package:adminapp/AdminDashboard/admindashboard.dart';
import 'package:adminapp/Auth/authscreen.dart';
import 'package:adminapp/Auth/authviewmodel.dart';
import 'package:adminapp/LoadingScreen/loadingscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://pjiqytbtcvixsxiswtiz.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBqaXF5dGJ0Y3ZpeHN4aXN3dGl6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzYxNzY4MDMsImV4cCI6MjA1MTc1MjgwM30.dOMzNgEzzEjoyZctQfwy05qhPyB232cf2EouvaVklgw",
  );

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String currentScreen = "auth"; // Default screen

  void navigateTo(String screen) {
    setState(() {
      currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Builder(
            builder: (context) {
              switch (currentScreen) {
                case "auth":
                  return AuthScreen(
                    onLoginSuccess: () => navigateTo("loading"),
                  );
                case "loading":
                  return LoadingScreen(
                    onLoadingComplete: () => navigateTo("dashboard"),
                  );
                case "dashboard":
                  return const AdminDashboard();
                default:
                  return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
