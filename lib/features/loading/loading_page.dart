import 'package:flutter/material.dart';
import '../dashboard/presentation/pages/main_dashboard.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  navigateToDashboard() async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardTemplate()));
  }

  @override
  void initState() {
    super.initState();
    navigateToDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Loading..."),
    );
  }
}
