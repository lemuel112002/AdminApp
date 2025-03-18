// ignore_for_file: library_private_types_in_public_api
import 'package:adminapp/AdminDashboard/admindashboard.dart';
import 'package:adminapp/Auth/authscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String currentScreen = "dashboard"; // Default screen

  void navigateTo(String screen) {
    setState(() {
      currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(
          builder: (context) {
            switch (currentScreen) {
              case "auth":
                return AuthScreen(onLoginSuccess: () => navigateTo("loading"));
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
    );
  }
}

class LoadingScreen extends StatelessWidget {
  final VoidCallback onLoadingComplete;
  const LoadingScreen({required this.onLoadingComplete, super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), onLoadingComplete);
    return const Center(child: CircularProgressIndicator());
  }
}
